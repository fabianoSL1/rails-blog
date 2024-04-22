# Gems
- kaminari
- bcrypt
- pg
- sidekiq

# Deploy
https://fabiano-blog.fly.dev/

# Arquivo para upload de posts

```
!!title Ola mundo
!!tags Rails, Ruby

Ola Ruby

!!post

!!title Titulo
!!tags Flamengo, Time, Dorama

Corpo da publicação

!!post
```

# Desafio
- ## Área deslogada onde é possível: 
	- [x] ver os posts publicados por todos os usuários ordenados do mais novo para o mais antigo; 
	- [x] os posts publicados devem ter paginação ao atingirem 3 publicações, onde o 4º post irá para a página 2 e daí em diante, ou seja, cada página deverá ter até 3 posts; 
 	- [x] fazer comentários anônimos; 
	- [x] cadastrar um novo usuário; 
	- [x] fazer login com um usuário cadastrado; 
	- [x] recuperar a senha do usuário.

- ## Área logada onde é possível:
	- [x] redigir e publicar um post;
	- [x] editar e apagar posts já publicados pelo próprio usuário loggado;
	- [x] fazer comentários identificados através do login;
	- [x] editar o seu cadastro de usuário;
	- [x] alterar a senha do usuário loggado.  
   
- ## Opcionais:
  - [ ] Se conseguir, escrever testes automatizados simples;
	- [x] Se conseguir, implemente internacionalização;
	- [x] Se conseguir, adicione tags aos seus post, assim como filtros para utilizar as tags cadastradas. As tags deverão ser implementadas como uma nova tabela no seu modelo, associada aos posts;
	- [x] Se conseguir, crie a possibilidade de upload de arquivo TXT para criação de um ou mais posts, ou criação de múltiplas tags, utilizando Sidekiq para processamento assíncrono.
