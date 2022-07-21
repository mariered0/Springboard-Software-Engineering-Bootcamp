DROP DATABASE soccer_league_db;
CREATE DATABASE soccer_league_db;
\c soccer_league_db;


CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name text,
    team_id INTEGER REFERENCES teams ON DELETE SET NULL,
    position TEXT
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE seasons (
    id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

CREATE TABLE games (
    id SERIAL PRIMARY KEY,
    season_id INTEGER REFERENCES seasons ON DELETE SET NULL,
    game_date DATE,
    team1 INTEGER REFERENCES teams ON DELETE SET NULL,
    team2 INTEGER REFERENCES teams ON DELETE SET NULL,
    referee_id INTEGER REFERENCES referees ON DELETE SET NULL
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    game_id INTEGER REFERENCES games ON DELETE SET NULL,
    player_id INTEGER REFERENCES players ON DELETE SET NULL,
    num_goals INTEGER
);


-- INSERT INTO teams (name)
-- VALUES
-- ('Yokohama F Marinos'),
-- ('Kashima Antlers'),
-- ('Kawasaki Frontale'),
-- ('Kashiwa Reysol'),
-- ('Cerezo Osaka'),
-- ('FC Tokyo');

-- INSERT INTO players (name, position, team_id)
-- VALUES
-- ('Yohei Takaoka', 'GK', 1),
-- ('Koki Anzai', 'DF', 2),
-- ('Kento Tachibanada', 'MF', 3),
-- ('Yuki Muto', 'FW', 4),
-- ('Ryosuke Yamanaka', 'DF', 5),
-- ('Diego Oliveira', 'FW', 6);
