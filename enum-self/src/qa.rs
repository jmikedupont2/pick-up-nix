#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum Qa {
    NixBuildsSh,
    NixLintersSh,
}
