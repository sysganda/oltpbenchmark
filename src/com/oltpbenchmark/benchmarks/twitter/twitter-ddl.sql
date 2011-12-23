-- MySQL ddl from Twitter dump

DROP TABLE IF EXISTS user;
CREATE TABLE user (
  uid int(11) NOT NULL DEFAULT '0',
  name varchar(255) DEFAULT NULL,
  email varchar(255) DEFAULT NULL,
  partitionid int(11) DEFAULT NULL,
  partitionid2 tinyint(4) DEFAULT NULL,
  followers int(11) DEFAULT NULL,
  PRIMARY KEY (uid)
);
CREATE INDEX IDX_USER_FOLLOWERS ON user (followers);
CREATE INDEX IDX_USER_PARTITION ON user (partitionid);

DROP TABLE IF EXISTS followers;
CREATE TABLE followers (
  f1 int(11) NOT NULL DEFAULT '0',
  f2 int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (f1,f2)
);

DROP TABLE IF EXISTS follows;
CREATE TABLE follows (
  f1 int(11) NOT NULL DEFAULT '0',
  f2 int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (f1,f2)
);

-- TODO: id AUTO_INCREMENT
DROP TABLE IF EXISTS tweets;
CREATE TABLE tweets (
  id bigint(20) NOT NULL,
  uid int(11) NOT NULL REFERENCES user (uid),
  text char(140) NOT NULL,
  createdate datetime DEFAULT NULL,
  PRIMARY KEY (id)
);

-- TODO: id AUTO_INCREMENT
DROP TABLE IF EXISTS added_tweets;
CREATE TABLE added_tweets (
  id bigint(20) NOT NULL,
  uid int(11) NOT NULL REFERENCES user (uid),
  text char(140) NOT NULL,
  createdate datetime DEFAULT NULL,
  PRIMARY KEY (id)
);
CREATE INDEX IDX_ADDED_TWEETS_UID ON added_tweets (uid);