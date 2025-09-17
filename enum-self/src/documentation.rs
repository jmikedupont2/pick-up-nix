#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum Documentation {
    Crqs(Crqs),
    Designs(Designs),
    EducationalPhilosophy(EducationalPhilosophy),
    Memes(Memes),
    NixExamples(NixExamples),
    Qa(Qa),
    ReviewFindings(ReviewFindings),
    ShellScriptingStandards(ShellScriptingStandards),
    Sops(Sops),
    Tutorials(Tutorials),
    UserGuide(UserGuide),
    ExtremeNixismLlmManifesto,
    FlakeTutorial,
    FormalProofCrq,
    GitCommitSop,
    GitStatusIgnoreSubmodules,
    Glossary,
    Intent,
    LivestreamSetup,
    LocalBuildInstructions,
    NixConfigGitTutorial,
    NixForDebianUsers,
    NoobTutorial,
    ProjectObservations,
    SelfCreatingNixLlmOodaMeme,
    SolfunmemeCommunicationCrq,
    SopAdvancedMonadicAi,
    SopAutomatedSubmoduleUpdateProcess,
    SopDataRetentionAndImmutability,
    SopDocumentationConsolidation,
    SopLargeFileChunkingStrategy,
    SopNixExpressionRefactoringForSubmodules,
    SopNixFlakeIntegrationForExternalDependencies,
    SopSubmoduleManagementBestPractices,
    SubmoduleDocsIndex,
    Submodules,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum Crqs {
    BugReportNixOnDroidPathsIssue,
    CodebergMigrationCrq,
    CrqAutomateSubmoduleUpdates,
    CrqChunkLargeFiles,
    CRQEmacsConfigurableItemsAndHelp,
    CRQEmacsGUIDesignForGeminiCLI,
    CRQEmacsOrgModeIntegrationForGeminiCLI,
    CrqEnhanceNixFlakesIntegrationForSubmodules,
    CRQEnhanceTaskExecutionEfficiency,
    CrqOptimizeGitoxideIntegration,
    CrqRefactorNixExpressionForSubmoduleCheckout,
    CRQStandardizeTaskManagement,
    CrqStreamlineDocumentationWorkflow,
    IntrinsicNixFlakesProposal,
    SelfReflectingAgentCrq,
    UserspaceEbpfRootCauseCrq,
    WIKIIMPORTCRQ,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum Designs {
    EmacsGeminiCLIGUIDesign,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum EducationalPhilosophy {
    CompilingFromSourceLearning,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum Memes {
    TheStandardsOverloadMeme,
    TheMonadicCodeMeme,
    TheVibeAsCodeMeme,
    TheBlockchainEverythingMeme,
    TheSmartContractSubmoduleMeme,
    TheSelfVerifyingSoftwareMeme,
    TheSExpressionLinguaFrancaMeme,
    TheAIAgentMakingMemesAboutItselfMetaMeme,
    TheSopForMemesMetaMeme,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum NixExamples {
    TempShell,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum Qa {
    TracenixQaProcedure,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum ReviewFindings {
    CRQSOPReview2025_09_16,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum ShellScriptingStandards {
    Readme,
    ScriptReviewFindings,
    ShellScriptBestPractices,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum Sops {
    MemeIdentificationSop,
    MemeticCodeGenerationSop,
    MIBCRASHRETRIEVALPROTOCOL,
    SolfunmemeCommunicationSop,
    SopAddMkaiderivationSubmodule,
    SOPCRQSOPReviewAndTaskCreation,
    SOPEfficientTaskExecution,
    SOPEmacsConfigurableItemsAndHelpImplementation,
    SOPEmacsOrgModeIntegrationImplementation,
    SOPTaskManagementWorkflow,
    SopUpdateSubmodules,
    SUBMODULESETUPSOP,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum Tutorials {
    EmacsGeminiCLIIntegrationTutorial,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum UserGuide {
    TracenixUserGuide,
}
