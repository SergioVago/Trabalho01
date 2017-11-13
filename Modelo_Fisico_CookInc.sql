CREATE TABLE USUARIO (
    email VARCHAR(100) NOT NULL ,
    senha VARCHAR(30) NOT NULL,
    nome_completo VARCHAR(100) NOT NULL,
    telefone INT,
    id_usuario int  PRIMARY KEY,
    link_imagem varchar(100),
    FK_SEXO_id_sexo int,
    FK_ENDERECO_id_endereco int,
    FK_DATA_id_data INT
);

CREATE TABLE RECEITA (
    imagem varchar(50) NOT NULL,
    modo_de_preparo VARCHAR(1000) NOT NULL,
    porcoes int NOT NULL,
    votos_positivos INT NOT NULL,
    votos_negativos INT NOT NULL,
    id_rec INT PRIMARY KEY,
    video_tutorial VARCHAR(1000),
    nome varchar(50) NOT NULL,
    FK_USUARIO_id_usuario int ,
    FK_CATEGORIA_id_cat int,
    FK_TEMPO_DE_PREPARO_id_tempo INT
);

CREATE TABLE COMENTARIO (
    texto VARCHAR(1000)  NOT NULL,
    id_coment int PRIMARY KEY,
    FK_RECEITA_id_rec INT,
    FK_USUARIO_id_usuario int ,
    FK_DATA_id_data INT,
    FK_HORA_id_hora INT
);

CREATE TABLE CATEGORIA (
    id_cat int PRIMARY KEY,
    nome varchar(50) NOT NULL
);

CREATE TABLE SEXO (
    id_sexo int PRIMARY KEY,
    m_f char(1) NOT NULL
);

CREATE TABLE COMENTARIO_SUB (
    FK_COMENTARIO_id_coment int,
    FK_DATA_id_data INT,
    FK_HORA_id_hora INT
);

CREATE TABLE ENDERECO (
    complemento varchar(50),
    numero varchar(50),
    id_endereco int PRIMARY KEY,
    FK_LOGADOURO_id_logadouro INT 
);

CREATE TABLE INGREDIENTE (
    id_ingrediente int PRIMARY KEY,
    nome varchar(100) NOT NULL,
    FK_QUANTIDADE_id_quantidade INT
);

CREATE TABLE TAG (
    id_tag int PRIMARY KEY,
    nomeTag varchar(50)
);

CREATE TABLE DATA (
    id_data INT PRIMARY KEY,
    data date NOT NULL
);

CREATE TABLE HORA (
    id_hora INT PRIMARY KEY,
    hora TIME NOT NULL
);

CREATE TABLE FAVORITO (
    FK_RECEITA_id_rec INT,
    FK_USUARIO_id_usuario int 
);

CREATE TABLE ESTADO_UF (
    id_estado INT PRIMARY KEY,
    uf CHAR(2) NOT NULL
);

CREATE TABLE MUNICIPIO (
    id_municipio INT  PRIMARY KEY,
    nome VARCHAR(50)
);

CREATE TABLE BAIRRO (
    id_bairro INT  PRIMARY KEY,
    nome VARCHAR(50),
    FK_MUNICIPIO_id_municipio INT 
);

CREATE TABLE LOGADOURO (
    id_logadouro INT  PRIMARY KEY,
    nome VARCHAR(50),
    FK_BAIRRO_id_bairro INT 
);

CREATE TABLE CEP (
    id_cep INT  PRIMARY KEY,
    cep VARCHAR(30)
);

CREATE TABLE QUANTIDADE (
    id_quantidade INT PRIMARY KEY,
    quantidade VARCHAR(30) NOT NULL
);

CREATE TABLE TEMPO_DE_PREPARO (
    id_tempo INT PRIMARY KEY,
    tempo VARCHAR(30)
);

CREATE TABLE SEGUE (
    FK_USUARIO_id_usuario int ,
    FK_USUARIO_id_usuario_ int 
);

CREATE TABLE ID_COMENTARIO (
    FK_COMENTARIO_id_coment int
);

CREATE TABLE RECEITA_INGREDIENTE (
    FK_INGREDIENTE_id_ingrediente int,
    FK_RECEITA_id_rec INT
);

CREATE TABLE RECEITA_TAG (
    FK_RECEITA_id_rec INT,
    FK_TAG_id_tag int
);

CREATE TABLE MUNICIPIO_ESTADO (
    FK_ESTADO_UF_id_estado INT,
    FK_MUNICIPIO_id_municipio INT 
);

CREATE TABLE ENDERECO_CEP (
    FK_CEP_id_cep INT ,
    FK_ENDERECO_id_endereco int
);

