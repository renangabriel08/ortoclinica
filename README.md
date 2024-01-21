<h1 align="center">
    <p>Flutter Ortoclinica</p>
</h1>

<p align="center">
  <a href="#projeto">Projeto</a>&nbsp;|
  <a href="#api">Api</a>&nbsp;|
  <a href="#tecnologias">Tecnologias</a>&nbsp;|
  <a href="#instalacao">Instalação</a>&nbsp;|
  <a href="#links">Links</a>&nbsp;|
  <a href="#licenca">Licença</a>
</p>

<p align="center">
  <img alt="License" src="https://img.shields.io/static/v1?label=license&message=MIT&color=49AA26&labelColor=000000">
</p>

<div id='projeto'>
  <h2 style="color: #87CEFA;"> 💻 Projeto </h2>
  Aplicativo desenvolvido em flutter para aprimoramento no desenvolvimento mobile. Produzido como projeto extra no curso técnico de desenvolvimento de sistemas no Senai Pompéia.
  <br>
  O projeto consta com as funcionalidades de login e cadastro, que são conectados com a api que acompanha o app.
</div>

<div id='api'>
  <h2 style="color: #87CEFA;"> ⚙ API </h2>
  Rodar Arquivo de Criação e Abastecimento do Banco de Dados 

   ```bash
   1°: API-WSC2022/mysql/scripts/DDL.sql
   2°: API-WSC2022/mysql/scripts/DML.sql
```

Criar um arquivo de configuração de variáveis de ambiente na pasta api chamado nodemon.json, onde deve estar de acordo com os atributos a seguir:
```json
{
    "env" : {        
        "MYSQL_USER": "<usuario-banco-de-dados>",
        "MYSQL_PASSWORD": "<senha-bando-de-dados>",
        "MYSQL_DATABASE": "wscdb",
        "MYSQL_HOST":  "<host-banco-de-dados>",
        "JWT_KEY": "<codigo-para-jwt>",
        "URL_DOMINIO": "<host-do-servico>"
    }
}
```

</div>

<div id='tecnologias'>
  <h2 style="color: #87CEFA;">🚀 Tecnologias</h2>

  <p>
  Esse projeto foi desenvolvido com as seguintes tecnologias:

  - [Flutter](https://flutter.dev/)
  - [Dart](https://dart.dev/)
  </p>
</div>

<div id='instalacao'>
  <h2 style="color: #87CEFA;">📥 Instalação</h2>

  ```bash
  #Clone repositório
  git clone https://github.com/renangabriel08/ortoclinica.git

  #Instalando dependencias
  cd ortoclinica
  flutter pub get
```
  
</div>

<div id='links'>
  <h2 style="color: #87CEFA;">📍 Links</h2>

- [LinkedIn](https://www.linkedin.com/in/renan-gabriel/)
- [Github](https://github.com/renangabriel08)
- [Download Flutter](https://flutter.dev/)
- [Download Emulador](https://developer.android.com/studio)
</div>

<div id='licenca'>
  <h2 style="color: #87CEFA;">📑 Licença</h2>

  <p>Esse projeto está sob a licença MIT.</p>
</div>