use clap::{Parser, Subcommand};
use std::io::{self, Write};

mod interface; // Declare the interface module

#[derive(Parser, Debug)]
#[command(author, version, about, long_about = None)]
struct Cli {
    #[command(subcommand)]
    command: Commands,
}

#[derive(Subcommand, Debug)]
enum Commands {
    /// Generates content from a specified template
    Generate {
        /// The type of template to generate (e.g., "commit-message")
        #[arg(short, long)]
        template_type: String,

        /// The CRQ number for commit messages
        #[arg(long)]
        crq_number: Option<String>,

        /// The description for commit messages
        #[arg(long)]
        description: Option<String>,
    },
}

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let cli = Cli::parse();

    match &cli.command {
        Commands::Generate { template_type, crq_number, description } => {
            if template_type == "commit-message" {
                let rendered_message = interface::versioning::git::commit::message::generate_commit_message(
                    crq_number.clone(), // Clone to pass ownership
                    description.clone(), // Clone to pass ownership
                )?;
                io::stdout().write_all(rendered_message.as_bytes())?;
            } else {
                return Err(format!("Unknown template type: {}", template_type).into());
            }
        }
    }

    Ok(())
}