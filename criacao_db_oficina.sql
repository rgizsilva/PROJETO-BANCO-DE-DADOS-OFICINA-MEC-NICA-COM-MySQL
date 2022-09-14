CREATE DATABASE oficina_mecanica ;

USE oficina_mecanica;

CREATE TABLE cliente (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
endereco VARCHAR(50) NOT NULL,
cidade VARCHAR(45)
);

CREATE TABLE especialidade (
id INT PRIMARY KEY AUTO_INCREMENT,
especialidade VARCHAR(45) NOT NULL
);


CREATE TABLE pecas(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
valor DECIMAL(7,2)
);


CREATE TABLE mecanico(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
endereco VARCHAR(45) NOT NULL
);

CREATE TABLE valor_servico(
id INT PRIMARY KEY AUTO_INCREMENT,
descricao VARCHAR(45) NOT NULL,
valor DECIMAL(7,2) NOT NULL
);

CREATE TABLE ordem_servico(
id INT PRIMARY KEY AUTO_INCREMENT,
cliente_id INT,
data_criacao DATE,
data_entrega DATE NOT NULL,
descricao VARCHAR(45) NOT NULL,
status ENUM('CRIADA', 'EM ANDAMENTO', 'CONCLUIDA', 'CANCELADA'),
tipo_pagamento CHAR(1),
CONSTRAINT fk_cliente_ordem FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

CREATE TABLE valor_servico_em_ordem(
valor_servico_id INT,
ordem_servico_id INT,
PRIMARY KEY (valor_servico_id,ordem_servico_id),
CONSTRAINT fk_valor_servico FOREIGN KEY (valor_servico_id) REFERENCES valor_servico(id),
CONSTRAINT fk_ordem_servico FOREIGN KEY (ordem_servico_id) REFERENCES ordem_servico(id)
);

CREATE TABLE peca_em_ordem(
ordem_servico_id INT,
pecas_id INT,
quantidade INT NOT NULL,
PRIMARY KEY (ordem_servico_id,pecas_id),
CONSTRAINT fk_ordem_servico_pecas FOREIGN KEY (ordem_servico_id) REFERENCES ordem_servico(id),
CONSTRAINT fk_pecas_servico_ FOREIGN KEY (pecas_id) REFERENCES pecas(id)
);

CREATE TABLE equipe_mecanico(
mecanico_id INT,
ordem_servico_id INT,
PRIMARY KEY (mecanico_id,ordem_servico_id),
CONSTRAINT fk_equipe_mecanico FOREIGN KEY (mecanico_id) REFERENCES mecanico(id),
CONSTRAINT fk_ordem_mecanico FOREIGN KEY (ordem_servico_id) REFERENCES ordem_servico(id)
);

CREATE TABLE especialidade_em_mecanico(
especialidade_mecanico_id INT,
mecanico_id INT,
PRIMARY KEY (especialidade_mecanico_id,mecanico_id),
CONSTRAINT fk_especialidade_mecanico FOREIGN KEY (especialidade_mecanico_id) REFERENCES especialidade(id),
CONSTRAINT fk_mecanico_idd FOREIGN KEY (mecanico_id) REFERENCES mecanico(id)
);

