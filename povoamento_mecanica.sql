INSERT INTO cliente (nome, endereco,cidade) values
('José Miguel Avalanche', 'rua das arvores 8454', 'Sao Paulo'),
('Carol Marques', 'rua das plantas 5201', 'Belo Horizonte'),
('Daiana Prince', 'rua das motoclietas 9630', 'Goiania'),
('Carlos Andrade', 'rua  capitao 121', 'Sao Paulo'),
('Jane Prospero', 'rua das pistas 3206', 'Ribeirao Preto'),
('Luana Dodevo', 'rua dos gansos 415', 'Bahia');

 INSERT INTO especialidade (especialidade) values
 ("Mecanico carro"),
 ("Eletricista"),
 ("Mecanico Moto"),
 ("Reparador de sistemas"),
 ("Preparador e customizador");

 INSERT INTO pecas (nome,valor) values
 ("cambio", 950.00),
 ("mocinete", 150.00),
 ("freios", 890.00),
 ("pneu", 400.00),
 ("radiador", 780.00),
 ("painel", 1180.00),
 ("banco", 300.00);
 
 INSERT INTO mecanico (nome,endereco) values
 ("Joao Juden", "rua das capivaras 0014"),
 ("Miguel Silva", "rua Pedro gomide 45"),
 ("Pedro Adao", "rua Ander herrera 12"),
 ("Julio Freitas", "Av. Domingos 0014"),
 ("Paulo Gomes", "rua das maçãs 0014"),
 ("Junior Vicente", "rua Andorras 0014"),
 ("Reginaldo Silva", "Av. Paulista 0014");
 

 INSERT INTO valor_servico (descricao,valor) values
 ("troca de oleo e ...", 45.00),
 ("substituicao bancos e ...", 90.00),
 ("radiador queimado  e ...", 180.00),
 ("alinhamento e  ...", 220.00),
 ("substituir cabos  e ...", 75.00),
 ("remoçao e atualizacao ...", 1000);
 
INSERT INTO ordem_servico (data_criacao,data_entrega,descricao,status,tipo_pagamento,cliente_id) values
('2022-04-04', '2022-05-08', 'troca de pneus', 'CRIADA', 'C', 2),
('2022-04-11', '2022-05-01', 'troca de oleo', 'EM ANDAMENTO', 'D', 3),
('2022-03-04', '2022-03-18', 'remoção peca', 'CRIADA', 'D', 5),
('2022-03-15', '2022-03-22', 'reparo motor', 'CONCLUIDA', 'C', 1),
('2022-07-02', '2022-07-10', 'balanciamento', 'EM ANDAMENTO', 'C', 4),
(null, '2022-08-28', 'revisao', 'CRIADA', 'D', 2),
('2022-10-03', '2022-11-15', 'revisao', 'CANCELADA', 'C', 6);
 

INSERT INTO valor_servico_em_ordem (valor_servico_id,ordem_servico_id) values
 (5,8),
 (3,14),
 (2,8),
 (1,10),
 (5,9),
 (3,9);
 
INSERT INTO peca_em_ordem (ordem_servico_id,pecas_id,quantidade) values
 (8,4,1),
 (9,3,1),
 (11,1,2),
 (14,2,1),
 (8,2,2),
 (12,4,1);
 

INSERT INTO equipe_mecanico (mecanico_id,ordem_servico_id) values
 (1,8),
 (3,8),
 (2,10),
 (1,11),
 (4,14),
 (5,12),
 (4,11),
 (7,9);
 
INSERT INTO especialidade_em_mecanico (especialidade_mecanico_id,mecanico_id) values
(4,2),
(5,1),
(1,4),
(2,7),
(3,3),
(4,5),
(2,6),
(3,2);
 
 
 
 
 