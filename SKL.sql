

CREATE DATABASE sistema;
use sistema;

CREATE TABLE produto(
cd INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
valor DECIMAL(10,2),
qtd INT);

INSERT INTO produto (nome, valor, qtd) 
VALUES
("carro", 25.50, 1000),
("pasta", 50, 1000),
("ovo", 200, 1000),
("leite", 48, 1000);

CREATE TABLE cliente(
cd INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100));

INSERT INTO cliente (nome) VALUES
("Rodolfo"),
("Wellington"),
("Jonas"),
("Oswaldo"),
("Paulo");

CREATE TABLE vendedor(
cd INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100)
);
INSERT INTO vendedor (nome) VALUES
("Vendedor 1"),
("Vendedor 2");

CREATE TABLE pedido(
cd INT PRIMARY KEY AUTO_INCREMENT,
id_vendedor INT,
id_cliente INT,
id_produto INT,
qtd INT,
FOREIGN KEY (id_produto) REFERENCES produto (cd),
FOREIGN KEY (id_cliente) REFERENCES cliente (cd),
FOREIGN KEY (id_vendedor) REFERENCES vendedor (cd)
);
CREATE TABLE comissao(
id_pedido INT,
id_vendedor INT,
valor DECIMAL(10,2),
FOREIGN KEY (id_pedido) REFERENCES pedido (cd),
FOREIGN KEY (id_vendedor) REFERENCES vendedor (cd)
);

DELIMITER $$
CREATE PROCEDURE FazerPedido (IN cliente INT, IN produto INT, IN vendedor INT, IN comissao INT, IN total INT)
BEGIN
INSERT INTO pedido (id_cliente, id_vendedor, id_produto, qtd) VALUES (cliente, vendedor, produto, total);
SET LastCd = LAST_INSERT_ID()
UPDATE produto SET 	qtd = qtd-total WHERE cd = produto;



