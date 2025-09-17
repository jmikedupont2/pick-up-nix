#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum Tools {
    IfCounter(IfCounter),
    SocialMedia(SocialMedia),
    BatchTaskProcessor,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum IfCounter {
    Src,
    CargoToml,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum SocialMedia {
    MyInsightTweet,
    SocialMediaFiberLog,
    TweetTool,
    TweetConfirmation,
}
