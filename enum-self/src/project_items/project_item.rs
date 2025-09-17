use crate::{
    config, configurations, documentation, etc, experiments, file_analyzer, github, home,
    json_to_memes_extractor, logs, manifests, memetic_code, new, nixpacks, packages,
    pick_up_nix_cli, prompts, qa, source, src_dir, submodule_flakes, task, tasks, test_flake,
    tools, vendor,
};

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum ProjectItem {
    ConfigurationAndEnvironment(ConfigurationAndEnvironment),
    CodeAndDevelopment(CodeAndDevelopment),
    DocumentationAndMetadata(DocumentationAndMetadata),
    VersionControlAndBuildSystems(VersionControlAndBuildSystems),
    ProjectManagement(ProjectManagement),
    ExternalVendor(ExternalVendor),
    TopLevelFile(TopLevelFile),
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum ConfigurationAndEnvironment {
    Config(config::Config),
    NixDefexpr,
    Configurations(configurations::Configurations),
    Home(home::Home),
    New(new::New),
    Etc(etc::Etc),
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum CodeAndDevelopment {
    FileAnalyzer(file_analyzer::FileAnalyzer),
    JsonToMemesExtractor(json_to_memes_extractor::JsonToMemesExtractor),
    MemeticCode(memetic_code::MemeticCode),
    PickUpNixCli(pick_up_nix_cli::PickUpNixCli),
    Pkgs(packages::Packages),
    Src(src_dir::Src),
    Tools(tools::Tools),
    Experiments(experiments::Experiments),
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum DocumentationAndMetadata {
    Docs(documentation::Documentation),
    Logs(logs::Logs),
    Manifests(manifests::Manifests),
    Prompts(prompts::Prompts),
    Qa(qa::Qa),
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum VersionControlAndBuildSystems {
    GitHub(github::GitHub),
    SubmoduleFlakes(submodule_flakes::SubmoduleFlakes),
    Nixpacks(nixpacks::Nixpacks),
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum ProjectManagement {
    Task(task::Task),
    Tasks(tasks::Tasks),
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum ExternalVendor {
    Vendor(vendor::Vendor),
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum TopLevelFile {
    CargoToml,
    CargoLock,
    FlakeNix,
    FlakeLock,
    TodoHelperSh,
    AspellEnPrepl,
    AspellEnPws,
    Envrc,
    Gitignore,
    Gitmodules,
    NixChannels,
    ArchitecturalVisionMd,
    BootSh,
    BuildAndReportSh,
    BuildOutputCargoMetadataLog,
    BuildOutputGitoxideLog,
    BuildOutputMetaMemeLog,
    BuildOutputMetaMemeWikiLog,
    BuildOutputOctocrabLog,
    BuildOutputZolaLog,
    BuildQaProcessSh,
    ChunkFilesPy,
    CommitAllChangesSh,
    DwimSh,
    EnterAndRunTracenixSh,
    ExtractStracePathsSh,
    FilesTxt,
    FixSubmodulesSh,
    GeminiCliEntrypointSh,
    GeminiCliRecentSh,
    GeminiCliSh,
    GeminiSplitSh,
    GeminiMd,
    GenerateNixGraphSh,
    GettargetsSh,
    IdeasMd,
    InspectNixEnvStackSh,
    InstallNagiosSh,
    InstallService2Sh,
    InstallService3Sh,
    IntegrityVerificationCrqMd,
    ListStracePathsSh,
    MemesMd,
    MinizincEmojiPrimesMzn,
    NotesOrg,
    PetalsSh,
    PoemTweetTxt,
    PoetryTaskMd,
    ProjectProcessMd,
    ReadmeMd,
    ReconstructNestedEnvSh,
    ReconstructionNix,
    RunBootSh,
    RunLogProcessorSh,
    RunTracenixVerboseSh,
    RuntestsSh,
    RustNixEntrypointSh,
    RustMd,
    SetupDirenvSh,
    ShellNix,
    ShellSh,
    SingleGeminiSplitSh,
    StartQaBuildSh,
    StatusTxt,
    SubmoduleCheckoutLogMd,
    SubmoduleIssuesTxt,
    SubtaskSh,
    TaskMd,
    TestProvisionalFlakesSh,
    TestReconstructionEnvSh,
    TestTracenixSh,
    TestSh,
    Test2Sh,
    TodoSh,
    ToolEvaluationSopMd,
    UpdateIndexSh,
    UpdateSubmoduleFlakesSh,
    UpdateSubmoduleShasSh,
}
