#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum MemeticCode {
    EmojiLlmMachineRust(EmojiLlmMachineRust),
    LogProcessor(LogProcessor),
    EmojiLlmMachinePy,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum EmojiLlmMachineRust {
    Src,
    CargoToml,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum LogProcessor {
    Src,
    CargoToml,
    ConfigToml,
}
