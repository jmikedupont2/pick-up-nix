#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum Tasks {
    HelloWorldRust(TasksHelloWorldRust),
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum TasksHelloWorldRust {
    Src(TasksHelloWorldRustSrc),
    CargoToml,
    DefaultNix,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum TasksHelloWorldRustSrc {
    MainRs,
}
