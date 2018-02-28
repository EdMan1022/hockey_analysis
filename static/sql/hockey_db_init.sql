DROP DATABASE IF EXISTS hockey;
CREATE DATABASE IF NOT EXISTS hockey;

USE hockey;

DROP TABLE IF EXISTS coach, award_player, master, scoring_shootout;

-- Create the table containing biographical info for all players and coaches

CREATE TABLE master (
  master_pk INT NOT NULL AUTO_INCREMENT,
  player_id VARCHAR(10),
  coach_id VARCHAR(10),
  hof_id VARCHAR(10),
  first_name VARCHAR(200),
  last_name VARCHAR(200) NOT NULL,
  name_note VARCHAR(200),
  name_given VARCHAR(200),
  name_nick VARCHAR(200),
  height SMALLINT,
  weight SMALLINT,
  shoot_catch ENUM ('L', 'R', 'B'),
  legends_id VARCHAR(10),
  ihdb_id VARCHAR(10),
  href_id VARCHAR(10),
  first_nhl SMALLINT,
  last_nhl SMALLINT,
  first_wha SMALLINT,
  last_wha SMALLINT,
  pos ENUM('C', 'D', 'G', 'L', 'R', 'L/D', 'D/L', 'D/R', 'R/D','C/D',
                'R/C', 'F', 'L/C', 'C/R', 'C/L', 'R/L', 'D/C', 'W'),
  birth_year SMALLINT,
  birth_mon SMALLINT,
  birth_day SMALLINT,
  birth_country VARCHAR(200),
  birth_state VARCHAR(200),
  birth_city VARCHAR(200),
  death_year SMALLINT,
  death_mon SMALLINT,
  death_day SMALLINT,
  death_country VARCHAR(200),
  death_state VARCHAR(200),
  death_city VARCHAR(200),
  PRIMARY KEY (master_pk),
  UNIQUE INDEX (player_id),
  UNIQUE INDEX (coach_id),
  UNIQUE INDEX (hof_id)
)ENGINE=INNODB;

CREATE TABLE coaches (
  coach_pk INT NOT NULL AUTO_INCREMENT,
  coach_id VARCHAR(10) NOT NULL,
  year INT NOT NULL,
  tmID VARCHAR(10) NOT NULL,
  lgID VARCHAR(10) NOT NULL ,
  stint TINYINT NOT NULL,
  notes VARCHAR(200),
  g SMALLINT,
  w SMALLINT,
  l SMALLINT,
  t SMALLINT,
  postg SMALLINT,
  postw SMALLINT,
  postl SMALLINT,
  postt SMALLINT,
  INDEX (coach_id),
  FOREIGN KEY (coach_id)
    REFERENCES master(coach_id)
)ENGINE=INNODB;
