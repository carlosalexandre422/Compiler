use std::env;
use std::fs::{self, File};
use std::io::{self, Write};
use std::process::{exit};

fn main() -> io::Result<()> {

    const MIN_VALUE: i64 = i32::MIN as i64; // Valor mínimo permitido (-2³¹)
    const MAX_VALUE: i64 = i32::MAX as i64; // Valor máximo permitido (2³¹-1)

    // Verifica os argumentos de entrada
    let args: Vec<String> = env::args().collect();
    if args.len() != 2 {
        eprintln!("Uso: {} <arquivo.ci>", args[0]);
        exit(1);
    }

    let input_file = &args[1];

    // Tenta ler o conteúdo do arquivo
    let content = match fs::read_to_string(input_file) {
        Ok(c) => c.trim().to_string(),
        Err(_) => {
            eprintln!("Erro: Não foi possível ler o arquivo '{}'.", input_file);
            exit(1);
        }
    };

    // Valida o conteúdo como um número inteiro
    let value: i64 = match content.parse() {
        Ok(v) => v,
        Err(_) => {
            eprintln!("Erro: O arquivo deve conter um número inteiro válido.");
            exit(1);
        }
    };

   // Verifica se o valor está dentro do intervalo permitido
   if value < MIN_VALUE || value > MAX_VALUE {
    eprintln!(
        "Erro: O valor '{}' está fora do intervalo permitido ({MIN_VALUE} a {MAX_VALUE}).",
        value
    );
    exit(1);
}

    // Geração do código assembly
    let assembly_code = format!(
        r#"
.section .text
.globl _start

_start:
    mov ${}, %rax
    call imprime_num
    call sair

.include "runtime.s"
"#,
        content
    );

    // Escreve o código em um arquivo
    let output_file = "output.s";
    let mut file = File::create(output_file)?;
    file.write_all(assembly_code.as_bytes())?;

    println!("Arquivo assembly gerado: {}", output_file);
    println!("Código assembly: \n {}", assembly_code);
    println!("Use os seguintes comandos para compilar e executar:");
    println!("  as --64 -o output.o output.s");
    println!("  ld -o output output.o");
    println!("  ./output");

    Ok(())
}
