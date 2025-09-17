#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum Etc {
    Apache2(Apache2),
    Nagios(Nagios),
    Nagios4(Nagios4),
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum Apache2 {
    ConfAvailable,
    ConfEnabled,
    ModsAvailable,
    ModsEnabled,
    SitesAvailable,
    SitesEnabled,
    Apache2Conf,
    Envvars,
    Magic,
    PortsConf,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum Nagios {
    NrpeCfg,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, serde::Serialize, serde::Deserialize, PartialOrd, Ord)]
pub enum Nagios4 {
    ConfD,
    Objects,
    Stylesheets,
    Apache2Conf,
    CgiCfg,
    NagiosCfg,
}
