# Base image com suporte a Rust
FROM rust:latest

# Instala ferramentas adicionais necessárias
RUN apt-get update && apt-get install -y build-essential

# Define o diretório de trabalho no container
WORKDIR /app

# Copia os arquivos do projeto para o container
COPY . .

# Compila o programa Rust
RUN rustc compilador.rs -o compilador
