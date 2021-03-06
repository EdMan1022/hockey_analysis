DROP DATABASE IF EXISTS hockey;
CREATE DATABASE hockey;
USE hockey;
DROP TABLE IF EXISTS coach, award_player, master, scoring_shootout, scoring;

# Create the table containing biographical info for all players and coaches
CREATE TABLE master (
  master_pk     INT          NOT NULL AUTO_INCREMENT,
  player_id     VARCHAR(10),
  coach_id      VARCHAR(10),
  hof_id        VARCHAR(10),
  first_name    VARCHAR(200),
  last_name     VARCHAR(200) NOT NULL,
  name_note     VARCHAR(200),
  name_given    VARCHAR(200),
  name_nick     VARCHAR(200),
  height        SMALLINT,
  weight        SMALLINT,
  shoot_catch   ENUM ('L', 'R', 'B'),
  legends_id    VARCHAR(10),
  ihdb_id       VARCHAR(10),
  href_id       VARCHAR(10),
  first_nhl     SMALLINT,
  last_nhl      SMALLINT,
  first_wha     SMALLINT,
  last_wha      SMALLINT,
  pos           VARCHAR(10),
  birth_year    SMALLINT,
  birth_mon     SMALLINT,
  birth_day     SMALLINT,
  birth_country VARCHAR(200),
  birth_state   VARCHAR(200),
  birth_city    VARCHAR(200),
  death_year    SMALLINT,
  death_mon     SMALLINT,
  death_day     SMALLINT,
  death_country VARCHAR(200),
  death_state   VARCHAR(200),
  death_city    VARCHAR(200),
  PRIMARY KEY (master_pk),
  UNIQUE INDEX (player_id),
  UNIQUE INDEX (coach_id),
  UNIQUE INDEX (hof_id)
)
  ENGINE = INNODB;

CREATE TABLE coach (
  coach_pk INT         NOT NULL AUTO_INCREMENT,
  coach_id VARCHAR(10) NOT NULL,
  year     INT         NOT NULL,
  tm_id    VARCHAR(10) NOT NULL,
  lg_id    VARCHAR(10) NOT NULL,
  stint    TINYINT     NOT NULL,
  notes    VARCHAR(200),
  g        SMALLINT,
  w        SMALLINT,
  l        SMALLINT,
  t        SMALLINT,
  postg    SMALLINT,
  postw    SMALLINT,
  postl    SMALLINT,
  postt    SMALLINT,

  PRIMARY KEY (coach_pk),
  INDEX (coach_id),
  FOREIGN KEY (coach_id)
  REFERENCES master (coach_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE -- When a coach is deleted from master, their coach data should be deleted
)
  ENGINE = INNODB;

CREATE TABLE award_player (
  award_player_pk INT          NOT NULL AUTO_INCREMENT,
  player_id       VARCHAR(10)  NOT NULL,
  award           VARCHAR(200) NOT NULL,
  year            SMALLINT     NOT NULL,
  lg_id           VARCHAR(10),
  note            VARCHAR(200),
  pos             VARCHAR(10),

  PRIMARY KEY (award_player_pk),
  INDEX (player_id),
  FOREIGN KEY (player_id)
  REFERENCES master (player_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE # When a player is deleted, the award_player record should be deleted
)
  ENGINE = INNODB;

CREATE TABLE scoring_shootout (
  scoring_shootout_pk INT         NOT NULL AUTO_INCREMENT,
  player_id           VARCHAR(10) NOT NULL,
  year                SMALLINT    NOT NULL,
  stint               SMALLINT    NOT NULL,
  tm_id               VARCHAR(3)  NOT NULL,
  s                   SMALLINT    NOT NULL,
  g                   SMALLINT    NOT NULL,
  shot_percentage     FLOAT,
  gdg                 SMALLINT    NOT NULL,

  PRIMARY KEY (scoring_shootout_pk),
  INDEX (player_id),
  FOREIGN KEY (player_id)
  REFERENCES master (player_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE # If a player is removed, their shootout records should be removed
)
  ENGINE = INNODB;

CREATE TABLE scoring (
  scoring_pk INT         NOT NULL AUTO_INCREMENT,
  player_id  VARCHAR(10) NOT NULL,
  year       SMALLINT,
  tm_id      VARCHAR(10),

  PRIMARY KEY (scoring_pk),
  INDEX (player_id),
  FOREIGN KEY (player_id)
  REFERENCES master (player_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE # If a player is removed, their shootout records should be removed
)
  ENGINE = INNODB;

