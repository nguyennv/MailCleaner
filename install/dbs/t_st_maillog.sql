USE mc_stats;

DROP TABLE IF EXISTS maillog;
CREATE TABLE maillog (
  timestamp timestamp NOT NULL,
  id text,
  size bigint(20) default '0',
  from_address text,
  from_domain text,
  to_address text,
  to_domain text,
  subject text,
  clientip text,
  archive text,
  isspam tinyint(1) default '0',
  ishighspam tinyint(1) default '0',
  issaspam tinyint(1) default '0',
  isrblspam tinyint(1) default '0',
  isfp tinyint(1) default '0',
  isfn tinyint(1) default '0',
  spamwhitelisted tinyint(1) default '0',
  spamblacklisted tinyint(1) default '0',
  sascore decimal(7,2) default '0.00',
  spamreport text,
  virusinfected tinyint(1) default '0',
  nameinfected tinyint(1) default '0',
  otherinfected tinyint(1) default '0',
  report text,
  ismcp tinyint(1) default '0',
  ishighmcp tinyint(1) default '0',
  issamcp tinyint(1) default '0',
  mcpwhitelisted tinyint(1) default '0',
  mcpblacklisted tinyint(1) default '0',
  mcpsascore decimal(7,2) default '0.00',
  mcpreport text,
  hostname text,
  date date default NULL,
  time time default NULL,
  headers text,
  quarantined tinyint(1) default '0',
  content_forced enum('1','0') NOT NULL DEFAULT '0',
  KEY maillog_datetime_idx (date,time),
  KEY maillog_id_idx (id(20)),
  KEY maillog_clientip_idx (clientip(20)),
  KEY maillog_from_idx (from_address(200)),
  KEY maillog_to_idx (to_address(200)),
  KEY maillog_host_idx (hostname(30)),
  KEY maillog_from_domain_idx (from_domain(50)),
  KEY maillog_to_domain_idx (to_domain(50)),
  KEY maillog_quarantined_idx (quarantined)
);
