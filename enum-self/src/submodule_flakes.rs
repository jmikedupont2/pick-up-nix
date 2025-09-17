#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum SubmoduleFlakes {
    CargoMetadata(SubmoduleFlakesCargoMetadata),
    Gitoxide(SubmoduleFlakesGitoxide),
    MetaIntrospectorMetaMeme(SubmoduleFlakesMetaIntrospectorMetaMeme),
    MetaIntrospectorMetaMemeWiki(SubmoduleFlakesMetaIntrospectorMetaMemeWiki),
    MetaIntrospectorMkAiDerivation(SubmoduleFlakesMetaIntrospectorMkAiDerivation),
    Octocrab(SubmoduleFlakesOctocrab),
    Zola(SubmoduleFlakesZola),
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum SubmoduleFlakesCargoMetadata {
    FlakeNix,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum SubmoduleFlakesGitoxide {
    FlakeNix,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum SubmoduleFlakesMetaIntrospectorMetaMeme {
    FlakeNix,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum SubmoduleFlakesMetaIntrospectorMetaMemeWiki {
    FlakeNix,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum SubmoduleFlakesMetaIntrospectorMkAiDerivation {
    FlakeNix,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum SubmoduleFlakesOctocrab {
    FlakeNix,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum SubmoduleFlakesZola {
    FlakeNix,
}
