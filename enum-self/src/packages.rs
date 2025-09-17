#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum Packages {
    GeminiCli(GeminiCli),
    GeminiInteraction(GeminiInteraction),
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum GeminiCli {
    DefaultNix,
    FlakeNix,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum GeminiInteraction {
    DefaultNix,
}
