DROP DATABASE FIFA;
CREATE DATABASE FIFA;
USE FIFA;
CREATE TABLE tournament(
  tournament_id VARCHAR(20) NOT NULL,
  tournament_name VARCHAR(20),
  year INTEGER,
  No_teams INTEGER, 
  host VARCHAR(20),
  winner VARCHAR(20),
  PRIMARY KEY (tournament_id)
);
INSERT INTO tournament VALUES ('WC-2010','2010 FIFA World Cup',2010,32,'South Africa','Spain');
INSERT INTO tournament VALUES ('WC-1994','1994 FIFA World Cup',1994,24,'United States','Brazil');
INSERT INTO tournament VALUES ('WC-2014','2014 FIFA World Cup',2014,32,'Brazil','Germany');
INSERT INTO tournament VALUES ('WC-2018','2018 FIFA World Cup',2018,32,'Russia','France');
INSERT INTO tournament VALUES ('WC-2022','2022 FIFA World Cup',2022,32,'Qatar','Argentina');
SHOW TABLES;
CREATE TABLE confederations(
  confederation_id VARCHAR(200) NOT NULL,
  confederation_name VARCHAR(200),
  confederation_code VARCHAR(200),
  PRIMARY KEY (confederation_id)
);
INSERT INTO confederations VALUES ('CF-1','Asian Football Confederation','AFC');
INSERT INTO confederations VALUES ('CF-2','Confederation of African Football','CAF');
INSERT INTO confederations VALUES ('CF-3','Confederation of North Central American and Caribbean Association Football','CONCACAF');
INSERT INTO confederations VALUES ('CF-4','South American Football Confederation','CONMEBOL');
INSERT INTO confederations VALUES ('CF-5','Oceania Football Confederation','OFC');
INSERT INTO confederations VALUES ('CF-6','Union of European Football Associations','UEFA');
CREATE TABLE teams(
  team_id VARCHAR(20) NOT NULL,
  team_name VARCHAR(20),
  team_code VARCHAR(20),
  continent_name VARCHAR(20),
  confederation_id VARCHAR(20) NOT NULL,
  PRIMARY KEY (team_id),
  FOREIGN KEY (confederation_id) REFERENCES confederations (confederation_id)
);
INSERT INTO teams VALUES('T-01','Argentina','ARG','South America','CF-4');
INSERT INTO teams VALUES('T-02','Germany','GER','Europe','CF-6');
INSERT INTO teams VALUES('T-03','Brazil','BRA','South America','CF-4');
INSERT INTO teams VALUES('T-04','Spain','ESP','Europe','CF-6');
INSERT INTO teams VALUES('T-05','Croatia','CRO','Europe','CF-6');
INSERT INTO teams VALUES('T-06','South Korea','KOR','Asia','CF-1');
INSERT INTO teams VALUES('T-07','France','FRA','Europe','CF-6');
INSERT INTO teams VALUES('T-08','Denmark','DEN','Europe','CF-6');
CREATE TABLE players(
  player_id VARCHAR(20) NOT NULL,
  first_name VARCHAR(20),
  last_name VARCHAR(20),
  dob DATE,
  player_pos VARCHAR(20),
  tournaments_played INTEGER,
  PRIMARY KEY (player_id)
);
INSERT INTO players VALUES('P-1','Lionel','Messi','1987-06-24','ATK',5);
INSERT INTO players VALUES('P-2','Luka','Modric','1985-09-09','MID',4);
INSERT INTO players VALUES('P-3','Heung','Son','1992-08-08','ATK',2);
INSERT INTO players VALUES('P-4','Toni','Kroos','1990-01-04','ATK',3);
INSERT INTO players VALUES('P-5','Vinicius','Jr','2000-07-12','ATK',1);
INSERT INTO players VALUES('P-6','Dani','Alves','1983-05-06','DEF',3);
INSERT INTO players VALUES('P-7','Pedri','Gonzalez','2002-11-25','MID',1);
INSERT INTO players VALUES('P-8','Pablo','Gavi','2004-08-05','MID',1);
INSERT INTO players VALUES('P-9','Angel','DiMaria','1988-02-14','ATK',4);
INSERT INTO players VALUES('P-10','Kylian','Mbappe','1988-12-20','ATK',2);
CREATE TABLE managers(
  manager_id VARCHAR(20) NOT NULL,
  first_name VARCHAR(20),
  last_name VARCHAR(20),
  country_name VARCHAR(20),
  PRIMARY KEY (manager_id)
);
INSERT INTO managers VALUES('M-1','Louis','Enrique','Spain');
INSERT INTO managers VALUES('M-2','Lionel','Scaloni','Argentina');
INSERT INTO managers VALUES('M-3','Adenor','Bachhi','Brazil');
INSERT INTO managers VALUES('M-4','Didier','Deschamps','France');
INSERT INTO managers VALUES('M-5','Joachim','Low','Germany');
CREATE TABLE referees(
  referee_id VARCHAR(20) NOT NULL,
  first_name VARCHAR(20),
  last_name VARCHAR(20),
  country_name VARCHAR(20),
  confederation_id VARCHAR(20),
  PRIMARY KEY (referee_id),
  FOREIGN KEY (confederation_id) REFERENCES confederations (confederation_id)
);
INSERT INTO referees VALUES('R-1','Felix','Brych','Germany','CF-6');
INSERT INTO referees VALUES('R-2','Cuneyt','Sakir','Turkey','CF-1');
INSERT INTO referees VALUES('R-3','Bjorn','Kuipers','Netherlands','CF-6');
INSERT INTO referees VALUES('R-4','Daniele','Orsato','Italy','CF-6');
INSERT INTO referees VALUES('R-5','Mark','Geiger','America','CF-3');
CREATE TABLE stadiums(
  stadium_id VARCHAR(20) NOT NULL,
  stadium_name VARCHAR(20),
  country_name VARCHAR(20),
  stadium_capacity INTEGER,
  city VARCHAR(20),
  PRIMARY KEY (stadium_id)
);
INSERT INTO stadiums VALUES('S-1','Estadio Monumental','Argentina',75000,'Buenos Aires');
INSERT INTO stadiums VALUES('S-2','Estádio do Maracanã','Brazil',200000,'Rio De Janeiro');
INSERT INTO stadiums VALUES('S-3','Parc des Princes','France',49000,'Paris');
INSERT INTO stadiums VALUES('S-4','Waldstadion','Germany',62000,'Frankfurt');
INSERT INTO stadiums VALUES('S-5','Daegu  Stadium','South Korea',68000,'Daegu');
CREATE TABLE matches(
  tournament_id VARCHAR(20) NOT NULL,
  match_id VARCHAR(20) NOT NULL,
  match_name VARCHAR(200),
  stage_name VARCHAR(20),
  match_date VARCHAR(20),
  home_team_id VARCHAR(20) NOT NULL,
  away_team_id VARCHAR(20) NOT NULL,
  score VARCHAR(20),
  winner VARCHAR(20),
  stadium_id VARCHAR(20) NOT NULL,
  PRIMARY KEY (match_id),
  FOREIGN KEY (tournament_id) REFERENCES tournament (tournament_id),
  FOREIGN KEY (stadium_id) REFERENCES stadiums (stadium_id),
  FOREIGN KEY (home_team_id) REFERENCES teams (team_id),
  FOREIGN KEY (away_team_id) REFERENCES teams (team_id)
);
INSERT INTO matches VALUES('WC-2010','MA-1','France vs Croatia','Group','2010-07-14','T-05','T-07','1-0','FRA','S-2');
INSERT INTO matches VALUES('WC-2022','MA-2','France vs Argentina','Knockout','2022-12-18','T-01','T-07','3-3','ARG','S-3');
INSERT INTO matches VALUES('WC-2022','MA-3','South Korea vs Croatia','Group','2022-12-08','T-05','T-06','2-0','KOR','S-1');
INSERT INTO matches VALUES('WC-2014','MA-4','Germany vs Brazil','Group','2014-09-12','T-02','T-03','7-1','GER','S-5');
INSERT INTO matches VALUES('WC-2022','MA-5','South Korea vs Spain','Group','2022-11-20','T-06','T-04','1-2','ESP','S-4');
INSERT INTO matches VALUES('WC-2014','MA-6','Spain vs France','Group','2014-07-14','T-04','T-07','1-3','FRA','S-3');
INSERT INTO matches VALUES('WC-2018','MA-7','Denmark vs Argentina','Knockout','2018-08-14','T-01','T-08','0-1','ARG','S-2');
INSERT INTO matches VALUES('WC-2018','MA-8','Denmark vs Croatia','Group','2018-07-16','T-08','T-05','1-1','draw','S-2');
INSERT INTO matches VALUES('WC-2018','MA-9','France vs Spain','Knockout','2018-08-14','T-07','T-04','2-3','ESP','S-1');
INSERT INTO matches VALUES('WC-1994','MA-10','Argentina vs Croatia','Knockout','1994-06-14','T-01','T-05','1-0','ARG','S-5');
INSERT INTO matches VALUES('WC-2014','MA-11','South Korea vs Denmark','Group','2014-07-17','T-06','T-08','1-0','KOR','S-4');
INSERT INTO matches VALUES('WC-2022','MA-12','Brazil vs Argentina','Group','2022-08-15','T-03','T-01','1-2','ARG','S-1');
INSERT INTO matches VALUES('WC-2010','MA-13','Spain vs Denmark','Knockout','2010-09-10','T-04','T-08','1-0','ESP','S-2');
INSERT INTO matches VALUES('WC-2018','MA-14','Germany vs France','Knockout','2018-06-20','T-02','T-07','0-3','FRA','S-4');
CREATE TABLE awards(
  award_id VARCHAR(20) NOT NULL,
  award_name VARCHAR(20),
  award_description VARCHAR(20),
  PRIMARY KEY (award_id)
);
INSERT INTO awards VALUES('A-1','Golden Ball','Best Player');
INSERT INTO awards VALUES('A-2','Golden Gloves','Best Goalkeeper');
INSERT INTO awards VALUES('A-3','Golden Boot','Best Goalscorer');
INSERT INTO awards VALUES('A-4','Young Player','Best Young Player');
CREATE TABLE squads(
  tournament_id VARCHAR(20) NOT NULL,
  team_id VARCHAR(20) NOT NULL,
  player_id VARCHAR(20) NOT NULL,
  jersey_number INTEGER,
  position_name VARCHAR(20),
  PRIMARY KEY (tournament_id, team_id, player_id),
  FOREIGN KEY (tournament_id) REFERENCES tournament (tournament_id),
  FOREIGN KEY (team_id) REFERENCES teams (team_id),
  FOREIGN KEY (player_id) REFERENCES players (player_id)
);
INSERT INTO squads VALUES('WC-2018','T-01','P-1',10,'ATK');
INSERT INTO squads VALUES('WC-2018','T-01','P-2',08,'MID');
INSERT INTO squads VALUES('WC-2018','T-01','P-3',02,'DEF');
INSERT INTO squads VALUES('WC-2022','T-02','P-4',10,'ATK');
INSERT INTO squads VALUES('WC-2022','T-02','P-5',09,'ATK');
INSERT INTO squads VALUES('WC-2022','T-03','P-6',04,'DEF');
INSERT INTO squads VALUES('WC-2022','T-04','P-7',10,'ATK');
INSERT INTO squads VALUES('WC-2018','T-05','P-8',11,'ATK');
INSERT INTO squads VALUES('WC-2018','T-05','P-9',08,'MID');
CREATE TABLE penalties(
  penalty_kick_id  VARCHAR(20) NOT NULL,
  scored BOOLEAN,
  tournament_id  VARCHAR(20) NOT NULL,
  match_id  VARCHAR(20) NOT NULL,
  team_id  VARCHAR(20) NOT NULL,
  player_id  VARCHAR(20) NOT NULL,
  PRIMARY KEY (penalty_kick_id),
  FOREIGN KEY (tournament_id) REFERENCES tournament (tournament_id),
  FOREIGN KEY (match_id) REFERENCES matches (match_id),
  FOREIGN KEY (team_id) REFERENCES teams (team_id),
  FOREIGN KEY (player_id) REFERENCES players (player_id)
);
INSERT INTO penalties VALUES('PEN-1',1,'WC-2022','MA-2','T-01','P-2');
INSERT INTO penalties VALUES('PEN-2',1,'WC-2018','MA-8','T-03','P-5');
INSERT INTO penalties VALUES('PEN-3',1,'WC-2014','MA-6','T-08','P-8');
INSERT INTO penalties VALUES('PEN-4',0,'WC-2010','MA-5','T-02','P-7');
INSERT INTO penalties VALUES('PEN-5',0,'WC-2010','MA-5','T-05','P-3');
CREATE TABLE goals(
  goal_id VARCHAR(20) NOT NULL,
  tournament_id VARCHAR(20) NOT NULL,
  match_id VARCHAR(20) NOT NULL,
  team_id VARCHAR(20) NOT NULL,
  player_id VARCHAR(20) NOT NULL,
  player_team_id VARCHAR(20) NOT NULL,
  PRIMARY KEY (goal_id),
  FOREIGN KEY (tournament_id) REFERENCES tournament (tournament_id),
  FOREIGN KEY (match_id) REFERENCES matches (match_id),
  FOREIGN KEY (team_id) REFERENCES teams (team_id),
  FOREIGN KEY (player_id) REFERENCES players (player_id),
  FOREIGN KEY (player_team_id) REFERENCES teams (team_id)
);
INSERT INTO goals VALUES('GO-1','WC-2014','MA-1','T-02','P-1','T-02');
INSERT INTO goals VALUES('GO-2','WC-2018','MA-2','T-02','P-3','T-02');
INSERT INTO goals VALUES('GO-3','WC-2022','MA-8','T-03','P-6','T-03');
INSERT INTO goals VALUES('GO-4','WC-2022','MA-3','T-05','P-9','T-05');
INSERT INTO goals VALUES('GO-5','WC-2022','MA-6','T-03','P-8','T-03');
INSERT INTO goals VALUES('GO-6','WC-2014','MA-7','T-01','P-8','T-01');
INSERT INTO goals VALUES('GO-7','WC-2018','MA-6','T-02','P-2','T-02');
CREATE TABLE Grooups(
  tournament_id VARCHAR(20) NOT NULL,
  group_name VARCHAR(20),
  no_teams INTEGER,
  PRIMARY KEY (tournament_id, group_name),
  FOREIGN KEY (tournament_id) REFERENCES tournament (tournament_id)
);
INSERT INTO Grooups VALUES('WC-2010','GR-1',4);
INSERT INTO Grooups VALUES('WC-2018','GR-2',4);
INSERT INTO Grooups VALUES('WC-2018','GR-3',4);
INSERT INTO Grooups VALUES('WC-2022','GR-5',4);
INSERT INTO Grooups VALUES('WC-2022','GR-6',4);
CREATE TABLE award_recipients(
  tournament_id VARCHAR(20) NOT NULL,
  award_id VARCHAR(20) NOT NULL,
  player_id VARCHAR(20) NOT NULL,
  team_id VARCHAR(20) NOT NULL,
  PRIMARY KEY (tournament_id, award_id, player_id),
  FOREIGN KEY (tournament_id) REFERENCES tournament (tournament_id),
  FOREIGN KEY (award_id) REFERENCES awards (award_id),
  FOREIGN KEY (player_id) REFERENCES players (player_id),
  FOREIGN KEY (team_id) REFERENCES teams (team_id)
);
INSERT INTO award_recipients VALUES('WC-2010','A-1','P-2','T-03');
INSERT INTO award_recipients VALUES('WC-2010','A-2','P-6','T-04');
INSERT INTO award_recipients VALUES('WC-2010','A-3','P-1','T-05');
INSERT INTO award_recipients VALUES('WC-2022','A-1','P-2','T-03');
INSERT INTO award_recipients VALUES('WC-2022','A-2','P-3','T-03');
INSERT INTO award_recipients VALUES('WC-2022','A-3','P-8','T-01');
INSERT INTO award_recipients VALUES('WC-2022','A-4','P-9','T-03');
CREATE TABLE tournament_standings(
  tournament_id VARCHAR(20) NOT NULL,
  position INTEGER,
  team_id VARCHAR(20) NOT NULL,
  PRIMARY KEY (tournament_id, position),
  FOREIGN KEY (tournament_id) REFERENCES tournament (tournament_id),
  FOREIGN KEY (team_id) REFERENCES teams (team_id)
);
INSERT INTO tournament_standings VALUES('WC-2018',1,'T-05');
INSERT INTO tournament_standings VALUES('WC-2018',2,'T-02');
INSERT INTO tournament_standings VALUES('WC-2022',1,'T-03');
INSERT INTO tournament_standings VALUES('WC-2022',2,'T-01');
INSERT INTO tournament_standings VALUES('WC-2022',3,'T-04');
SHOW TABLES;