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
    ,   CONSTRAINT unq_username UNIQUE(username)
);

CREATE TABLE questao (
        id INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1)
    ,   texto VARCHAR(1024) NOT NULL
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
    ,   dt_partida DATE NOT NULL DEFAULT CURRENT_DATE
    ,   pontuacao INTEGER NOT NULL DEFAULT 0
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

-- Insere questões
INSERT INTO QUESTAO(TEXTO) VALUES('Imagine que você foi dar um salto de paraquedas, de repente ao saltar você sai da posição correta e acaba escorregando. O que fazer para se salvar?');
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('Puxar a corda do paraquedas', false, 1);
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('Abrir os braços para gerar resistência', false, 1);
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('Agarrar as canelas e esperar pelo melhor', true, 1);
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('I believe I can fly', false, 1);

INSERT INTO QUESTAO(TEXTO) VALUES('Imagine que um motoqueiro foi dar um passeio de moto pela cidade, de repente, um carro perde o controle e derrapa no meio da estrada. O motoqueiro tenta escapar, mas cai da moto e fica preso embaixo do carro. Em segundos, o carro e a moto pegam fogo. Imagine que você foi uma das primeiras pessoas a chegar no local do acidente. O que fazer para salvar o motoqueiro?');
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('Pedir ajuda e levantar o carro', true, 2);
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('Usar o seu carro pra afastar a moto', false, 2);
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('Entrar no carro e afastá-lo do motoqueiro', false, 2);
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('Chamar o Superman', false, 2);

INSERT INTO QUESTAO(TEXTO) VALUES('Imagine que você foi dar um mergulho no Oceano Pacífico e de repente encontra um polvo gigante, que se sente ameaçado e gruda em você. O que fazer para se salvar?');
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('Usar força bruta pra se soltar', false, 3);
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('Apertar as ventosas do polvo', true, 3);
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('Soltar o peso e voltar a superfície', false, 3);
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('Sashimi de Polvo', false, 3);

INSERT INTO QUESTAO(TEXTO) VALUES('Imagine que uma mulher foi no zoológico pra tirar foto com um urso polar e o animal a pega pela perna. Você vê a cena e fica desesperado. O que fazer para salvar a moça?');
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('Abrir a boca do urso usando um galho', false, 4);
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('Bater com galhos no chão para assustar o urso', true, 4);
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('Acertar o rosto do urso', false, 4);
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('Colocar outra moça no lugar', false, 4);

INSERT INTO QUESTAO(TEXTO) VALUES('Imagine que você está dirigindo no Japão e, de repente, sente um terremoto e em segundos, se vê diante de um tsunami. O que fazer para se salvar?');
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('Conduzir o carro como um barco', false, 5);
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('Abandonar o carro e buscar um lugar alto', true, 5);
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('Subir no carro', false, 5);
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('Esperar e surfar a maior onda da vida', false, 5);

INSERT INTO QUESTAO(TEXTO) VALUES('Imagine que você foi esquiar na montanha e sem aviso você acaba caindo num grande buraco que estava escondido na neve ao redor de uma árvore. O que fazer para se salvar?');
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('Abrir espaço com as pernas para deixar o ar entrar', false, 6);
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('Abraçar a árvore', false, 6);
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('Cobrir a boca com as mãos', true, 6);
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('Cair na neve macia.', false, 6);

INSERT INTO QUESTAO(TEXTO) VALUES('Imagine que você foi fazer um passeio de caiaque e de repente caiu num vórtice de água, uma espécie de redemoinho. Para variar, outro caiaque caiu em cima de você. Rapidamente, lançam uma corda. O que fazer para se salvar?');
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('Lutar para manter a cabeça fora da água', false, 7);
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('Enrolar-se na corda', false, 7);
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('Encolher-se e se deixar levar pela correnteza', true, 7);
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('Boiar e aguardar socorro', false, 7);

INSERT INTO QUESTAO(TEXTO) VALUES('Imagine que você foi fazer um passeio de carro e de repente a estrada começa a ficar cercada de fogo. O que fazer para se salvar?');
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('Parar o carro e ligar o ar condicionado', true, 8);
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('Atravessar as chamas', false, 8);
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('Fugir das chamas', false, 8);
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('Parar pra fazer churrasco', false, 8);

INSERT INTO QUESTAO(TEXTO) VALUES('Imagine que você é passageiro no banco da frente de um avião monomotor e de repente o avião começa a perder a altitude. O que fazer para se salvar?');
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('Pular para o banco de trás e se preparar para a queda', false, 9);
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('Abrir a porta e proteger a cabeça', true, 9);
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('Abaixar a cabeça e colocá-la entre as pernas', false, 9);
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('Trocar de lugar com o passageiro de trás', false, 9);

INSERT INTO QUESTAO(TEXTO) VALUES('Imagine que você está passeando de carro pelo Centro-Oeste dos Estados Unidos e de repente um tornado vem na sua direção. Você tenta escapar, mas não conhece a região e acaba entrando numa rua sem saída. O que fazer para se salvar?');
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('Proteger-se debaixo de uma ponte ou um viaduto', false, 10);
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('Abandonar o carro e deitar-se no chão', true, 10);
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('Abaixar as janelas e se encolher dentro do carro', false, 10);
INSERT INTO ALTERNATIVA(TEXTO, CORRETA, QUESTAO_ID) VALUES('Se esconder dentro de um latão de lixo', false, 10);