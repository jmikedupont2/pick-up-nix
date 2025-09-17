#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum New {
    NixProfile(NewNixProfile),
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum NewNixProfile {
    Bin,
    Etc,
    Include,
    Lib,
    Libexec,
    ResourceRoot,
    Sbin,
    Share,
    ManifestNix,
}
