#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum Task {
    Ainix(TaskAinix),
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum TaskAinix {
    Logs(TaskAinixLogs),
    AddMkaiderivationSubmoduleLog,
    AddMkaiderivationSubmoduleSh,
    SopAddMkaiderivationSubmoduleMd,
    SopUpdateSubmodulesMd,
    UpdateAllSubmodulesLog,
    UpdateAllSubmodulesSh,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum TaskAinixLogs {
    AddMkaiderivationSubmoduleStraceLog,
    AddMkaiderivationSubmoduleLog,
    UpdateAllSubmodulesStraceLog,
    UpdateAllSubmodulesLog,
}
