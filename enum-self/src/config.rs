#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum Config {
    HomeManager(ConfigHomeManager),
    Nix(ConfigNix),
    DefaultNix,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum ConfigHomeManager {
    HomeNix,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum ConfigNix {
    ConfigurationNix,
    DefaultNix,
    NixConf,
}
