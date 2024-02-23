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

INSERT INTO set (set_name, year, brand) VALUES ('Donruss', 2018, 'Panini');
INSERT INTO set (set_name, year, brand) VALUES ('Prizm', 2021, 'Panini');
INSERT INTO set (set_name, year, brand) VALUES ('Bowman Chrome', 2018,'Topps');
INSERT INTO set (set_name, year, brand) VALUES ('Optic', 2018,'Panini');
INSERT INTO set (set_name, year, brand) VALUES ('Topps', 2020,'Topps');
INSERT INTO set (set_name, year, brand) VALUES ('Gypsy Queen', 2021,'Topps');
INSERT INTO set (set_name, year, brand) VALUES ('National Treasures', 2022,'Panini');
INSERT INTO set (set_name, year, brand) VALUES ('Prestige', 2019,'Panini');
INSERT INTO set (set_name, year, brand) VALUES ('Prizm', 2014,'Panini');
INSERT INTO set (set_name, year, brand) VALUES ('Topps Chrome', 2019,'Topps');

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
SELECT p.player_id, c.card_id FROM player p, c WHERE p.player_name = 'Vladimir Guerrero Jr';


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


INSERT INTO user_card (user_id, card_id) VALUES (1, 1);
INSERT INTO user_card (user_id, card_id) VALUES (1, 2);
INSERT INTO user_card (user_id, card_id) VALUES (1, 3);
INSERT INTO user_card (user_id, card_id) VALUES (1, 4);



