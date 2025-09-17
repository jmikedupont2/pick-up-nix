#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum GitHub {
    Actions(GitHubActions),
    Workflows(GitHubWorkflows),
    ChangelogConfigurationJson,
    DependabotYml,
    PullRequestTemplate,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum GitHubActions {
    Cache,
    CacheNixAction,
    Checkout,
    InstallNixAction,
    NixGithubActions,
    NixInstallerAction,
    UploadArtifact,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum GitHubWorkflows {
    Build,
}
