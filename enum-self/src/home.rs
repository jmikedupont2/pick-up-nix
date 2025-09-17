#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum Home {
    BaseNix,
    EmacsNix,
    ScientificNix,
}
