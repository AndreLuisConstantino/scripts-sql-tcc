select * from tbl_usuario;

select * from tbl_usuario where id = 192;

select * from tbl_localizacao;

select * from tbl_categoria;

delete from tbl_usuario where id = 192;

select * from tbl_usuario where id = 73;

select * from tbl_tag where id = 19;

select * from tbl_tag;

select tbl_tag.id as id_tag, tbl_tag.nome, tbl_tag.imagem, tbl_categoria.id as id_categoria
from tbl_tag
	inner join tbl_categoria
		on tbl_tag.id_categoria = tbl_categoria.id;

select tbl_tag.id as id_tag, tbl_tag.nome, tbl_tag.imagem, tbl_categoria.id as id_categoria, tbl_categoria.nome  
from tbl_tag
	inner join tbl_categoria
		on tbl_tag.id_categoria = tbl_categoria.id
where id = 2;

select * from tbl_categoria;

select 
	tbl_localizacao.id, 
	tbl_localizacao.cidade
    from tbl_localizacao
    where tbl_localizacao.estado = 'SP'; 
    
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
where id_usuario = 77;

select * from tbl_tag where id = 19;

select * from tbl_tag_usuario where tbl_tag_usuario.id_usuario = 71;

select * from tbl_tag_usuario where tbl_tag_usuario.id_usuario = 71;

select * from tbl_localizacao;

select * from tbl_usuario;

select * from tbl_categoria;

select * from tbl_categoria;

select tbl_tag.id as id_tag, tbl_tag.nome as nome, tbl_tag.imagem as imagem
    from tbl_tag
        inner join tbl_categoria
            on tbl_tag.id_categoria = tbl_categoria.id
    where tbl_categoria.nome = 'Artesanato';
    
    SELECT 
    tbl_usuario.id AS id_usuario,
    tbl_usuario.nome AS nome,
    tbl_usuario.descricao AS descricao,
    tbl_usuario.foto AS foto,
    tbl_usuario.nome_de_usuario AS nome_de_usuario,
    tbl_usuario.email AS email,
    tbl_usuario.senha AS senha,
    tbl_usuario.id_localizacao AS id_localizacao,
    tbl_localizacao.bairro AS bairro,
    tbl_localizacao.cidade AS cidade,
    tbl_localizacao.estado AS estado,
    tbl_tag.id AS id_tag,
    tbl_tag.nome AS nome_tag,
    tbl_tag.imagem AS imagem_tag,
    tbl_categoria.id AS id_categoria,
    tbl_categoria.nome AS nome_categoria
FROM
    tbl_usuario
        INNER JOIN
    tbl_localizacao ON tbl_localizacao.id = tbl_usuario.id_localizacao
        INNER JOIN
    tbl_tag_usuario ON tbl_tag_usuario.id_usuario = tbl_usuario.id
        INNER JOIN
    tbl_tag ON tbl_tag.id = tbl_tag_usuario.id_tag
        INNER JOIN
    tbl_categoria ON tbl_categoria.id = tbl_tag.id_categoria
WHERE
    id_usuario = 71;

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
                    tbl_localizacao.estado as estado
                from tbl_usuario
                inner join tbl_localizacao
                    on tbl_localizacao.id = tbl_usuario.id_localizacao
				where tbl_usuario.id = 192;

select * from tbl_tag_usuario where tbl_tag_usuario.id_tag = 3;

select tbl_tag.id as id_tag, tbl_tag.nome as nome, tbl_tag.imagem as imagem, tbl_categoria.id as id_categoria, tbl_categoria.nome as nome_categoria
    from tbl_tag
        inner join tbl_categoria
            on tbl_tag.id_categoria = tbl_categoria.id
    where tbl_categoria.id = 2;
    
select * from tbl_tag_usuario where id_usuario = 1;

select * from tbl_publicacao;

delete from tbl_tag_usuario where tbl_tag_usuario.id_usuario = 71;

select * from tbl_tag_usuario;

select * from tbl_localizacao;

select * from tbl_usuario where id = 88;
select * from tbl_publicacao;
select * from tbl_localizacao;
select * from tbl_localizacao where id = 88;
select * from tbl_publicacao where id_usuario = 1;

select * from tbl_usuario where id = 88;
select * from tbl_publicacao;
select * from tbl_localizacao;
select * from tbl_localizacao where id = 88;
select * from tbl_publicacao where id_usuario = 71;

select
    tbl_usuario.id AS id_usuario,
    tbl_localizacao.id AS id_localizacao,
    tbl_localizacao.cidade,
    tbl_localizacao.estado,
    tbl_localizacao.bairro,
    tbl_usuario.nome_de_usuario,
    tbl_usuario.descricao,
    tbl_usuario.foto,
    tbl_usuario.email,
    tbl_usuario.senha
from
    tbl_localizacao
inner join
    tbl_usuario
on
    tbl_usuario.id_localizacao = tbl_localizacao.id
    where tbl_usuario.id = 2;
    
select * from tbl_tag_publicacao where id_publicacao = 2;
    
desc tbl_usuario;
desc tbl_usuario;