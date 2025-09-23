use tera::{Tera, Context};
use std::path::PathBuf;

pub fn generate_commit_message(
    crq_number: Option<String>,
    description: Option<String>,
) -> Result<String, Box<dyn std::error::Error>> {
    let templates_base_path = PathBuf::from("templates");
    let glob_pattern = format!("{}/**/*", templates_base_path.to_str().unwrap());

    let tera = Tera::new(&glob_pattern)?;

    let mut context = Context::new();
    if let Some(crq) = crq_number {
        context.insert("crq_number", &crq);
    }
    if let Some(desc) = description {
        context.insert("description", &desc);
    }

    let rendered = tera.render("commit_messages/commit_workflow.tera", &context)?;
    Ok(rendered)
}
