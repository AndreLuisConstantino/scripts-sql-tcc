########## PROCEDURE PARA UPDATE #########

# Endereco -> Usuario
DELIMITER //
create procedure sp_update_endereco_usuario_tag(
	id_usuario int,
    id_localizacao int,
    bairro varchar(255),
    cidade varchar(255), 
    estado varchar(255),
    nome varchar(60),
    descricao varchar(255),
    foto text,
    nome_de_usuario varchar(100)
)
begin
    update tbl_localizacao set 
        tbl_localizacao.cidade = cidade,
        tbl_localizacao.bairro = bairro,
        tbl_localizacao.estado = estado
	where tbl_localizacao.id = id_localizacao;
        
	update tbl_usuario as usuario set
		usuario.nome = nome,
        usuario.descricao = descricao,
        usuario.foto = foto,
        usuario.nome_de_usuario = nome_de_usuario,
        usuario.id_localizacao = id_localizacao
    where usuario.id = id_usuario;
    
end //
DELIMITER ;


# Localização -> Usuario
DELIMITER //
create procedure sp_update_localizacao_usuario(
	id_usuario int,
    bairro varchar(255),
    cidade varchar(255), 
    estado varchar(255)
)
begin
--     update tbl_localizacao set 
--         tbl_localizacao.cidade = cidade,
--         tbl_localizacao.bairro = bairro,
--         tbl_localizacao.estado = estado
-- 	where tbl_localizacao.id = id_localizacao;
	
    insert into tbl_localizacao (
								cidade, 
                                bairro,
                                estado
                                ) values 
                                (
								cidade,
								bairro,
                                estado
                                );
        
	update tbl_usuario as usuario set
        usuario.id_localizacao = new.id_localizacao
    where usuario.id = id_usuario;
    
end //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_insert_localizacao_usuario(
    id_usuario INT,
    bairro VARCHAR(255),
    cidade VARCHAR(255),
    estado VARCHAR(255)
)
BEGIN
    DECLARE new_id_localizacao INT; -- Variável para armazenar o ID da nova localização.

    -- Insira os novos valores de localização na tabela tbl_localizacao.
    INSERT INTO tbl_localizacao (cidade, bairro, estado)
    VALUES (cidade, bairro, estado);

    -- Obtenha o ID da nova localização inserida.
    SET new_id_localizacao = LAST_INSERT_ID();

    -- Atualize a tabela tbl_usuario com o ID da nova localização.
    UPDATE tbl_usuario AS usuario
    SET usuario.id_localizacao = new_id_localizacao
    WHERE usuario.id = id_usuario;

END //
DELIMITER ;


CALL sp_insert_localizacao_usuario(
									204, 
                                    'ExemploBairro', 
                                    'ExemploCidade', 
                                    'ExemploEstado'
                                    );
                                    
                                    
DROP PROCEDURE IF EXISTS sp_update_localizacao_usuario;
DROP PROCEDURE IF EXISTS sp_insert_localizacao_usuario;

select * from tbl_localizacao;

desc tbl_publicacao;

-- Corrigir
update tbl_publicacao set tbl_publicacao.titulo = 'teste update', tbl_publicacao.anexo = 'exemplo', tbl_publicacao.data_publicacao = DATE(NOW()), tbl_publicacao.hora = TIME(NOW()), tbl_publicacao.descricao = 'teste update descricao' where tbl_publicacao.id = 2;