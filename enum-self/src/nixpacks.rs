#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum Nixpacks {
    Cargo(NixpacksCargo),
    Devcontainer(NixpacksDevcontainer),
    GitHub(NixpacksGitHub),
    Base(NixpacksBase),
    Docs(NixpacksDocs),
    Examples(NixpacksExamples),
    Src(NixpacksSrc),
    TestHelper(NixpacksTestHelper),
    Tests(NixpacksTests),
    Wix(NixpacksWix),
    Gitattributes,
    Gitignore,
    CargoLock,
    CargoToml,
    Contributing,
    FlakeLock,
    FlakeNix,
    InstallPs1,
    InstallSh,
    License,
    Makefile,
    Readme,
    ReleaseToml,
    UninstallSh,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum NixpacksCargo {
    ConfigToml,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum NixpacksDevcontainer {
    LibraryScripts,
    DevcontainerJson,
    Dockerfile,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum NixpacksGitHub {
    IssueTemplate,
    Workflows,
    ChangelogConfigurationJson,
    DependabotYml,
    PullRequestTemplate,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum NixpacksBase {
    Debian,
    Ubuntu,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum NixpacksDocs {
    Components,
    Hooks,
    Markdoc,
    Pages,
    Public,
    Typings,
    EslintrcJson,
    Gitignore,
    Prettierignore,
    PrettierrcJs,
    ConstantsTs,
    NextEnvDTs,
    NextConfigJs,
    PackageJson,
    PostcssConfigJs,
    Readme,
    SidebarTs,
    TailwindConfigJs,
    TsconfigJson,
    YarnLock,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum NixpacksExamples {
    AptFfmpeg,
    BasicGleam,
    Clojure,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum NixpacksSrc {
    Nixpacks,
    Providers,
    ChainRs,
    LibRs,
    MainRs,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum NixpacksTestHelper {
    Src,
    CargoToml,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum NixpacksTests {
    Snapshots,
    DockerRunTestsRs,
    GeneratePlanTestsRs,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum NixpacksWix {
    LicenseRtf,
    MainWxs,
}
