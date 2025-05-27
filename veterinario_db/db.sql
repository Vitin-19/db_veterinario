CREATE DATABASE IF NOT EXISTS db_veterinaria;
USE db_veterinaria;

CREATE TABLE IF NOT EXISTS tipo(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS dieta(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    dieta VARCHAR(9) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS veterinario(
    crv VARCHAR(5) NOT NULL PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    endereco TEXT NOT NULL,
    telefone VARCHAR(9), 
    cpf VARCHAR(11) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS cliente(
    cpf VARCHAR(11) NOT NULL PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    endereco TEXT NOT NULL,
    telefone VARCHAR(11) NOT NULL
);

CREATE TABLE IF NOT EXISTS animal(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(20),
    tipo INT NOT NULL,
    raca VARCHAR(20),
    idade INT CHECK (idade <= 99),
    alergico BOOLEAN,
    dieta INT NOT NULL,
    peso DECIMAL(4,2) NOT NULL,
    altura DECIMAL(2,2) NOT NULL,
    cpf_dono VARCHAR(11) NOT NULL,
    FOREIGN KEY (tipo) REFERENCES tipo (id),
    FOREIGN KEY (dieta) REFERENCES dieta (id),
    FOREIGN KEY (cpf_dono) REFERENCES cliente (cpf)
);

CREATE TABLE IF NOT EXISTS consulta(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    data_horario DATETIME NOT NULL,
    valor DECIMAL(5,2) NOT NULL, 
    diagnostico TEXT NOT NULL,
    crv_veterinario VARCHAR(5) NOT NULL,
    id_animal INT NOT NULL,
    FOREIGN KEY (crv_veterinario) REFERENCES veterinario (crv),
    FOREIGN KEY (id_animal) REFERENCES animal (id)
);

INSERT INTO dieta (dieta) VALUES 
('Herbivoro'),
('Carnivoro'),
('Onivoro');

INSERT INTO tipo (tipo) VALUES 
('Cachorro'),
('Gato'),
('Coelho'),
('Papagaio'),
('Hamster'),
('Tartaruga'),
('Cavalo'),
('Porquinho-da-india'),
('Furão'),
('Arara');

INSERT INTO cliente (cpf, nome, endereco, telefone) VALUES
('11111111111', 'Ana Souza', 'Rua das Flores, 100', '11999990001'),
('22222222222', 'Carlos Lima', 'Av. Brasil, 200', '11999990002'),
('33333333333', 'Fernanda Dias', 'Rua A, 300', '11999990003'),
('44444444444', 'João Silva', 'Rua B, 400', '11999990004'),
('55555555555', 'Mariana Costa', 'Av. Central, 500', '11999990005'),
('66666666666', 'Rafael Mendes', 'Rua C, 600', '11999990006'),
('77777777777', 'Paula Rocha', 'Rua D, 700', '11999990007'),
('88888888888', 'Lucas Ferreira', 'Av. Paulista, 800', '11999990008'),
('99999999999', 'Juliana Martins', 'Rua E, 900', '11999990009'),
('00000000000', 'Bruno Almeida', 'Rua F, 1000', '11999990010');

INSERT INTO veterinario (crv, nome, endereco, telefone, cpf) VALUES
('10001', 'Dra. Camila Torres', 'Rua Vet1, 101', '998880001', '12345678901'),
('10002', 'Dr. Pedro Santos', 'Av. Vet2, 202', '998880002', '12345678902'),
('10003', 'Dra. Aline Carvalho', 'Rua Vet3, 303', '998880003', '12345678903'),
('10004', 'Dr. Luiz Fonseca', 'Rua Vet4, 404', '998880004', '12345678904'),
('10005', 'Dra. Bianca Ribeiro', 'Av. Vet5, 505', '998880005', '12345678905'),
('10006', 'Dr. Felipe Lima', 'Rua Vet6, 606', '998880006', '12345678906'),
('10007', 'Dra. Marina Almeida', 'Rua Vet7, 707', '998880007', '12345678907'),
('10008', 'Dr. Thiago Souza', 'Av. Vet8, 808', '998880008', '12345678908'),
('10009', 'Dra. Renata Castro', 'Rua Vet9, 909', '998880009', '12345678909'),
('10010', 'Dr. Gustavo Fernandes', 'Rua Vet10, 1010', '998880010', '12345678910');

INSERT INTO animal (nome, tipo, raca, idade, alergico, dieta, peso, altura, cpf_dono) VALUES
('Bolt', 1, 'Labrador', 3, FALSE, 3, 25.50, 0.60, '11111111111'),
('Mia', 2, 'Persa', 2, TRUE, 2, 4.20, 0.30, '22222222222'),
('Pipoca', 3, 'Mini Lop', 1, FALSE, 1, 2.10, 0.25, '33333333333'),
('Louro', 4, 'Amazona', 5, FALSE, 1, 0.80, 0.40, '44444444444'),
('Snow', 5, 'Sírio', 1, TRUE, 3, 0.15, 0.12, '55555555555'),
('Rafa', 6, 'Tartaruga Verde', 10, FALSE, 1, 12.00, 0.50, '66666666666'),
('Trovão', 7, 'Mangalarga', 7, FALSE, 1, 450.00, 1.70, '77777777777'),
('Fofinho', 8, 'Abyssinian', 2, FALSE, 1, 1.20, 0.20, '88888888888'),
('Zig', 9, 'Furão Europeu', 4, TRUE, 2, 1.10, 0.30, '99999999999'),
('Blue', 10, 'Arara Azul', 3, FALSE, 1, 1.50, 0.90, '00000000000');

INSERT INTO consulta (data_horario, valor, diagnostico, crv_veterinario, id_animal) VALUES
('2025-05-01 10:00:00', 120.00, 'Vacinação anual.', '10001', 1),
('2025-05-02 14:30:00', 150.50, 'Tratamento de alergia na pele.', '10002', 2),
('2025-05-03 09:00:00', 90.00, 'Exame de rotina.', '10003', 3),
('2025-05-04 11:15:00', 200.00, 'Fratura na asa, realizou imobilização.', '10004', 4),
('2025-05-05 15:00:00', 80.00, 'Vermifugação.', '10005', 5),
('2025-05-06 16:45:00', 180.00, 'Troca de carapaça, revisão geral.', '10006', 6),
('2025-05-07 10:00:00', 300.00, 'Claudicação, exame ortopédico.', '10007', 7),
('2025-05-08 13:30:00', 95.00, 'Exame de fezes e vermifugação.', '10008', 8),
('2025-05-09 09:45:00', 160.00, 'Infecção de ouvido, prescrição de antibióticos.', '10009', 9),
('2025-05-10 11:00:00', 220.00, 'Aparecimento de penas opacas, realizou exames.', '10010', 10);
