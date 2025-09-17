#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum Vendor {
    Ebpf(VendorEbpf),
    External(VendorExternal),
    Guix(VendorGuix),
    LangC(VendorLangC),
    MkAiDerivation(VendorMkAiDerivation),
    Nix(VendorNix),
    NixOnDroid(VendorNixOnDroid),
    Nixpkgs(VendorNixpkgs),
    PlantumlStdlib(VendorPlantumlStdlib),
    RnixParser(VendorRnixParser),
    RustIndexGuix(VendorRustIndexGuix),
    Steel(VendorSteel),
    Strace(VendorStrace),
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum VendorEbpf {
    Aya,
    Ayaoo,
    Bpfjit,
    Bpfman,
    CleanDnsBpf,
    Eadb,
    Ebpfguard,
    LibbpfRs,
    Rbpf,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum VendorExternal {
    AmazonQDeveloperCli,
    Asciinema,
    AsciinemaScenario,
    BitchatSolanaZosSolfunmeme,
    Bootstrap,
    BootstrapMeme,
    CoccinelleforrustPersonalMirror,
    EmojisRs,
    ForgejoPython,
    GeminiCli,
    GithubIssuesExportRs,
    GrokCli,
    HuggingFaceDatasetValidatorRust,
    IntrospectorLlc,
    MetaMeme,
    MinizincIntrospector,
    MonomcpRust,
    N00b,
    NixAsciinemaAgg,
    Ragit,
    Rust,
    SolfunmemeBanner,
    SolfunmemeDioxus,
    SolfunmemeMetameme,
    SolfunmemeModelBuilderQuiz,
    SophiaRs,
    Tclifford,
    Tmux,
    TmuxInterfaceRs,
    Trident,
    Turbomcp,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum VendorGuix {
    Guix,
    Mes,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum VendorLangC {
    GitHub,
    Reftests,
    Src,
    Gitignore,
    CargoToml,
    GrammarHeader,
    GrammarRustfmt,
    GrammarRustpeg,
    LicenseApache,
    LicenseMit,
    Makefile,
    Readme,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum VendorMkAiDerivation {
    Vscode,
    Nix,
    Server,
    Gitignore,
    DefaultNix,
    FlakeLock,
    FlakeNix,
    License,
    Readme,
    ShellNix,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum VendorNix {
    Nix,
    NixpkgsLint,
    Nixtract,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum VendorNixOnDroid {
    GitHub,
    Docs,
    Modules,
    NixOnDroid,
    Overlays,
    Pkgs,
    Scripts,
    Templates,
    Tests,
    Editorconfig,
    Gitignore,
    Authors,
    ChangelogMd,
    DefaultNix,
    FlakeLock,
    FlakeNix,
    License,
    Readme,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum VendorNixpkgs {
    Devcontainer,
    GitHub,
    Ci,
    Doc,
    Lib,
    Maintainers,
    Modules,
    Nixos,
    Pkgs,
    Editorconfig,
    GitBlameIgnoreRevs,
    Gitattributes,
    Gitignore,
    Mailmap,
    Version,
    ContributingMd,
    Copying,
    DefaultNix,
    FlakeNix,
    Readme,
    ShellNix,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum VendorPlantumlStdlib {
    C4PlantUml,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum VendorRnixParser {
    GitHub,
    Benches,
    Examples,
    Fuzz,
    Src,
    TestData,
    Envrc,
    Gitignore,
    CargoLock,
    CargoToml,
    ChangelogMd,
    DefaultNix,
    FlakeLock,
    FlakeNix,
    License,
    Readme,
    RustfmtToml,
    ShellNix,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum VendorRustIndexGuix {
    Src,
    CargoVcsInfoJson,
    Gitignore,
    CargoToml,
    CargoTomlOrig,
    License,
    Readme,
    UpdateSh,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum VendorSteel {
    Cargo,
    GitHub,
    Benchmarks,
    Cogs,
    Contrib,
    Core,
    Crates,
    Docs,
    Examples,
    Images,
    Libs,
    Nix,
    R7rsBenchmarks,
    SelfHosted,
    Src,
    SteelExamples,
    Dockerignore,
    Envrc,
    Gitignore,
    BuildRs,
    CargoLock,
    CargoToml,
    ContributingMd,
    DefaultNix,
    DistWorkspaceToml,
    Dockerfile,
    FlakeLock,
    FlakeNix,
    LicenseApache,
    LicenseMit,
    ProfilerScm,
    Readme,
    RustfmtToml,
    ShellNix,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum VendorStrace {
    DutchcodersTrace,
    Intrace,
    Lurk,
    Rstrace,
}
