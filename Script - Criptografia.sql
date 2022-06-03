create database transacao;
use transacao;

create table usuario (
idUsuario int primary key auto_increment,
nome varchar(45),
email varchar(45),
senha varchar(45)
);

insert into usuario values
(null, 'Célia Taniwaki', 'celia.taniwaki@sptech.school', 'senhaSecreta'),
(null, 'Vivian Silva', 'vivian.silva@sptech.school', 'senhaQueNinguemSabe');

set @@autocommit = 0;

start transaction;

delete from usuario where idUsuario >0;

select * from usuario;

-- ROLLBACK OU COMMIT (finaliza start transaction)
rollback;
commit;


select md5('senhaSecreta');
select sha1('senhaSecreta');
select sha2('senhaSecreta');

select aes_encrypt('senhaSegura', 'chaveSecreta');

alter table usuario modify senha varbinary(150);
insert into usuario values (null, 'Guilherme Coimbra', 'guilherme.coimbra@sptech.school', aes_encrypt('minhaSenha', 'chave'));
select * from usuario;
select aes_decrypt(senha, 'chave') from usuario;

select * from usuario
where email='guilherme.coimbra@sptech.school'
and senha = aes_encrypt('minhaSenha', 'chave');