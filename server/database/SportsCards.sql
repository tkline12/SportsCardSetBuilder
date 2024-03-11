-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).
DROP TABLE if exists app_user, card, player, player_card, set, sport, team, team_card, user_card, player_team, sport_player, sport_card CASCADE;

CREATE TABLE app_user (
	user_id serial,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	display_name varchar(50),
	img_url varchar(500),
	short_bio varchar(500),
	CONSTRAINT PK_app_user PRIMARY KEY (user_id),
	CONSTRAINT UQ_username UNIQUE (username)
);

CREATE TABLE "card" (
    "card_id" serial   NOT NULL,
    "card_name" varchar(50)   NOT NULL,
    "card_number" varchar(20)   NOT NULL,
    "set_id" int   NOT NULL,
    "image" varchar(50) NOT NULL,
    CONSTRAINT "pk_card" PRIMARY KEY (
        "card_id"
     )
);

CREATE TABLE "user_card" (
    "user_id" int   NOT NULL,
    "card_id" int   NOT NULL
);

CREATE TABLE "sport" (
    "sport_id" serial  NOT NULL,
    "sport_name" varchar(50)   NOT NULL,
    CONSTRAINT "pk_sport" PRIMARY KEY (
        "sport_id"
     )
);

CREATE TABLE "player" (
    "player_id" serial  NOT NULL,
    "player_name" varchar(50)   NOT NULL,
    CONSTRAINT "pk_player" PRIMARY KEY (
        "player_id"
     )
);

CREATE TABLE "player_team" (
    "player_id" int   NOT NULL,
    "team_id" int   NOT NULL
);

CREATE TABLE "player_card" (
    "player_id" int   NOT NULL,
    "card_id" int   NOT NULL
);

CREATE TABLE "team" (
    "team_id" serial   NOT NULL,
    "team_name" varchar(50)   NOT NULL,
    "sport_id" int NOT NULL,
    CONSTRAINT "pk_team" PRIMARY KEY (
        "team_id"
     )
);

CREATE TABLE "team_card" (
    "team_id" int   NOT NULL,
    "card_id" int   NOT NULL
);

CREATE TABLE "set" (
    "set_id" serial   NOT NULL,
    "set_name" varchar(50)   NOT NULL,
    "year" int   NOT NULL,
    "set_image" varchar(50) NOT NULL,
    "brand" varchar(50)   NOT NULL,
    CONSTRAINT "pk_set" PRIMARY KEY (
        "set_id"
     )
);

CREATE TABLE "sport_player" (
    "sport_id" int   NOT NULL,
    "player_id" int   NOT NULL
);

ALTER TABLE "card" ADD CONSTRAINT "fk_card_set_id" FOREIGN KEY("set_id")
REFERENCES "set" ("set_id");

ALTER TABLE "user_card" ADD CONSTRAINT "fk_user_card_user_id" FOREIGN KEY("user_id")
REFERENCES "app_user" ("user_id");

ALTER TABLE "user_card" ADD CONSTRAINT "fk_user_card_card_id" FOREIGN KEY("card_id")
REFERENCES "card" ("card_id");

ALTER TABLE "player_team" ADD CONSTRAINT "fk_player_team_player_id" FOREIGN KEY("player_id")
REFERENCES "player" ("player_id");

ALTER TABLE "player_team" ADD CONSTRAINT "fk_player_team_team_id" FOREIGN KEY("team_id")
REFERENCES "team" ("team_id");

ALTER TABLE "player_card" ADD CONSTRAINT "fk_player_card_player_id" FOREIGN KEY("player_id")
REFERENCES "player" ("player_id");

ALTER TABLE "player_card" ADD CONSTRAINT "fk_player_card_card_id" FOREIGN KEY("card_id")
REFERENCES "card" ("card_id");

ALTER TABLE "team_card" ADD CONSTRAINT "fk_team_card_team_id" FOREIGN KEY("team_id")
REFERENCES "team" ("team_id");

ALTER TABLE "team_card" ADD CONSTRAINT "fk_team_card_card_id" FOREIGN KEY("card_id")
REFERENCES "card" ("card_id");

ALTER TABLE "sport_player" ADD CONSTRAINT "fk_player_sport_player_id" FOREIGN KEY("player_id")
REFERENCES "player" ("player_id");

ALTER TABLE "sport_player" ADD CONSTRAINT "fk_player_sport_sport_id" FOREIGN KEY("sport_id")
REFERENCES "sport" ("sport_id");

ALTER TABLE "team" ADD CONSTRAINT "fk_team_sport_id" FOREIGN KEY("sport_id")
REFERENCES "sport" ("sport_id");

CREATE INDEX "idx_card_card_name"
ON "card" ("card_name");

CREATE INDEX "idx_user_username"
ON "app_user" ("username");

CREATE INDEX "idx_sport_sport_name"
ON "sport" ("sport_name");

CREATE INDEX "idx_player_player_name"
ON "player" ("player_name");

CREATE INDEX "idx_team_team_name"
ON "team" ("team_name");

CREATE INDEX "idx_set_set_name"
ON "set" ("set_name");

CREATE INDEX "idx_set_brand"
ON "set" ("brand");

INSERT INTO app_user (username, password_hash, role, display_name, img_url, short_bio)
	VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN', null, null, null);
INSERT INTO app_user (username, password_hash, role, display_name, img_url, short_bio)
	VALUES ('job_coach','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER', 'Imani',
		'https://source.boringavatars.com/bauhaus/80/job_coach',
		'Career coach, specializing in working with students fresh out of college and career changers, with a special interest in technology roles.');
