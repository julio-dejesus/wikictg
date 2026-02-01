# 📌 Wiki CTG

Plataforma web/app desenvolvida para **informar, criar e excluir informações sobre CTGs (Centros de Tradições Gaúchas) do Rio Grande do Sul**, utilizando uma **API própria** como backend.

O projeto tem como objetivo centralizar informações confiáveis sobre CTGs, facilitando o acesso da comunidade tradicionalista e permitindo a manutenção colaborativa dos dados.

---

## 🚀 Funcionalidades

* 📍 Listagem de CTGs
* 🔍 Busca e filtros por nome, cidade ou região
* ➕ Cadastro de novos CTGs
* ❌ Exclusão de CTGs
* 🔐 Autenticação e autorização via API
* ✅ Controle de CTGs verificados

---

## 🧩 Tecnologias Utilizadas

### Frontend (Site/App)

* Flutter (Web / Mobile)
* Material Design
* Google Fonts

### Backend (API)

* Dart
* Shelf
* Supabase (PostgreSQL)
* Autenticação via token

---

## 🏗️ Arquitetura

O projeto segue uma arquitetura separada entre **Frontend** e **API**, onde:

* O frontend consome a API via HTTP
* A API é responsável por regras de negócio, autenticação e persistência de dados
* O banco de dados armazena informações estruturadas dos CTGs

---

## 🔐 Autenticação

* A API utiliza **tokens JWT** para autenticação
* Algumas rotas são públicas

---

## 🌎 Escopo do Projeto

* Informações como:

  * Nome do CTG
  * Cidade
  * Fundação
  * Região Tradicionalista

---

## 📌 Status do Projeto

🚧 Em desenvolvimento ativo

Funcionalidades novas e melhorias estão sendo implementadas continuamente.

---

## 🤝 Contribuição

Contribuições são bem-vindas!

1. Faça um fork do projeto
2. Crie uma branch (`feature/minha-feature`)
3. Commit suas alterações
4. Abra um Pull Request

---

## 📄 Licença

Este projeto é de uso livre para fins educacionais e comunitários.

---

## 🧉 Sobre

Projeto criado com foco na **valorização da cultura gaúcha** e na organização de informações sobre os CTGs do RS.

Se encontrar algum erro ou tiver sugestões, fique à vontade para contribuir!
