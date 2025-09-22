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
        /// The type of template to generate (e.g., "commit-message", "experimental-task")
        #[arg(short, long)]
        template_type: String,

        /// The CRQ number for commit messages
        #[arg(long)]
        crq_number: Option<String>,

        /// The description for commit messages
        #[arg(long)]
        description: Option<String>,

        /// The title of the experimental task
        #[arg(long)]
        task_title: Option<String>,

        /// The muse name for the experimental task
        #[arg(long)]
        muse_name: Option<String>,

        /// The absolute path to the document being reviewed
        #[arg(long)]
        doc_path: Option<String>,

        /// The relative path to the document being reviewed
        #[arg(long)]
        relative_doc_path: Option<String>,
    },
}

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let cli = Cli::parse();

    match &cli.command {
        Commands::Generate { template_type, crq_number, description, task_title, muse_name, doc_path, relative_doc_path } => {
            if template_type == "commit-message" {
                let rendered_message = interface::versioning::git::commit::message::generate_commit_message(
                    crq_number.clone(), // Clone to pass ownership
                    description.clone(), // Clone to pass ownership
                )?;
                io::stdout().write_all(rendered_message.as_bytes())?;
            } else if template_type == "experimental-task" {
                interface::experimental_task::generate_experimental_task(
                    task_title.clone(),
                    muse_name.clone(),
                    doc_path.clone(),
                    relative_doc_path.clone(),
                )?;
            } else {
                return Err(format!("Unknown template type: {}", template_type).into());
            }
        }
    }

    Ok(())
}