insert into tbl_publicacao (
                            titulo,
                            anexo,
                            data_publicacao,
                            hora,
                            descricao,
                            id_usuario
                            ) values (
									'Teste 123',
                                    'https://img.elo7.com.br/product/original/3451164/capa-de-botijao-de-gas-de-croche-capa.jpg',
                                    DATE(NOW()),
                                    TIME(NOW()),
                                    'Fazendo um crochê lindoooooooo',
                                    72
									);
                                    
select * from tbl_usuario where id = 88;

select * from tbl_publicacao;
select * from tbl_localizacao;
select * from tbl_localizacao where id = 88;
select * from tbl_publicacao where id_usuario = 71;

desc tbl_usuario;

delete from tbl_publicacao where id = 21;

desc tbl_publicacao;

select
    tbl_localizacao.id AS id_localizacao,
    tbl_localizacao.cidade,
    tbl_localizacao.estado,
    tbl_localizacao.bairro,
    tbl_usuario.id AS id_usuario,
    tbl_usuario.nome_de_usuario
from
    tbl_localizacao
inner join
    tbl_usuario
on
    tbl_usuario.id_localizacao = tbl_localizacao.id;
    
select
    tbl_localizacao.id AS id_localizacao,
    tbl_localizacao.cidade,
    tbl_localizacao.estado,
    tbl_localizacao.bairro,
    tbl_usuario.id AS id_usuario,
    tbl_usuario.nome_de_usuario
from
    tbl_localizacao
inner join
    tbl_usuario
on
    tbl_usuario.id_localizacao = tbl_localizacao.id
    where tbl_localizacao.id = 15;
    
update tbl_localizacao set estado = 'Piauí', cidade = 'Bom Jesus', bairro = 'bairro de Bom Jesus' where id = 5;

-- Crie a trigger
DELIMITER $$
CREATE TRIGGER updateUserLocation
AFTER UPDATE ON tbl_localizacao
FOR EACH ROW
BEGIN
    -- Atualiza os registros na tabela filho tbl_usuario
    UPDATE tbl_usuario SET id_localizacao = NULL WHERE id_localizacao = OLD.id;
END;
$$
DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_publicacao_tag(
    IN p_Id_usuario INT,
    IN p_titulo VARCHAR(45),
    IN p_descricao VARCHAR(500),
    IN p_anexo TEXT,
    IN p_tags VARCHAR(255)
)
BEGIN
    DECLARE v_publicacao_id INT;
    INSERT INTO publicacao (id_usuario, titulo, descricao, anexo, data_publicacao)
    VALUES (p_Id_usuario, p_titulo, p_descricao, p_anexo, NOW());
    
    SET v_publicacao_id = LAST_INSERT_ID();  -- Captura o ID da última inserção
    
    -- Insira as tags associadas à publicação na tabela tbl_tag_publicacao
    INSERT INTO tbl_tag_publicacao (id_tag, id_usuario, id_publicacao)
    SELECT id_tag, p_Id_usuario, v_publicacao_id
    FROM tags
    WHERE FIND_IN_SET(nome_tag, p_tags) > 0;
END //
DELIMITER ;

insert into tbl_tag_publicacao (id_tag, id_publicacao) values (1, 1);

select * from tbl_tag_publicacao;

select NOW();

SELECT CURRENT_TIMESTAMP(); 

SELECT HOUR(NOW());

SELECT TIME(NOW()); 

SELECT DATE(NOW());


select * from tags_usuario where id_usuario = 2;