CREATE SCHEMA desafio;

USE desafio;

CREATE TABLE aluno (
id INT NOT NULL,
nome VARCHAR(100) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE,
email VARCHAR(100) UNIQUE,
telefone VARCHAR(20),
cidade VARCHAR(100),
PRIMARY KEY (id)
);

CREATE TABLE professor (
id INT NOT NULL,
nome VARCHAR(100) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE,
email VARCHAR(100) UNIQUE,
telefone VARCHAR(20),
cidade VARCHAR(100),
PRIMARY KEY (id)
);


-- inserindo dados na tabela aluno
INSERT INTO aluno (id, nome, cpf, email, telefone, cidade) VALUES
(1, 'Ana Souza', '12345678901', 'ana.souza@email.com', '11999990001', 'Bayeux'),
(2, 'Bruno Lima', '12345678902', 'bruno.lima@email.com', '11999990002', 'Cabedelo'),
(3, 'Carla Mendes', '12345678903', 'carla.mendes@email.com', '11999990003', 'João Pessoa'),
(4, 'Daniel Rocha', '12345678904', 'daniel.rocha@email.com', '11999990004', 'João Pessoa'),
(5, 'Eduarda Pires', '12345678905', 'eduarda.pires@email.com', '11999990005', 'Bayeux'),
(6, 'Felipe Torres', '12345678906', 'felipe.torres@email.com', '11999990006', 'Sapé'),
(7, 'Giovana Nunes', '12345678907', 'giovana.nunes@email.com', '11999990007', 'Sapé'),
(8, 'Henrique Alves', '12345678908', 'henrique.alves@email.com', '11999990008', 'Patos'),
(9, 'Isabela Martins', '12345678909', 'isabela.martins@email.com', '11999990009', 'João Pessoa'),
(10, 'João Pedro', '12345678910', 'joao.pedro@email.com', '11999990010', 'João Pessoa');

-- inserindo dados na tabela professor
INSERT INTO professor (id, nome, cpf, email, telefone, cidade) VALUES
(1, 'Marcos Silva', '22345678901', 'marcos.silva@escola.com', '11988880001', 'João Pessoa'),
(2, 'Patrícia Gomes', '22345678902', 'patricia.gomes@escola.com', '11988880002', 'João Pessoa'),
(3, 'Ricardo Dias', '22345678903', 'ricardo.dias@escola.com', '11988880003', 'João Pessoa'),
(4, 'Sônia Tavares', '22345678904', 'sonia.tavares@escola.com', '11988880004', 'Patos'),
(5, 'Thiago Leal', '22345678905', 'thiago.leal@escola.com', '11988880005', 'Sapé'),
(6, 'Vanessa Costa', '22345678906', 'vanessa.costa@escola.com', '11988880006', 'Sapé'),
(7, 'Wagner Moraes', '22345678907', 'wagner.moraes@escola.com', '11988880007', 'João Pessoa'),
(8, 'Yasmin Ribeiro', '22345678908', 'yasmin.ribeiro@escola.com', '11988880008', 'Patos'),
(9, 'Zeca Barreto', '22345678909', 'zeca.barreto@escola.com', '11988880009', 'João Pessoa'),
(10, 'Lívia Fernandes', '22345678910', 'livia.fernandes@escola.com', '11988880010', 'Natal');

SELECT * from aluno;
SELECT * from professor;

-- fazendo um update, aluno mudou o email
UPDATE aluno
SET  email = 'anasouzanovo@email.com'
WHERE id = 1;

-- deletando o professor de ID 1
DELETE from professor
WHERE id = 1;

-- FUNÇÕES AGREGADAS

-- contando quantos alunos tem na tabela
SELECT COUNT(*) 
FROM aluno;

-- contando quantos professores tem na tabela
SELECT COUNT(*)
FROM professor;

-- mostrando o menor ID registrado da tabela aluno
SELECT MIN(id)
FROM aluno;

-- mostrando o menor ID registrado da tabela professor
SELECT MIN(id)
FROM professor;

-- agrupando alunos por cidade
SELECT cidade, COUNT(*)
from aluno
GROUP BY cidade;

-- agrupando professores por cidade
SELECT cidade, COUNT(*)
from professor
GROUP BY cidade;

-- JOIN (mostra as cidades que tem alunos E professores)
SELECT a.cidade, COUNT(DISTINCT a.id) + COUNT(DISTINCT p.id) AS total_pessoas
FROM aluno a
JOIN professor p ON a.cidade = p.cidade
GROUP BY a.cidade;

-- JOIN (mostra, juntando alunos e professores, quantas pessoas tem em cada cidade)
SELECT cidade, COUNT(*) AS total_pessoas
FROM (
    SELECT cidade FROM aluno
    UNION ALL
    SELECT cidade FROM professor
) AS todos
GROUP BY cidade;


