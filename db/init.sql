CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    dtn DATE,
    dtcreate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dtupdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    dtdel TIMESTAMP NULL
);

-- Inserção de dados fictícios
INSERT INTO users (nome, email, dtn, dtcreate, dtupdate, dtdel) VALUES
('João Silva', 'joao.silva@example.com', '1990-01-15', NOW(), NOW(), NULL),
('Maria Oliveira', 'maria.oliveira@example.com', '1985-07-22', NOW(), NOW(), NULL),
('Pedro Santos', 'pedro.santos@example.com', '2000-11-30', NOW(), NOW(), NULL),
('Ana Costa', 'ana.costa@example.com', '1992-03-05', NOW(), NOW(), NULL),
('Lucas Almeida', 'lucas.almeida@example.com', '1988-09-18', NOW(), NOW(), NULL);