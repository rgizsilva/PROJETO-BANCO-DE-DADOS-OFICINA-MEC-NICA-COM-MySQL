USE oficina_mecanica;

-- Relação de ordens , clientes e valores 

SELECT c.nome as Nome_cliente, c.endereco, o.data_criacao, o.data_entrega, o.descricao as Descrição_ordem,
o.status, o.tipo_pagamento, v.valor as Valor_servico,p.valor as Valor_pecas, COALESCE( v.valor, 0 ) + COALESCE( p.valor, 0 )  AS Valor_Total FROM cliente c LEFT JOIN ordem_servico o
ON o.cliente_id = c.id
LEFT JOIN valor_servico_em_ordem va
ON va.ordem_servico_id = o.id
LEFT JOIN valor_servico v
ON va.valor_servico_id = v.id
LEFT JOIN peca_em_ordem pe
ON pe.ordem_servico_id = o.id
LEFT JOIN pecas p
ON pe.pecas_id = p.id
WHERE o.cliente_id = c.id 
GROUP BY o.id;

-- Relação ordens e mecânicos e sua especialidade

SELECT o.id as id_ordem, o.descricao, m.nome as Nome_mecanico, e.especialidade, m.endereco, m.id FROM ordem_servico o JOIN equipe_mecanico eq
ON eq.ordem_servico_id = o.id
JOIN mecanico m 
ON eq.mecanico_id = m.id
JOIN especialidade_em_mecanico es
ON es.mecanico_id = m.id
JOIN especialidade e
ON es.especialidade_mecanico_id = e.id
ORDER BY o.id;

-- Todas as ordens em andamento 

SELECT o.id as id_ordem, o.data_criacao,o.data_entrega,o.descricao,o.status,o.tipo_pagamento, c.nome as Nome_cliente FROM ordem_servico o LEFT JOIN cliente c
ON o.cliente_id = c.id
WHERE status = 'EM ANDAMENTO';

-- Todas as ordens criadas ate a data atual

SELECT o.id as id_ordem, o.data_criacao,o.data_entrega,o.descricao,o.status,o.tipo_pagamento, c.nome as Nome_cliente FROM ordem_servico o LEFT JOIN cliente c
ON o.cliente_id = c.id
WHERE o.data_entrega < CURDATE() and o.status = 'CRIADA';