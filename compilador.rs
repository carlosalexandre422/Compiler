use std::env;
use std::fs::{self, File};
use std::io::{self, Write};
use std::process::Command;

fn main() -> io::Result<()> {
    // Verifica args de entrada
    let args: Vec<String> = env::args().collect();
    if args.len() != 2 {
        eprintln!("Uso: {} <arquivo.ci>", args[0]);
        std::process::exit(1);
    }

    let input_file = &args[1];
    let content = fs::read_to_string(input_file)?;

    // Valida o conteúdo como uma constante inteira
    if !content.trim().chars().all(|c| c.is_digit(10)) {
        eprintln!("Erro: O arquivo deve conter apenas dígitos inteiros.");
        std::process::exit(1);
    }

    // Gera o cod assembly
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
        content.trim()
    );

    // Escreve o código em um arquivo assembly
    let output_file = "output.s";
    let mut file = File::create(output_file)?;
    file.write_all(assembly_code.as_bytes())?;

    println!("Arquivo assembly gerado: {}", output_file);
    println!("Use os seguintes comandos para compilar e executar:");
    println!("  as --64 -o output.o output.s");
    println!("  ld -o output output.o");
    println!("  ./output");

    Ok(())
}
