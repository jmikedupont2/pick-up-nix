#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum Experiments {
    GitSubmoduleToolsRs(GitSubmoduleToolsRs),
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum GitSubmoduleToolsRs {
    FlakeNix,
}