INSERT INTO app_user (username, password_hash, role, display_name, img_url, short_bio)
	VALUES ('newbie_coder','$2a$10$We8.y4IV/uQOPT1crppxR.aASgeKFr24ISrkHcqWWSYlxRu4oeqE6','ROLE_USER', null,
		'https://source.boringavatars.com/beam/80/newbie_coder',
		'New parent turned coder, with a passion for basketball, stats, and a good laugh.');
INSERT INTO app_user (username, password_hash, role, display_name, img_url, short_bio)
	VALUES ('troublemaker','$2a$10$K/XxMq03OaJM4AhLU7YE3eQh1KAd8/gzWIOWLgBqVrb5AoSy.pmSK','ROLE_USER', null, null, null);


INSERT INTO player (player_name) VALUES ('Tyreek Hill');
INSERT INTO player (player_name) VALUES ('Paolo Banchero');
INSERT INTO player (player_name) VALUES ('Jalen Suggs');
INSERT INTO player (player_name) VALUES ('Markelle Fultz');
INSERT INTO player (player_name) VALUES ('Wendell Carter Jr.');
INSERT INTO player (player_name) VALUES ('Franz Wagner');
INSERT INTO player (player_name) VALUES ('Moritz Wagner');
INSERT INTO player (player_name) VALUES ('Chuma Okeke');
INSERT INTO player (player_name) VALUES ('Luis Robert');
INSERT INTO player (player_name) VALUES ('Yoan Moncada');
INSERT INTO player (player_name) VALUES ('Eloy Jimenez');
INSERT INTO player (player_name) VALUES ('Tim Anderson');
INSERT INTO player (player_name) VALUES ('Patrick Mahomes');
INSERT INTO player (player_name) VALUES ('Lamar Jackson');
INSERT INTO player (player_name) VALUES ('Josh Allen');
INSERT INTO player (player_name) VALUES ('Najee Harris');
INSERT INTO player (player_name) VALUES ('Nick Chubb');
INSERT INTO player (player_name) VALUES ('Joe Burrow');
INSERT INTO player (player_name) VALUES ('Mac Jones');
INSERT INTO player (player_name) VALUES ('Aaron Rodgers');
INSERT INTO player (player_name) VALUES ('Anthony Richardson');
INSERT INTO player (player_name) VALUES ('CJ Stroud');
INSERT INTO player (player_name) VALUES ('Trevor Lawrence');
INSERT INTO player (player_name) VALUES ('Bijan Robinson');
INSERT INTO player (player_name) VALUES ('CeeDee Lamb');
INSERT INTO player (player_name) VALUES ('Sam Howell');
INSERT INTO player (player_name) VALUES ('Daniel Jones');
INSERT INTO player (player_name) VALUES ('Jordan Love');
INSERT INTO player (player_name) VALUES ('Justin Fields');
INSERT INTO player (player_name) VALUES ('Justin Jefferson');
INSERT INTO player (player_name) VALUES ('Jared Goff');
INSERT INTO player (player_name) VALUES ('Justin Herbert');
INSERT INTO player (player_name) VALUES ('Cooper Kupp');
INSERT INTO player (player_name) VALUES ('Josh Jacobs');
INSERT INTO player (player_name) VALUES ('Jerry Jeudy');
INSERT INTO player (player_name) VALUES ('DK Metcalf');
INSERT INTO player (player_name) VALUES ('Kyler Murray');
INSERT INTO player (player_name) VALUES ('Baker Mayfield');
INSERT INTO player (player_name) VALUES ('Derek Carr');
INSERT INTO player (player_name) VALUES ('Bryce Young');
INSERT INTO player (player_name) VALUES ('Derrick Henry');
INSERT INTO player (player_name) VALUES ('Jayson Tatum');
INSERT INTO player (player_name) VALUES ('Giannis Antetokounmpo');
INSERT INTO player (player_name) VALUES ('Jalen Brunson');
INSERT INTO player (player_name) VALUES ('Donovan Mitchell');
INSERT INTO player (player_name) VALUES ('Tyrese Haliburton');
INSERT INTO player (player_name) VALUES ('Jimmy Butler');
INSERT INTO player (player_name) VALUES ('Zach Lavine');
INSERT INTO player (player_name) VALUES ('Mikal Bridges');
INSERT INTO player (player_name) VALUES ('Trae Young');
INSERT INTO player (player_name) VALUES ('Scottie Barnes');
INSERT INTO player (player_name) VALUES ('LaMelo Ball');
INSERT INTO player (player_name) VALUES ('Kyle Kuzma');
INSERT INTO player (player_name) VALUES ('Cade Cunningham');
INSERT INTO player (player_name) VALUES ('Anthony Edwards');
INSERT INTO player (player_name) VALUES ('Nikola Jokic');
INSERT INTO player (player_name) VALUES ('Shai Gilgeous-Alexander');
INSERT INTO player (player_name) VALUES ('Kawhi Leonard');
INSERT INTO player (player_name) VALUES ('DeAaron Fox');
INSERT INTO player (player_name) VALUES ('Devin Booker');
INSERT INTO player (player_name) VALUES ('Luka Doncic');
INSERT INTO player (player_name) VALUES ('Zion Williamson');
INSERT INTO player (player_name) VALUES ('LeBron James');
INSERT INTO player (player_name) VALUES ('Lauri Markkanen');
INSERT INTO player (player_name) VALUES ('Jalen Green');
INSERT INTO player (player_name) VALUES ('Stephen Curry');
INSERT INTO player (player_name) VALUES ('Ja Morant');
INSERT INTO player (player_name) VALUES ('Scoot Henderson');
INSERT INTO player (player_name) VALUES ('Victor Wembanyama');
INSERT INTO player (player_name) VALUES ('Craig Kimbrel');
INSERT INTO player (player_name) VALUES ('Brandon Lowe');
INSERT INTO player (player_name) VALUES ('Vladimir Guerrero Jr.');
INSERT INTO player (player_name) VALUES ('Aaron Judge');
INSERT INTO player (player_name) VALUES ('Rafael Devers');
INSERT INTO player (player_name) VALUES ('Carlos Correa');
INSERT INTO player (player_name) VALUES ('Javier Baez');
INSERT INTO player (player_name) VALUES ('Jose Ramirez');
INSERT INTO player (player_name) VALUES ('Bobby Witt Jr.');
INSERT INTO player (player_name) VALUES ('Jose Altuve');
INSERT INTO player (player_name) VALUES ('Max Scherzer');
INSERT INTO player (player_name) VALUES ('Julio Rodriguez');
INSERT INTO player (player_name) VALUES ('Mike Trout');
INSERT INTO player (player_name) VALUES ('Shohei Ohtani');
INSERT INTO player (player_name) VALUES ('Nick Allen');
INSERT INTO player (player_name) VALUES ('Ronald Acuna Jr.');
INSERT INTO player (player_name) VALUES ('Bryce Harper');
INSERT INTO player (player_name) VALUES ('Luis Arraez');
INSERT INTO player (player_name) VALUES ('Pete Alonso');
INSERT INTO player (player_name) VALUES ('Joey Gallo');
INSERT INTO player (player_name) VALUES ('Christian Yelich');
INSERT INTO player (player_name) VALUES ('Michael Busch');
INSERT INTO player (player_name) VALUES ('Elly De La Cruz');
INSERT INTO player (player_name) VALUES ('Andrew McCutchen');
INSERT INTO player (player_name) VALUES ('Lars Nootbaar');
INSERT INTO player (player_name) VALUES ('Mookie Betts');
INSERT INTO player (player_name) VALUES ('Corbin Carroll');
INSERT INTO player (player_name) VALUES ('Fernando Tatis Jr.');
INSERT INTO player (player_name) VALUES ('Logan Webb');
INSERT INTO player (player_name) VALUES ('Kris Bryant');
INSERT INTO player (player_name) VALUES ('Brock Purdy');
INSERT INTO player (player_name) VALUES ('Joel Embiid');
INSERT INTO player (player_name) VALUES ('Jalen Hurts');
INSERT INTO player (player_name) VALUES ('Damian Lillard');
INSERT INTO player (player_name) VALUES ('Kyle Lowry');
INSERT INTO player (player_name) VALUES ('Patrick Beverly');
INSERT INTO player (player_name) VALUES ('Goran Dragic');
INSERT INTO player (player_name) VALUES ('Dennis Schroder');
INSERT INTO player (player_name) VALUES ('Elfrid Payton');
INSERT INTO player (player_name) VALUES ('Kemba Walker');
INSERT INTO player (player_name) VALUES ('DJ Augustin');
INSERT INTO player (player_name) VALUES ('Dennis Smith Jr.');
INSERT INTO player (player_name) VALUES ('CJ McCollum');
INSERT INTO player (player_name) VALUES ('Klay Thompson');
INSERT INTO player (player_name) VALUES ('DeMar DeRozan');
INSERT INTO player (player_name) VALUES ('Lou Williams');
INSERT INTO player (player_name) VALUES ('Dwyane Wade');
INSERT INTO player (player_name) VALUES ('Jeremy Lin');
INSERT INTO player (player_name) VALUES ('Jrue Holiday');
INSERT INTO player (player_name) VALUES ('Nicolas Batum');
INSERT INTO player (player_name) VALUES ('Evan Fournier');
INSERT INTO player (player_name) VALUES ('Wesley Matthews');
INSERT INTO player (player_name) VALUES ('Evan Turner');
INSERT INTO player (player_name) VALUES ('Kevin Durant');
INSERT INTO player (player_name) VALUES ('OG Anunoby');
INSERT INTO player (player_name) VALUES ('Avery Bradley');
INSERT INTO player (player_name) VALUES ('James Johnson');
INSERT INTO player (player_name) VALUES ('Taurean Prince');
INSERT INTO player (player_name) VALUES ('Nikola Mirotic');
INSERT INTO player (player_name) VALUES ('Malik Monk');
INSERT INTO player (player_name) VALUES ('Terrence Ross');
INSERT INTO player (player_name) VALUES ('Harrison Barnes');
INSERT INTO player (player_name) VALUES ('Zach Collins');
INSERT INTO player (player_name) VALUES ('Draymond Green');
INSERT INTO player (player_name) VALUES ('Serge Ibaka');
INSERT INTO player (player_name) VALUES ('Tobias Harris');
INSERT INTO player (player_name) VALUES ('Dion Waiters');
INSERT INTO player (player_name) VALUES ('John Collins');
INSERT INTO player (player_name) VALUES ('Julius Randle');
INSERT INTO player (player_name) VALUES ('Michael Kidd-Gilchrist');
INSERT INTO player (player_name) VALUES ('Aaron Gordon');
INSERT INTO player (player_name) VALUES ('Dirk Nowitzki');
INSERT INTO player (player_name) VALUES ('Jusuf Nurkic');
INSERT INTO player (player_name) VALUES ('DeMarcus Cousins');
INSERT INTO player (player_name) VALUES ('Jonas Valanciunas');
INSERT INTO player (player_name) VALUES ('Marcin Gortat');
INSERT INTO player (player_name) VALUES ('Hassan Whiteside');
INSERT INTO player (player_name) VALUES ('Dewayne Dedmond');
INSERT INTO player (player_name) VALUES ('Anthony Davis');
INSERT INTO player (player_name) VALUES ('Tony Parker');
INSERT INTO player (player_name) VALUES ('Nikola Vucevic');
INSERT INTO player (player_name) VALUES ('DeAndre Jordan');
INSERT INTO player (player_name) VALUES ('Chris Paul');
INSERT INTO player (player_name) VALUES ('Ricky Rubio');
INSERT INTO player (player_name) VALUES ('Lonzo Ball');
INSERT INTO player (player_name) VALUES ('Eric Bledsoe');
INSERT INTO player (player_name) VALUES ('Kyrie Irving');
INSERT INTO player (player_name) VALUES ('Frank Ntilikina');
INSERT INTO player (player_name) VALUES ('Kris Dunn');
INSERT INTO player (player_name) VALUES ('Ben Simmons');
INSERT INTO player (player_name) VALUES ('Jamal Murray');
INSERT INTO player (player_name) VALUES ('Bogdan Bogdanovic');
INSERT INTO player (player_name) VALUES ('Clint Capela');
INSERT INTO player (player_name) VALUES ('Brandon Ingram');
INSERT INTO player (player_name) VALUES ('Malcolm Brogdon');
INSERT INTO player (player_name) VALUES ('Jaylen Brown');
INSERT INTO player (player_name) VALUES ('Tim Hardaway Jr.');
INSERT INTO player (player_name) VALUES ('Gary Harris');
INSERT INTO player (player_name) VALUES ('Buddy Hield');
INSERT INTO player (player_name) VALUES ('James Harden');
INSERT INTO player (player_name) VALUES ('Joe Ingles');
INSERT INTO player (player_name) VALUES ('Rajon Rondo');
INSERT INTO player (player_name) VALUES ('Khris Middleton');
INSERT INTO player (player_name) VALUES ('Mario Hezonja');
INSERT INTO player (player_name) VALUES ('Denzel Valentine');
INSERT INTO player (player_name) VALUES ('JJ Redick');
INSERT INTO player (player_name) VALUES ('Will Barton');
INSERT INTO player (player_name) VALUES ('Zach Randolph');
INSERT INTO player (player_name) VALUES ('Ryan Anderson');
INSERT INTO player (player_name) VALUES ('Derrick Favors');
INSERT INTO player (player_name) VALUES ('Gordon Hayward');
INSERT INTO player (player_name) VALUES ('Kristaps Porzingis');
INSERT INTO player (player_name) VALUES ('Dario Saric');
INSERT INTO player (player_name) VALUES ('Paul Millsap');
INSERT INTO player (player_name) VALUES ('Willie Cauley-Stein');
INSERT INTO player (player_name) VALUES ('Eric Gordon');
INSERT INTO player (player_name) VALUES ('Rudy Gobert');
INSERT INTO player (player_name) VALUES ('Matthew Dellavedova');
INSERT INTO player (player_name) VALUES ('Al Horford');
INSERT INTO player (player_name) VALUES ('Enes Kanter');
INSERT INTO player (player_name) VALUES ('Robin Lopez');
INSERT INTO player (player_name) VALUES ('Rudy Gay');
INSERT INTO player (player_name) VALUES ('Tyreke Evans');
INSERT INTO player (player_name) VALUES ('John Wall');
INSERT INTO player (player_name) VALUES ('Mike Conley');
INSERT INTO player (player_name) VALUES ('Jeff Teague');
INSERT INTO player (player_name) VALUES ('Spencer Dinwiddie');
INSERT INTO player (player_name) VALUES ('Russell Westbrook');
INSERT INTO player (player_name) VALUES ('George Hill');
INSERT INTO player (player_name) VALUES ('Brandon Knight');
INSERT INTO player (player_name) VALUES ('Reggie Jackson');
INSERT INTO player (player_name) VALUES ('Danny Green');
INSERT INTO player (player_name) VALUES ('Victor Oladipo');
INSERT INTO player (player_name) VALUES ('Bradley Beal');
INSERT INTO player (player_name) VALUES ('MarShon Brooks');
INSERT INTO player (player_name) VALUES ('DAngelo Russell);
INSERT INTO player (player_name) VALUES ('Paul George');
INSERT INTO player (player_name) VALUES ('JR Smith');
INSERT INTO player (player_name) VALUES ('Luke Kennard');
INSERT INTO player (player_name) VALUES ('Bojan Bodganovic');
INSERT INTO player (player_name) VALUES ('Otto Porter Jr.');
INSERT INTO player (player_name) VALUES ('Dillon Brooks');
INSERT INTO player (player_name) VALUES ('Derrick Rose');
INSERT INTO player (player_name) VALUES ('DeMarre Carroll');
INSERT INTO player (player_name) VALUES ('Carmelo Anthony');
INSERT INTO player (player_name) VALUES ('Kyle Korver');
INSERT INTO player (player_name) VALUES ('TJ Warren');
INSERT INTO player (player_name) VALUES ('Stanley Johnson');
INSERT INTO player (player_name) VALUES ('LaMarcus Aldridge');
INSERT INTO player (player_name) VALUES ('Thaddeus Young');
INSERT INTO player (player_name) VALUES ('Jeff Green');
INSERT INTO player (player_name) VALUES ('JaMychal Green');
INSERT INTO player (player_name) VALUES ('Andrew Wiggins');
INSERT INTO player (player_name) VALUES ('Rondae Hollis-Jefferson');
INSERT INTO player (player_name) VALUES ('Steven Adams');
INSERT INTO player (player_name) VALUES ('Kevin Love');
INSERT INTO player (player_name) VALUES ('Josh Jackson');
INSERT INTO player (player_name) VALUES ('Blake Griffin');
INSERT INTO player (player_name) VALUES ('Pau Gasol');
INSERT INTO player (player_name) VALUES ('Myles Turner');
INSERT INTO player (player_name) VALUES ('Dwight Howard');
INSERT INTO player (player_name) VALUES ('Marc Gasol');
INSERT INTO player (player_name) VALUES ('Jarrett Allen');
INSERT INTO player (player_name) VALUES ('Nerlens Noel');
INSERT INTO player (player_name) VALUES ('Tristan Thompson');
INSERT INTO player (player_name) VALUES ('Trevor Ariza');
INSERT INTO player (player_name) VALUES ('Andre Drummond');
INSERT INTO player (player_name) VALUES ('Jarred Vanderbilt');
INSERT INTO player (player_name) VALUES ('Jerome Robinson');
INSERT INTO player (player_name) VALUES ('Melvin Frazier Jr.');
INSERT INTO player (player_name) VALUES ('Zhaire Smith');
INSERT INTO player (player_name) VALUES ('Rodions Kurucs');
INSERT INTO player (player_name) VALUES ('Grayson Allen');
INSERT INTO player (player_name) VALUES ('Deandre Ayton');
INSERT INTO player (player_name) VALUES ('Landry Shamet');
INSERT INTO player (player_name) VALUES ('Elie Okobo');
INSERT INTO player (player_name) VALUES ('Mo Bamba');
INSERT INTO player (player_name) VALUES ('Bruce Brown');
INSERT INTO player (player_name) VALUES ('Mitchell Robinson');
INSERT INTO player (player_name) VALUES ('Donte DiVincenzo');
INSERT INTO player (player_name) VALUES ('Vincent Edwards');
INSERT INTO player (player_name) VALUES ('Chandler Hutchison');
INSERT INTO player (player_name) VALUES ('Robert Williams III');
INSERT INTO player (player_name) VALUES ('Marvin Bagley III');
INSERT INTO player (player_name) VALUES ('Jevon Carter');
INSERT INTO player (player_name) VALUES ('Wendell Carter Jr.');
INSERT INTO player (player_name) VALUES ('Hamidou Diallo');
INSERT INTO player (player_name) VALUES ('Miles Bridges');
INSERT INTO player (player_name) VALUES ('Khyri Thomas');
INSERT INTO player (player_name) VALUES ('Lonnie Walker IV');
INSERT INTO player (player_name) VALUES ('Allonzo Trier');
INSERT INTO player (player_name) VALUES ('Aaron Holiday');
INSERT INTO player (player_name) VALUES ('Jacob Evans III');
INSERT INTO player (player_name) VALUES ('Collin Sexton');
INSERT INTO player (player_name) VALUES ('DeAnthony Melton');
INSERT INTO player (player_name) VALUES ('Michael Porter Jr.');
INSERT INTO player (player_name) VALUES ('Justin Jackson');
INSERT INTO player (player_name) VALUES ('Kevin Huerter');
INSERT INTO player (player_name) VALUES ('Kostas Antetokounmpo');
INSERT INTO player (player_name) VALUES ('Anfernee Simons');
INSERT INTO player (player_name) VALUES ('Dzanan Musa');
INSERT INTO player (player_name) VALUES ('Jaren Jackson Jr.');
INSERT INTO player (player_name) VALUES ('Devonte Graham');
INSERT INTO player (player_name) VALUES ('Kevin Knox');
INSERT INTO player (player_name) VALUES ('Keita Bates-Diop');
INSERT INTO player (player_name) VALUES ('Troy Brown Jr.');
INSERT INTO player (player_name) VALUES ('Svi Mykhailiuk');
INSERT INTO player (player_name) VALUES ('Josh Okogie');
INSERT INTO player (player_name) VALUES ('Chimezie Metu');
INSERT INTO player (player_name) VALUES ('Omari Spellman');
INSERT INTO player (player_name) VALUES ('Moritz Wagner');
INSERT INTO player (player_name) VALUES ('Gary Trent Jr.');



INSERT INTO sport (sport_name) VALUES ('Basketball');
INSERT INTO sport (sport_name) VALUES ('Baseball');
INSERT INTO sport (sport_name) VALUES ('Football');
INSERT INTO sport (sport_name) VALUES ('Hockey');
INSERT INTO sport (sport_name) VALUES ('Soccer');

INSERT INTO team (team_name, sport_id) SELECT 'Miami Dolphins', sport_id from sport WHERE sport_name = 'Football';
INSERT INTO team (team_name, sport_id) SELECT 'Chicago White Sox', sport_id from sport WHERE sport_name = 'Baseball';
INSERT INTO team (team_name, sport_id) SELECT 'Orlando Magic', sport_id from sport WHERE sport_name = 'Basketball';
INSERT INTO team (team_name, sport_id) SELECT 'Kansas City Chiefs', sport_id from sport WHERE sport_name = 'Football';
INSERT INTO team (team_name, sport_id) SELECT 'San Francisco 49ers', sport_id from sport WHERE sport_name = 'Football';
INSERT INTO team (team_name, sport_id) SELECT 'Baltimore Ravens', sport_id from sport WHERE sport_name = 'Football';
INSERT INTO team (team_name, sport_id) SELECT 'Buffalo Bills', sport_id from sport WHERE sport_name = 'Football';
INSERT INTO team (team_name, sport_id) SELECT 'Pittsburgh Steelers', sport_id from sport WHERE sport_name = 'Football';
INSERT INTO team (team_name, sport_id) SELECT 'Cleveland Browns', sport_id from sport WHERE sport_name = 'Football';
INSERT INTO team (team_name, sport_id) SELECT 'Cincinnati Bengals', sport_id from sport WHERE sport_name = 'Football';
INSERT INTO team (team_name, sport_id) SELECT 'New England Patriots', sport_id from sport WHERE sport_name = 'Football';
INSERT INTO team (team_name, sport_id) SELECT 'New York Jets', sport_id from sport WHERE sport_name = 'Football';
INSERT INTO team (team_name, sport_id) SELECT 'Indianapolis Colts', sport_id from sport WHERE sport_name = 'Football';
INSERT INTO team (team_name, sport_id) SELECT 'Houston Texans', sport_id from sport WHERE sport_name = 'Football';
INSERT INTO team (team_name, sport_id) SELECT 'Jacksonville Jaguars', sport_id from sport WHERE sport_name = 'Football';
INSERT INTO team (team_name, sport_id) SELECT 'Atlanta Falcons', sport_id from sport WHERE sport_name = 'Football';
INSERT INTO team (team_name, sport_id) SELECT 'Dallas Cowboys', sport_id from sport WHERE sport_name = 'Football';
INSERT INTO team (team_name, sport_id) SELECT 'Philadelphia Eagles', sport_id from sport WHERE sport_name = 'Football';
INSERT INTO team (team_name, sport_id) SELECT 'Washington Commanders', sport_id from sport WHERE sport_name = 'Football';
INSERT INTO team (team_name, sport_id) SELECT 'New York Giants', sport_id from sport WHERE sport_name = 'Football';
INSERT INTO team (team_name, sport_id) SELECT 'Green Bay Packers', sport_id from sport WHERE sport_name = 'Football';
INSERT INTO team (team_name, sport_id) SELECT 'Chicago Bears', sport_id from sport WHERE sport_name = 'Football';
INSERT INTO team (team_name, sport_id) SELECT 'Minnesota Vikings', sport_id from sport WHERE sport_name = 'Football';
INSERT INTO team (team_name, sport_id) SELECT 'Detroit Lions', sport_id from sport WHERE sport_name = 'Football';
INSERT INTO team (team_name, sport_id) SELECT 'Los Angeles Chargers', sport_id from sport WHERE sport_name = 'Football';
INSERT INTO team (team_name, sport_id) SELECT 'Los Angeles Rams', sport_id from sport WHERE sport_name = 'Football';
INSERT INTO team (team_name, sport_id) SELECT 'Las Vegas Raiders', sport_id from sport WHERE sport_name = 'Football';
INSERT INTO team (team_name, sport_id) SELECT 'Denver Broncos', sport_id from sport WHERE sport_name = 'Football';
INSERT INTO team (team_name, sport_id) SELECT 'Seattle Seahawks', sport_id from sport WHERE sport_name = 'Football';
INSERT INTO team (team_name, sport_id) SELECT 'Arizona Cardinals', sport_id from sport WHERE sport_name = 'Football';
INSERT INTO team (team_name, sport_id) SELECT 'Tampa Bay Buccaneers', sport_id from sport WHERE sport_name = 'Football';
INSERT INTO team (team_name, sport_id) SELECT 'New Orleans Saints', sport_id from sport WHERE sport_name = 'Football';
INSERT INTO team (team_name, sport_id) SELECT 'Carolina Panthers', sport_id from sport WHERE sport_name = 'Football';
INSERT INTO team (team_name, sport_id) SELECT 'Tennessee Titans', sport_id from sport WHERE sport_name = 'Football';
INSERT INTO team (team_name, sport_id) SELECT 'Boston Celtics', sport_id from sport WHERE sport_name = 'Basketball';
INSERT INTO team (team_name, sport_id) SELECT 'Milwaukee Bucks', sport_id from sport WHERE sport_name = 'Basketball';
INSERT INTO team (team_name, sport_id) SELECT 'Philadelphia 76ers', sport_id from sport WHERE sport_name = 'Basketball';
INSERT INTO team (team_name, sport_id) SELECT 'New York Knicks', sport_id from sport WHERE sport_name = 'Basketball';
INSERT INTO team (team_name, sport_id) SELECT 'Cleveland Cavaliers', sport_id from sport WHERE sport_name = 'Basketball';
INSERT INTO team (team_name, sport_id) SELECT 'Indiana Pacers', sport_id from sport WHERE sport_name = 'Basketball';
INSERT INTO team (team_name, sport_id) SELECT 'Miami Heat', sport_id from sport WHERE sport_name = 'Basketball';
INSERT INTO team (team_name, sport_id) SELECT 'Chicago Bulls', sport_id from sport WHERE sport_name = 'Basketball';
INSERT INTO team (team_name, sport_id) SELECT 'Brooklyn Nets', sport_id from sport WHERE sport_name = 'Basketball';
INSERT INTO team (team_name, sport_id) SELECT 'Atlanta Hawks', sport_id from sport WHERE sport_name = 'Basketball';
INSERT INTO team (team_name, sport_id) SELECT 'Toronto Raptors', sport_id from sport WHERE sport_name = 'Basketball';
INSERT INTO team (team_name, sport_id) SELECT 'Charlotte Hornets', sport_id from sport WHERE sport_name = 'Basketball';
INSERT INTO team (team_name, sport_id) SELECT 'Washington Wizards', sport_id from sport WHERE sport_name = 'Basketball';
INSERT INTO team (team_name, sport_id) SELECT 'Detroit Pistons', sport_id from sport WHERE sport_name = 'Basketball';
INSERT INTO team (team_name, sport_id) SELECT 'Minnesota Timberwolves', sport_id from sport WHERE sport_name = 'Basketball';
INSERT INTO team (team_name, sport_id) SELECT 'Denver Nuggets', sport_id from sport WHERE sport_name = 'Basketball';
INSERT INTO team (team_name, sport_id) SELECT 'Oklahoma City Thunder', sport_id from sport WHERE sport_name = 'Basketball';
INSERT INTO team (team_name, sport_id) SELECT 'Los Angeles Clippers', sport_id from sport WHERE sport_name = 'Basketball';
INSERT INTO team (team_name, sport_id) SELECT 'Sacramento Kings', sport_id from sport WHERE sport_name = 'Basketball';
INSERT INTO team (team_name, sport_id) SELECT 'Phoenix Suns', sport_id from sport WHERE sport_name = 'Basketball';
INSERT INTO team (team_name, sport_id) SELECT 'Dallas Mavericks', sport_id from sport WHERE sport_name = 'Basketball';
INSERT INTO team (team_name, sport_id) SELECT 'New Orleans Pelicans', sport_id from sport WHERE sport_name = 'Basketball';
INSERT INTO team (team_name, sport_id) SELECT 'Los Angeles Lakers', sport_id from sport WHERE sport_name = 'Basketball';
INSERT INTO team (team_name, sport_id) SELECT 'Utah Jazz', sport_id from sport WHERE sport_name = 'Basketball';
INSERT INTO team (team_name, sport_id) SELECT 'Houston Rockets', sport_id from sport WHERE sport_name = 'Basketball';
INSERT INTO team (team_name, sport_id) SELECT 'Golden State Warriors', sport_id from sport WHERE sport_name = 'Basketball';
INSERT INTO team (team_name, sport_id) SELECT 'Memphis Grizzlies', sport_id from sport WHERE sport_name = 'Basketball';
INSERT INTO team (team_name, sport_id) SELECT 'Portland Trail Blazers', sport_id from sport WHERE sport_name = 'Basketball';
INSERT INTO team (team_name, sport_id) SELECT 'San Antonio Spurs', sport_id from sport WHERE sport_name = 'Basketball';
INSERT INTO team (team_name, sport_id) SELECT 'Baltimore Orioles', sport_id from sport WHERE sport_name = 'Baseball';
INSERT INTO team (team_name, sport_id) SELECT 'Tampa Bay Rays', sport_id from sport WHERE sport_name = 'Baseball';
INSERT INTO team (team_name, sport_id) SELECT 'Toronto Blue Jays', sport_id from sport WHERE sport_name = 'Baseball';
INSERT INTO team (team_name, sport_id) SELECT 'New York Yankees', sport_id from sport WHERE sport_name = 'Baseball';
INSERT INTO team (team_name, sport_id) SELECT 'Boston Red Sox', sport_id from sport WHERE sport_name = 'Baseball';
INSERT INTO team (team_name, sport_id) SELECT 'Minnesota Twins', sport_id from sport WHERE sport_name = 'Baseball';
INSERT INTO team (team_name, sport_id) SELECT 'Detroit Tigers', sport_id from sport WHERE sport_name = 'Baseball';
INSERT INTO team (team_name, sport_id) SELECT 'Cleveland Guardians', sport_id from sport WHERE sport_name = 'Baseball';
INSERT INTO team (team_name, sport_id) SELECT 'Kansas City Royals', sport_id from sport WHERE sport_name = 'Baseball';
INSERT INTO team (team_name, sport_id) SELECT 'Houston Astros', sport_id from sport WHERE sport_name = 'Baseball';
INSERT INTO team (team_name, sport_id) SELECT 'Texas Rangers', sport_id from sport WHERE sport_name = 'Baseball';
INSERT INTO team (team_name, sport_id) SELECT 'Seattle Mariners', sport_id from sport WHERE sport_name = 'Baseball';
INSERT INTO team (team_name, sport_id) SELECT 'Los Angeles Angels', sport_id from sport WHERE sport_name = 'Baseball';
INSERT INTO team (team_name, sport_id) SELECT 'Oakland Athletics', sport_id from sport WHERE sport_name = 'Baseball';
INSERT INTO team (team_name, sport_id) SELECT 'Atlanta Braves', sport_id from sport WHERE sport_name = 'Baseball';
INSERT INTO team (team_name, sport_id) SELECT 'Philadelphia Phillies', sport_id from sport WHERE sport_name = 'Baseball';
INSERT INTO team (team_name, sport_id) SELECT 'Miami Marlins', sport_id from sport WHERE sport_name = 'Baseball';
INSERT INTO team (team_name, sport_id) SELECT 'New York Mets', sport_id from sport WHERE sport_name = 'Baseball';
INSERT INTO team (team_name, sport_id) SELECT 'Washington Nationals', sport_id from sport WHERE sport_name = 'Baseball';
INSERT INTO team (team_name, sport_id) SELECT 'Milwaukee Brewers', sport_id from sport WHERE sport_name = 'Baseball';
INSERT INTO team (team_name, sport_id) SELECT 'Chicago Cubs', sport_id from sport WHERE sport_name = 'Baseball';
INSERT INTO team (team_name, sport_id) SELECT 'Cincinnati Reds', sport_id from sport WHERE sport_name = 'Baseball';
INSERT INTO team (team_name, sport_id) SELECT 'Pittsburgh Pirates', sport_id from sport WHERE sport_name = 'Baseball';
INSERT INTO team (team_name, sport_id) SELECT 'St. Louis Cardinals', sport_id from sport WHERE sport_name = 'Baseball';
INSERT INTO team (team_name, sport_id) SELECT 'Los Angeles Dodgers', sport_id from sport WHERE sport_name = 'Baseball';
INSERT INTO team (team_name, sport_id) SELECT 'Arizona Diamondbacks', sport_id from sport WHERE sport_name = 'Baseball';
INSERT INTO team (team_name, sport_id) SELECT 'San Diego Padres', sport_id from sport WHERE sport_name = 'Baseball';
INSERT INTO team (team_name, sport_id) SELECT 'San Francisco Giants', sport_id from sport WHERE sport_name = 'Baseball';
INSERT INTO team (team_name, sport_id) SELECT 'Colorado Rockies', sport_id from sport WHERE sport_name = 'Baseball';
INSERT INTO team (team_name, sport_id) SELECT 'Philadelphia 76ers', sport_id from sport WHERE sport_name = 'Basketball';

INSERT INTO set (set_name, year, brand, set_image) VALUES ('Donruss', 2018, 'Panini', '2018_Donruss_Football.jpg');
INSERT INTO set (set_name, year, brand, set_image) VALUES ('Prizm', 2021, 'Panini', '2021_Prizm_Basketball.jpg');
INSERT INTO set (set_name, year, brand, set_image) VALUES ('Bowman Chrome', 2018,'Topps', '2018_Bowman_Chrome_Baseball.jpg');
INSERT INTO set (set_name, year, brand, set_image) VALUES ('Optic', 2018,'Panini', '2018_Optic Basketball.jpg');
INSERT INTO set (set_name, year, brand, set_image) VALUES ('Topps', 2020,'Topps', '2020_Topps_Baseball.jpg');
INSERT INTO set (set_name, year, brand, set_image) VALUES ('Gypsy Queen', 2021,'Topps', '2021_Gypsy_Queen_Baseball.jpg');
INSERT INTO set (set_name, year, brand, set_image) VALUES ('National Treasures', 2022,'Panini', '2022_National_Treasures_Football.jpg');
INSERT INTO set (set_name, year, brand, set_image) VALUES ('Prestige', 2019,'Panini', '2019_Prestige_Football.jpg');
INSERT INTO set (set_name, year, brand, set_image) VALUES ('Prizm', 2014,'Panini', '2014_Prizm_Basketball.jpg');
INSERT INTO set (set_name, year, brand, set_image) VALUES ('Topps Chrome', 2019,'Topps', '2019_Topps_Chrome_Baseball.jpg');

--inserting cards below

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Blue', '177', 'image.jpg', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Luka Doncic';


WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base Rookie', '1', 'Ohtani_Bowman_Chrome_Rookie.jpg', set_id FROM set WHERE set_name = 'Bowman Chrome' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Shohei Ohtani';


WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base Rookie', '40','Ronald_Acuna_Jr_Rookie_Bowman_Chrome.jpg', set_id FROM set WHERE set_name = 'Bowman Chrome' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Ronald Acuna Jr.';


WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Pink Ice Rookie', '249','Paolo_Banchero_Prizm_Pink_Ice_Rookie.jpg', set_id FROM set WHERE set_name = 'Prizm' AND year = 2021
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Paolo Banchero';


WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base Rookie', '253','Joel_Embiid_Prizm_Base_Rookie.jpg', set_id FROM set WHERE set_name = 'Prizm' AND year = 2014
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Joel Embiid';


WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Signatures', 'SIG-NCH','Nick_Chubb_2022_National_Treasures_Auto.jpg', set_id FROM set WHERE set_name = 'National Treasures' AND year = 2022
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Nick Chubb';


WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '181', 'Lamar_Jackson_2019_Prestige_base.jpg', set_id FROM set WHERE set_name = 'Prestige' AND year = 2019
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Lamar Jackson';


WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '198','vlad_guerrero_jr_gypsy_queen_base_2021.jpg', set_id FROM set WHERE set_name = 'Gypsy Queen' AND year = 2021
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Vladimir Guerrero Jr.';


WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT '1984 Refractor', '84TC-17', 'trout_2019_topps_chrome_1984refractor.jpg', set_id FROM set WHERE set_name = 'Topps Chrome' AND year = 2019
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Mike Trout';


WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base Rookie', '304', 'josh_allen_donruss_rated_rookie.jpg', set_id FROM set WHERE set_name = 'Donruss' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Josh Allen';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '1', 'damian_lillard_2018-optic_base.jpg', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Damian Lillard';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '2', 'steph-curry_2018-optic_base.jpg', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Stephen Curry';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '3', 'kyle-lowry-2018-optic-base.jpg', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Kyle Lowry';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '4', 'pat-bev-2018-optic-base.jpg', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Patrick Beverley';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '5', 'goran-dragic-2018-optic-base.jpg', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Goran Dragic';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '6', 'schroder-2018-optic-base.jpg', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Dennis Schroder';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '7', 'elfrid-payton-2018-optic-base.jpg', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Elfrid Payton';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '8', 'kemba-2018-optic-base.jpg', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Kemba Walker';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '9', 'dj-augustin-2018-optic-base.jpg', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'DJ Augustin';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '10', 'dennis-smith-jr-2018-optic-base.jpg', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Dennis smith Jr.';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '11', '', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'CJ McCollum';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '12', '', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Klay Thompson';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '13', '', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'DeMar DeRozan';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '14', '', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Lou Williams';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '15', '', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Dwyane Wade';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '16', '', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Jeremy Lin';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '17', '', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Jrue Holiday';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '18', '', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Nicolas Batum';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '19', '', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Evan Fournier';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '20', '', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Wesley Matthews';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '21', '', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Evan Turner';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '22', '', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Kevin Durant';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '23', '', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'OG Anunoby';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '24', '', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Avery Bradley';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '25', '', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'James Johnson';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '26', '', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Taurean Prince';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '27', '', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Nikola Mirotic';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '28', '', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Malik Monk';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '29', '', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Terrence Ross';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '30', '', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Harrison Barnes';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '31', '', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Zach Collins';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '32', '', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Draymond Green';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '33', '', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Serge Ibaka';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '34', '', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Tobias Harris';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '35', '', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Dion Waiters';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '36', '', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'John Collins';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '37', '', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Julius Randle';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '38', '', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Michael Kidd-Gilchrist';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '39', '', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Aaron Gordon';

WITH c AS (
	INSERT INTO card (card_name, card_number, image, set_id)
	SELECT 'Base', '40', '', set_id FROM set WHERE set_name = 'Optic' AND year = 2018
	RETURNING card_id
)
INSERT INTO player_card (player_id, card_id)
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Dirk Nowitzki';





INSERT INTO user_card (user_id, card_id) VALUES (1, 1);
INSERT INTO user_card (user_id, card_id) VALUES (1, 2);
INSERT INTO user_card (user_id, card_id) VALUES (1, 3);
INSERT INTO user_card (user_id, card_id) VALUES (1, 4);



