#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum PickUpNixCli {
    Src(PickUpNixCliSrc),
    CargoToml,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum PickUpNixCliSrc {
    Events(PickUpNixCliSrcEvents),
    Generator(PickUpNixCliSrcGenerator),
    MainRs,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum PickUpNixCliSrcEvents {
    ModRs,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum PickUpNixCliSrcGenerator {
    ModRs,
}
