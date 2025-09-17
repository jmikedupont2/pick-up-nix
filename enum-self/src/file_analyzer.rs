#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum FileAnalyzer {
    Src(FileAnalyzerSrc),
    CargoToml,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum FileAnalyzerSrc {
    MainRs,
}
