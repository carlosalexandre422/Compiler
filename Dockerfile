# Base image com suporte a Rust
FROM rust:latest

# Instala ferramentas adicionais necessárias e o nano para edição do arquivo de entrada(constante.ci)
RUN apt-get update && apt-get install -y nano

# Define o diretório de trabalho no container
WORKDIR /app

# Copia os arquivos do projeto para o container
COPY . .

# Compila o programa Rust
RUN rustc compilador.rs -o compilador
