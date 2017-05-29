CREATE TABLE perfil (
        id INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1)
    ,   descricao VARCHAR(32) NOT NULL
);

CREATE TABLE usuario (
        id INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1)
    ,   nome VARCHAR(64) NOT NULL
    ,   username VARCHAR(32) NOT NULL
    ,   senha VARCHAR(255) NOT NULL
    ,   perfil_id INT NOT NULL
    ,   CONSTRAINT fk_perfil_id FOREIGN KEY(perfil_id) REFERENCES perfil(id)
);

CREATE TABLE questao (
        id INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1)
    ,   texto VARCHAR(255) NOT NULL
);

CREATE TABLE alternativa (
        id INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1)
    ,   texto VARCHAR(255) NOT NULL
    ,   correta BOOLEAN NOT NULL DEFAULT false
    ,   questao_id INT NOT NULL
    ,   CONSTRAINT fk_questao_id FOREIGN KEY(questao_id) REFERENCES questao(id) ON DELETE CASCADE
);

CREATE TABLE partida (
        id INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1)
    ,   dt_partida DATE NOT NULL
    ,   score INTEGER NOT NULL DEFAULT 0
    ,   usuario_id INT NOT NULL
    ,   CONSTRAINT fk_usuario_id FOREIGN KEY(usuario_id) REFERENCES usuario(id) ON DELETE CASCADE
);

CREATE TABLE alternativa_partida (
        id INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1)
    ,   alternativa_id INTEGER NOT NULL
    ,   partida_id INTEGER NOT NULL
    ,   CONSTRAINT fk_alternativa_id FOREIGN KEY(alternativa_id) REFERENCES alternativa(id) ON DELETE CASCADE
    ,   CONSTRAINT fk_partida_id FOREIGN KEY(partida_id) REFERENCES partida(id) ON DELETE CASCADE
);

-- Insere os tipos de usuário no banco de dados
INSERT INTO perfil (descricao) VALUES ('admin');
INSERT INTO perfil (descricao) VALUES ('jogador');

-- Insere usuário administrador do Quiz
INSERT INTO USUARIO(NOME, USERNAME, SENHA, PERFIL_ID) VALUES('Administrador do Quiz', 'admin', '1234', 1);