ALTER TABLE USUARIO ADD CONSTRAINT FK_USUARIO_1
    FOREIGN KEY (FK_SEXO_id_sexo)
    REFERENCES SEXO (id_sexo)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE USUARIO ADD CONSTRAINT FK_USUARIO_2
    FOREIGN KEY (FK_ENDERECO_id_endereco)
    REFERENCES ENDERECO (id_endereco)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE USUARIO ADD CONSTRAINT FK_USUARIO_3
    FOREIGN KEY (FK_DATA_id_data)
    REFERENCES DATA (id_data)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE RECEITA ADD CONSTRAINT FK_RECEITA_1
    FOREIGN KEY (FK_USUARIO_id_usuario)
    REFERENCES USUARIO (id_usuario)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE RECEITA ADD CONSTRAINT FK_RECEITA_2
    FOREIGN KEY (FK_CATEGORIA_id_cat)
    REFERENCES CATEGORIA (id_cat)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE RECEITA ADD CONSTRAINT FK_RECEITA_3
    FOREIGN KEY (FK_TEMPO_DE_PREPARO_id_tempo)
    REFERENCES TEMPO_DE_PREPARO (id_tempo)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE COMENTARIO ADD CONSTRAINT FK_COMENTARIO_1
    FOREIGN KEY (FK_RECEITA_id_rec)
    REFERENCES RECEITA (id_rec)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE COMENTARIO ADD CONSTRAINT FK_COMENTARIO_2
    FOREIGN KEY (FK_USUARIO_id_usuario)
    REFERENCES USUARIO (id_usuario)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE COMENTARIO ADD CONSTRAINT FK_COMENTARIO_3
    FOREIGN KEY (FK_DATA_id_data)
    REFERENCES DATA (id_data)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE COMENTARIO ADD CONSTRAINT FK_COMENTARIO_4
    FOREIGN KEY (FK_HORA_id_hora)
    REFERENCES HORA (id_hora)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE COMENTARIO_SUB ADD CONSTRAINT FK_COMENTARIO_SUB_0
    FOREIGN KEY (FK_COMENTARIO_id_coment)
    REFERENCES COMENTARIO (id_coment)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE COMENTARIO_SUB ADD CONSTRAINT FK_COMENTARIO_SUB_1
    FOREIGN KEY (FK_DATA_id_data)
    REFERENCES DATA (id_data)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE COMENTARIO_SUB ADD CONSTRAINT FK_COMENTARIO_SUB_2
    FOREIGN KEY (FK_HORA_id_hora)
    REFERENCES HORA (id_hora)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE ENDERECO ADD CONSTRAINT FK_ENDERECO_1
    FOREIGN KEY (FK_LOGADOURO_id_logadouro)
    REFERENCES LOGADOURO (id_logadouro)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE INGREDIENTE ADD CONSTRAINT FK_INGREDIENTE_1
    FOREIGN KEY (FK_QUANTIDADE_id_quantidade)
    REFERENCES QUANTIDADE (id_quantidade)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE FAVORITO ADD CONSTRAINT FK_FAVORITO_0
    FOREIGN KEY (FK_RECEITA_id_rec)
    REFERENCES RECEITA (id_rec)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE FAVORITO ADD CONSTRAINT FK_FAVORITO_1
    FOREIGN KEY (FK_USUARIO_id_usuario)
    REFERENCES USUARIO (id_usuario)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE BAIRRO ADD CONSTRAINT FK_BAIRRO_1
    FOREIGN KEY (FK_MUNICIPIO_id_municipio)
    REFERENCES MUNICIPIO (id_municipio)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE LOGADOURO ADD CONSTRAINT FK_LOGADOURO_1
    FOREIGN KEY (FK_BAIRRO_id_bairro)
    REFERENCES BAIRRO (id_bairro)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE SEGUE ADD CONSTRAINT FK_SEGUE_0
    FOREIGN KEY (FK_USUARIO_id_usuario)
    REFERENCES USUARIO (id_usuario)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE SEGUE ADD CONSTRAINT FK_SEGUE_1
    FOREIGN KEY (FK_USUARIO_id_usuario_)
    REFERENCES USUARIO (id_usuario)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE ID_COMENTARIO ADD CONSTRAINT FK_ID_COMENTARIO_0
    FOREIGN KEY (FK_COMENTARIO_id_coment)
    REFERENCES COMENTARIO (id_coment)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE RECEITA_INGREDIENTE ADD CONSTRAINT FK_RECEITA_INGREDIENTE_0
    FOREIGN KEY (FK_INGREDIENTE_id_ingrediente)
    REFERENCES INGREDIENTE (id_ingrediente)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE RECEITA_INGREDIENTE ADD CONSTRAINT FK_RECEITA_INGREDIENTE_1
    FOREIGN KEY (FK_RECEITA_id_rec)
    REFERENCES RECEITA (id_rec)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE RECEITA_TAG ADD CONSTRAINT FK_RECEITA_TAG_0
    FOREIGN KEY (FK_RECEITA_id_rec)
    REFERENCES RECEITA (id_rec)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE RECEITA_TAG ADD CONSTRAINT FK_RECEITA_TAG_1
    FOREIGN KEY (FK_TAG_id_tag)
    REFERENCES TAG (id_tag)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE MUNICIPIO_ESTADO ADD CONSTRAINT FK_MUNICIPIO_ESTADO_0
    FOREIGN KEY (FK_ESTADO_UF_id_estado)
    REFERENCES ESTADO_UF (id_estado)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE MUNICIPIO_ESTADO ADD CONSTRAINT FK_MUNICIPIO_ESTADO_1
    FOREIGN KEY (FK_MUNICIPIO_id_municipio)
    REFERENCES MUNICIPIO (id_municipio)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE ENDERECO_CEP ADD CONSTRAINT FK_ENDERECO_CEP_0
    FOREIGN KEY (FK_CEP_id_cep)
    REFERENCES CEP (id_cep)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE ENDERECO_CEP ADD CONSTRAINT FK_ENDERECO_CEP_1
    FOREIGN KEY (FK_ENDERECO_id_endereco)
    REFERENCES ENDERECO (id_endereco)
    ON DELETE SET NULL ON UPDATE CASCADE;