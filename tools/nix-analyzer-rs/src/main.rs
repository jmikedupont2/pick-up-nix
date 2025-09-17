use rnix::{SyntaxNode, NodeOrToken, Parse};
use rnix::parser::parse;
use rnix::tokenizer;
use rnix::ast::Root;
use std::env;
use std::fs;

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let args: Vec<String> = env::args().collect();

    if args.len() < 2 {
        eprintln!("Usage: {} <nix_file_path>", args[0]);
        std::process::exit(1);
    }

    let file_path = &args[1];
    let nix_code = fs::read_to_string(file_path)?;

    let tokens = tokenizer::tokenize(&nix_code);

    let (green_node, errors) = parse(tokens.into_iter());

    let parse_result = Parse::new(green_node, errors);

    if !parse_result.errors().is_empty() {
        eprintln!("Parsing errors found in {}: {:?}", file_path, parse_result.errors());
    }

    let root: SyntaxNode = parse_result.syntax();

    println!("Successfully parsed {}:", file_path);
    print_syntax_node(&root, 0);

    Ok(())
}

fn print_syntax_node(node: &SyntaxNode, indent: usize) {
    let indent_str = "  ".repeat(indent);
    println!("{}- {:?}\n", indent_str, node.kind());

    for child in node.children_with_tokens() {
        match child {
            NodeOrToken::Node(node) => print_syntax_node(&node, indent + 1),
            NodeOrToken::Token(token) => {
                println!("{}  Token: {:?} ({:?})", indent_str, token.kind(), token.text());
            }
        }
    }
}
