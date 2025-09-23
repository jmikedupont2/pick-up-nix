use tera::{Context, Tera};
use std::path::{Path, PathBuf};
use std::fs;

pub fn generate_experimental_task(
    task_title: Option<String>,
    muse_name: Option<String>,
    doc_path: Option<String>,
    relative_doc_path: Option<String>,
) -> Result<(), Box<dyn std::error::Error>> {
    let mut tera = Tera::new("templates/experimental_task_project/**/*.tera")?;
    // Auto-escape is off for shell scripts and markdown
    tera.autoescape_on(vec![".sh.tera", ".md.tera"]);

    let mut context = Context::new();
    context.insert("task_title", &task_title.unwrap_or_default());
    context.insert("muse_name", &muse_name.unwrap_or_default());
    context.insert("doc_path", &doc_path.unwrap_or_default());
    context.insert("relative_doc_path", &relative_doc_path.unwrap_or_default());

    // Determine the output directory
    let sanitized_task_title = task_title.clone().unwrap_or_default().replace(" ", "-").to_lowercase();
    let muse_dir = muse_name.clone().unwrap_or_default();
    let output_base_dir = PathBuf::from(format!("tasks/{}/{}/2025/{}", muse_dir, sanitized_task_title));

    // Render and write boot.sh
    let boot_sh_content = tera.render("boot.sh.tera", &context)?;
    let boot_sh_path = output_base_dir.join("boot.sh");
    fs::create_dir_all(boot_sh_path.parent().unwrap())?;
    fs::write(&boot_sh_path, boot_sh_content)?;
    // Make boot.sh executable
    #[cfg(unix)]
    {
        use std::os::unix::fs::PermissionsExt;
        let mut perms = fs::metadata(&boot_sh_path)?.permissions();
        perms.set_mode(0o755);
        fs::set_permissions(&boot_sh_path, perms)?;
    }

    // Render and write task.md
    let task_md_content = tera.render("task.md.tera", &context)?;
    let task_md_path = output_base_dir.join("task.md");
    fs::write(&task_md_path, task_md_content)?;

    // Render and write SOP_Digital_Mycology_Experiment_Workflow.md
    let sop_dm_content = tera.render("docs/sops/SOP_Digital_Mycology_Experiment_Workflow.md.tera", &context)?;
    let sop_dm_path = output_base_dir.join("docs/sops/SOP_Digital_Mycology_Experiment_Workflow.md");
    fs::create_dir_all(sop_dm_path.parent().unwrap())?;
    fs::write(&sop_dm_path, sop_dm_content)?;

    // Render and write CRQ_022_Quality_Doctrine.md
    let crq_qd_content = tera.render("docs/crqs/CRQ_022_Quality_Doctrine.md.tera", &context)?;
    let crq_qd_path = output_base_dir.join("docs/crqs/CRQ_022_Quality_Doctrine.md");
    fs::create_dir_all(crq_qd_path.parent().unwrap())?;
    fs::write(&crq_qd_path, crq_qd_content)?;

    println!("Experimental task created at: {:?}", output_base_dir);

    Ok(())
}