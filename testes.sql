show databases;

use db_tcc_costurie;

show tables;

select * from tbl_usuario;

select * from tbl_localizacao;

select * from tbl_categoria;

delete from tbl_usuario where id = 69;

select * from tbl_usuario where id = 73;

select * from tbl_tag where id = 19;

select * from tbl_tag;

select tbl_tag.id as id_tag, tbl_tag.nome, tbl_tag.imagem, tbl_categoria.id as id_categoria, tbl_categoria.nome  
from tbl_tag
	inner join tbl_categoria
		on tbl_tag.id_categoria = tbl_categoria.id
where id = 2;

select * from tbl_categoria;

update tbl_usuario set senha = 'senha123' where id = 2;

update tbl_usuario set nome = 'andre gato', descricao = 'teste descrição', foto = 'foto de uma garoto muito bonito' where id = 2;

select tbl_usuario.id, tbl_usuario.nome, tbl_usuario.descricao, tbl_usuario.foto, tbl_usuario.nome_de_usuario, tbl_usuario.id_localizacao as localizacao, tbl_localizacao.cidade, tbl_localizacao.estado, tbl_localizacao.bairro
		from tbl_usuario 
			inner join tbl_localizacao on tbl_usuario.id_localizacao = tbl_localizacao.id
		where tbl_usuario.id = 70;
        
select  tbl_usuario.id as id_usuario,
		tbl_usuario.nome as nome,
		tbl_usuario.descricao as descricao,
        tbl_usuario.foto as foto,
        tbl_usuario.nome_de_usuario as nome_de_usuario,
        tbl_usuario.email as email,
        tbl_usuario.senha as senha, 
        tbl_usuario.id_localizacao as id_localizacao,
		tbl_localizacao.bairro as bairro,
        tbl_localizacao.cidade as cidade,
        tbl_localizacao.estado as estado,
        tbl_tag.id as id_tag,
        tbl_tag.nome as nome_tag,
        tbl_tag.imagem as imagem_tag,
        tbl_categoria.id as id_categoria,
        tbl_categoria.nome as nome_categoria
from tbl_usuario
	inner join tbl_localizacao
		on tbl_localizacao.id = tbl_usuario.id_localizacao
	inner join tbl_tag_usuario
		on tbl_tag_usuario.id_usuario = tbl_usuario.id
	inner join tbl_tag
		on tbl_tag.id = tbl_tag_usuario.id_tag
	inner join tbl_categoria
		on tbl_categoria.id= tbl_tag.id_categoria
where id_usuario = 83;

select tbl_localizacao.id, tbl_localizacao.estado from tbl_localizacao;
delete from tbl_localizacao where id = 2;
select 
	tbl_localizacao.id, 
	tbl_localizacao.cidade
    from tbl_localizacao
    where tbl_localizacao.estado = 'SP'; 

delete from tbl_tag_usuario where tbl_tag_usuario.id_usuario = 71;    

select * from tbl_tag where id = 19;

select * from tbl_tag_usuario;

select * from tbl_tag_usuario where tbl_tag_usuario.id_usuario = 71;

insert into tbl_tag_usuario (id_tag, id_usuario) values (43, 70);
insert into tbl_tag_usuario (id_tag, id_usuario) values (1, 70);
insert into tbl_tag_usuario (id_tag, id_usuario) values (1, 71);
insert into tbl_tag_usuario (id_tag, id_usuario) values (3, 70);
insert into tbl_tag_usuario (id_tag, id_usuario) values (4, 70);
insert into tbl_tag_usuario (id_tag, id_usuario) values (5, 70);

select * from tbl_tag_usuario order by id desc limit 1;
		
CALL sp_update_endereco_usuario_tag(
    70,        -- Substitua pelo ID do usuário
    1,        -- Substitua pelo ID do endereço
    'Novo Bairro',      -- Substitua pelo novo valor do bairro
    'Nova Cidade',      -- Substitua pelo novo valor da cidade
    'Novo Estado',      -- Substitua pelo novo valor do estado
    'Novo Nome',        -- Substitua pelo novo valor do nome
    'Nova Descrição',   -- Substitua pela nova descrição
    'Nova Foto',        -- Substitua pela nova URL da foto
    'NovoNomeDeUsuario' -- Substitua pelo novo nome de usuário
);


select * from tbl_localizacao;

select * from tbl_usuario;

select * from tbl_categoria;

delete from tbl_localizacao where id > 5;

DELETE FROM tbl_usuario WHERE tbl_usuario.id_localizacao = 13;


-- Criar uma trigger que remove registros da tabela tbl_localizacao e tbl_usuario
-- quando um registro da tbl_localizacao com ID maior que 5 for excluído
DELIMITER //
CREATE TRIGGER after_delete_tbl_localizacao
AFTER DELETE ON tbl_localizacao
FOR EACH ROW
BEGIN
    DECLARE deleted_id INT;
    SET deleted_id = OLD.id;

    -- Deletar o registro da tabela tbl_usuario que corresponde ao ID excluído da tbl_localizacao
    -- Remover a foreign key da tabela tbl_usuario
	UPDATE tbl_usuario
	SET id_localizacao = NULL
	WHERE id_localizacao = deleted_id;


END;
//
DELIMITER ;

-- Excluir a trigger after_delete_tbl_localizacao
DROP TRIGGER after_delete_tbl_localizacao;

insert into tbl_usuario(nome, descricao, foto, nome_de_usuario, email, senha, id_localizacao) values ('Luiz', 'Trabalho fazendo tricô', 'url', 'lulis', 'luiz@gmail.com', 'luiz123', 2);

select * from tbl_categoria;

select tbl_tag.id as id_tag, tbl_tag.nome as nome, tbl_tag.imagem as imagem
    from tbl_tag
        inner join tbl_categoria
            on tbl_tag.id_categoria = tbl_categoria.id
    where tbl_categoria.nome = 'Artesanato';
    
    select  tbl_usuario.id as id_usuario,
		tbl_usuario.nome as nome,
		tbl_usuario.descricao as descricao,
        tbl_usuario.foto as foto,
        tbl_usuario.nome_de_usuario as nome_de_usuario,
        tbl_usuario.email as email,
        tbl_usuario.senha as senha, 
        tbl_usuario.id_localizacao as id_localizacao,
		tbl_localizacao.bairro as bairro,
        tbl_localizacao.cidade as cidade,
        tbl_localizacao.estado as estado,
        tbl_tag.id as id_tag,
        tbl_tag.nome as nome_tag,
        tbl_tag.imagem as imagem_tag,
        tbl_categoria.id as id_categoria,
        tbl_categoria.nome as nome_categoria
from tbl_usuario
	inner join tbl_localizacao
		on tbl_localizacao.id = tbl_usuario.id_localizacao
	inner join tbl_tag_usuario
		on tbl_tag_usuario.id_usuario = tbl_usuario.id
	inner join tbl_tag
		on tbl_tag.id = tbl_tag_usuario.id_tag
	inner join tbl_categoria
		on tbl_categoria.id= tbl_tag.id_categoria
where id_usuario = 71;

select * from tbl_tag_usuario where tbl_tag_usuario.id_tag = 3;