CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    dtn DATE,
    senha VARCHAR(255),
    dtcreate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dtupdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    dtdel TIMESTAMP NULL
);

-- Inserção de dados fictícios com hash de senha e data de criação
INSERT INTO users (nome, email, dtn, senha, dtcreate)
VALUES
('João da Silva', 'joao.silva@example.com', '1985-04-23', SHA2('senha123', 256), NOW()),
('Maria Oliveira', 'maria.oliveira@example.com', '1990-07-19', SHA2('senha456', 256), NOW()),
('Carlos Souza', 'carlos.souza@example.com', '1988-11-02', SHA2('senha789', 256), NOW()),
('Ana Paula', 'ana.paula@example.com', '1995-03-15', SHA2('senha012', 256), NOW()),
('Pedro Santos', 'pedro.santos@example.com', '1992-09-09', SHA2('senha345', 256), NOW()),
('Fernanda Lima', 'fernanda.lima@example.com', '1989-12-25', SHA2('senha678', 256), NOW()),
('Lucas Mendes', 'lucas.mendes@example.com', '1993-08-14', SHA2('senha901', 256), NOW()),
('Isabela Torres', 'isabela.torres@example.com', '1991-05-05', SHA2('senha234', 256), NOW()),
('Ricardo Pereira', 'ricardo.pereira@example.com', '1986-02-27', SHA2('senha567', 256), NOW()),
('Juliana Costa', 'juliana.costa@example.com', '1994-06-30', SHA2('senha890', 256), NOW());

