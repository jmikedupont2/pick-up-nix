#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum JsonToMemesExtractor {
    Src(JsonToMemesExtractorSrc),
    CargoToml,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum JsonToMemesExtractorSrc {
    MainRs,
}
