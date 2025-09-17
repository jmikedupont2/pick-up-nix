#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum Source {
    GitHub(SourceGitHub),
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum SourceGitHub {
    Jmikedupont2(SourceGitHubJmikedupont2),
    MetaIntrospector(SourceGitHubMetaIntrospector),
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum SourceGitHubJmikedupont2 {
    Orgs(SourceGitHubJmikedupont2Orgs),
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum SourceGitHubJmikedupont2Orgs {
    EscapedRdfa(SourceGitHubJmikedupont2OrgsEscapedRdfa),
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum SourceGitHubJmikedupont2OrgsEscapedRdfa {
    Namespace(SourceGitHubJmikedupont2OrgsEscapedRdfaNamespace),
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum SourceGitHubJmikedupont2OrgsEscapedRdfaNamespace {
    BookSrc(SourceGitHubJmikedupont2OrgsEscapedRdfaNamespaceBookSrc),
    Src(SourceGitHubJmikedupont2OrgsEscapedRdfaNamespaceSrc),
    Tests(SourceGitHubJmikedupont2OrgsEscapedRdfaNamespaceTests),
    ConfigYml,
    Gitignore,
    BookToml,
    FlakeLock,
    FlakeNix,
    License,
    RequirementsTxt,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum SourceGitHubJmikedupont2OrgsEscapedRdfaNamespaceBookSrc {
    Md1_0,
    Md1_0Rss,
    IndexMd,
    ReadmeMd,
    SummaryMd,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum SourceGitHubJmikedupont2OrgsEscapedRdfaNamespaceSrc {
    Src(SourceGitHubJmikedupont2OrgsEscapedRdfaNamespaceSrcSrc),
    JsonToUrlPy,
    JsonldCliPy,
    JsonurlCliPy,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum SourceGitHubJmikedupont2OrgsEscapedRdfaNamespaceSrcSrc {
    PipDeleteThisDirectoryTxt,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum SourceGitHubJmikedupont2OrgsEscapedRdfaNamespaceTests {
    Makefile,
    Test001PodcastBloggerRss,
    Test001PodcastHtml,
    Test001PodcastJson,
    Test001PodcastJsonld,
    Test001PodcastJsonldFlattened,
    Test001PodcastJsonldFlattenedUrl,
    Test001PodcastTtl,
    Test002PodcastEscapedBloggerRss,
    Test002PodcastEscapedWordpressRss,
    Test002PodcastEscapedHtml,
    Test002PodcastEscapedTtl,
    Test003ExampleHtml,
    Test003ExampleTtl,
    Test004ExampleEscapedHtml,
    Test004ExampleEscapedTtl,
    Test005ShortenedHeaderHtml,
    Test006ErssEmbedHtml,
    Test006ErssEmbedRss,
    Test007ChannelHeaderHtml,
    Test007ChannelHeaderRss,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum SourceGitHubMetaIntrospector {
    GitSubmoduleToolsRs,
    GitSubmodulesRsNix,
    Hackathon,
    LatticeIntrospector,
    Lean4,
    MinizincIntrospector,
    Neo,
    QuasiMetaMeme,
    Solfunmeme,
    Streamofrandom,
    Time,
}
