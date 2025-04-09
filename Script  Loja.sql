create database loja;
use loja;

CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    endereco TEXT
);

CREATE TABLE produtos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    estoque INTEGER NOT NULL
);

CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    cliente_id INTEGER REFERENCES clientes(id),
    produto_id INTEGER REFERENCES produtos(id),
    quantidade INTEGER NOT NULL,
    data_pedido DATE NOT NULL
);

-- Inserindo registros na tabela clientes
INSERT INTO clientes (nome, email, telefone, endereco) VALUES
('João Silva', 'joao@email.com', '1111-1111', 'Rua A, 123'),
('Maria Souza', 'maria@email.com', '2222-2222', 'Rua B, 456'),
('Carlos Pereira', 'carlos@email.com', '3333-3333', 'Rua C, 789'),
('Ana Lima', 'ana@email.com', NULL, 'Rua D, 321'),
('Bruno Castro', 'bruno@email.com', '5555-5555', 'Rua E, 654'),
('Fernando Alves', 'fernando@email.com', NULL, NULL),
('Tatiane Mendes', 'tatiane@email.com', '7777-7777', 'Rua G, 987'),
('Diego Moreira', 'diego@email.com', '8888-8888', 'Rua H, 147'),
('Larissa Rocha', 'larissa@email.com', NULL, 'Rua I, 258'),
('Pedro Nogueira', 'pedro@email.com', '1010-1010', 'Rua J, 369');

-- Inserindo registros na tabela produtos
INSERT INTO produtos (nome, descricao, preco, estoque) VALUES
('Notebook Dell', 'Core i7, 16GB RAM, SSD 512GB', 4500.00, 20),
('Smartphone Samsung', '128GB, Tela 6.4"', 2500.00, 30),
('Fone Bluetooth', 'Cancelamento de ruído', 500.00, 50),
('Monitor LG', 'Full HD, 24 polegadas', 800.00, 25),
('Teclado Mecânico', 'RGB, Switch Red', 350.00, 40),
('Mouse Gamer', '16000 DPI, RGB', 250.00, 35),
('Impressora HP', 'Multifuncional Wi-Fi', 1200.00, 15),
('Cadeira Gamer', 'Reclinável, Preto/Vermelho', 950.00, 10),
('Microfone Condensador', 'USB, Profissional', 400.00, 12),
('Webcam Full HD', '1080p, Autofoco', 300.00, 18);

-- Inserindo registros na tabela pedidos
INSERT INTO pedidos (cliente_id, produto_id, quantidade, data_pedido) VALUES
(1, 1, 2, '2025-03-01'),
(2, 3, 1, '2025-03-02'),
(3, 5, 1, '2025-03-03'),
(4, 7, 3, '2025-03-04'),
(5, 9, 2, '2025-03-05'),
(NULL, 2, 1, '2025-03-06'), -- Pedido sem cliente associado
(7, NULL, 1, '2025-03-07'), -- Pedido sem produto associado
(8, 4, 2, '2025-03-08'),
(9, 6, 1, '2025-03-09'),
(10, 8, 1, '2025-03-10');

-- 1) Contar o número total de clientes
 select count(*) from clientes;
-- 2) Contar o número total de pedidos
select count(*) from pedidos;
-- 3) Calcular o valor total de todos os pedidos
select sum(r.quantidade * p.preco) from pedidos as r join produtos as p on  r.produto_id = p.id  group by r.produto_id;
-- 4) Calcular a média de preço dos produtos
select avg(preco) from produtos;
-- 5) Listar todos os clientes e seus pedidos
select * from clientes as c join pedidos as p on c.id = p.cliente_id;
-- 6) Listar todos os pedidos e seus produtos, incluindo pedidos sem produtos
select *from pedidos as p left join produtos as r on p.produto_id = r.id;
-- 7) Listar os produtos mais caros primeiro
select preco from produtos order by preco desc;
-- 8) Listar os produtos com menor estoque
select estoque,nome from produtos order by estoque asc limit 5;
-- 9) Contar quantos pedidos foram feitos por cliente
select count(*) from pedidos where cliente_id != 0;
-- 10) Contar quantos produtos diferentes foram vendidos
select produto_id from pedidos;
-- 11) Mostrar os clientes que não realizaram pedidos
select nome,produto_id from clientes as c left join pedidos as p on c.id = p.cliente_id order by produto_id;
-- 12) Mostrar os produtos que nunca foram vendidos
select nome,produto_id from produtos as p left join pedidos as r on p.id = r.produto_id order by produto_id;
-- 13) Contar o número de pedidos feitos por dia
select data_pedido, count(data_pedido) from pedidos group by data_pedido;
-- 14) Listar os produtos mais vendidos
select nome,quantidade from pedidos as r join produtos as p on r.produto_id = p.id order by quantidade desc;
-- 15) Encontrar o cliente que mais fez pedidos
select nome,quantidade from clientes as c join pedidos as p on c.id = p.cliente_id order by quantidade desc limit 1;
-- 16) Listar os pedidos e os clientes que os fizeram, incluindo pedidos sem clientes
select * from pedidos as p left join clientes as c on p.cliente_id = c.id;
-- 17) Listar os produtos e o total de vendas por produto
select nome,quantidade,sum(r.quantidade * p.preco) from produtos as p join pedidos as r on p.id = r.produto_id group by r.quantidade,nome order by quantidade;
-- 18) Calcular a média de quantidade de produtos por pedido
select nome,avg(quantidade) from produtos as p join pedidos as r on p.id = r.produto_id group by nome;
-- 19) Listar os pedidos ordenados por data (mais recentes primeiro)
select data_pedido from pedidos order by data_pedido desc;
-- 20) Contar quantos clientes possuem telefone cadastrado
select count(*) from clientes where telefone != 0;
-- 21) Encontrar o cliente que gastou mais dinheiro em pedidos.
select cliente_id,sum(p.preco * r.quantidade) from pedidos as r join produtos as p on r.produto_id = p.id group by cliente_id limit 1;
-- 22) Listar os 5 produtos mais vendidos.
select nome,quantidade from produtos as p join pedidos as r on p.id = r.produto_id order by quantidade desc limit 5;
-- 23) Listar os clientes que já fizeram pedidos e o número de pedidos de cada um.
select nome,cliente_id,count(quantidade) from clientes as c join pedidos as p on c.id = p.cliente_id group by nome,cliente_id;
-- 24) Encontrar a data com mais pedidos realizados
select data_pedido,count(quantidade) from pedidos group by data_pedido; 
-- 25) Calcular a média de valor gasto por pedido
select avg(p.preco * r.quantidade) from produtos as p join pedidos as r on p.id = r.produto_id;
