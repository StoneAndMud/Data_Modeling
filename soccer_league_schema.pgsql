-- All of the teams in the league
-- All of the goals scored by every player for each game
-- All of the players in the league and their corresponding teams
-- All of the referees who have been part of each game
-- All of the matches played between teams
-- All of the start and end dates for season that a league has
-- The standings/rankings of each team in the league (This doesn’t have to be its own table if the data can be captured somehow).

CREATE TABLE leagues (
    -- ID
    id SERIAL PRIMARY KEY,
    -- League name
    league_name TEXT NOT NULL,
    -- confederation
    confederation INTEGER REFERENCES confederations(id),
    -- League country name
    league_country_name TEXT,
    -- team in league
    team_name INTEGER REFERENCES teams(id)
    -- current season
    current_season VARCHAR(25),
);

CREATE TABLE confederations (
    -- ID
    id SERIAL PRIMARY KEY,
    -- Confederation name
    confederation_name TEXT NOT NULL,
);

CREATE TABLE teams (
    -- ID
    id SERIAL PRIMARY KEY,
    -- Team
    team_name TEXT NOT NULL,
    -- current League
    league_name INTEGER REFERENCES leagues(id),
    -- Current rank
    current_rank INTEGER NOT NULL,
    -- Current points
    current_points INTEGER NOT NULL,
);

CREATE TABLE players (
    -- ID
    id SERIAL PRIMARY KEY,
    -- player
    player_name TEXT NOT NULL,
    -- total goals
    total_goals_scored INTEGER,
    -- salary
    salary INTEGER NOT NULL,
    -- Birth country
    birth_country VARCHAR(25) NOT NULL,
    -- Current Team
    current_team INTEGER REFERENCES teams(id) ON DELETE SET NULL,
);

CREATE TABLE referees (
    -- ID
    id SERIAL PRIMARY KEY,
    -- ref
    referee_name TEXT NOT NULL,
    -- salary
    salary INTEGER NOT NULL,
    -- Birth country
    birth_country VARCHAR(25) NOT NULL,
);

CREATE TABLE reffed_matches (
    -- ID
    id SERIAL PRIMARY KEY
    -- ref for match
    reffed_by INTEGER REFERENCES referees(id),
)

CREATE TABLE matches (
    -- ID
    id SERIAL PRIMARY KEY,
    -- team one
    team_one INTEGER REFERENCES teams(id),
    -- team two
    team_two INTEGER REFERENCES teams(id),
    -- end score
    end_score INT NOT NULL,
    -- winning team
    winning_team INTEGER REFERENCES teams(id),
    -- losing team
    losing_team INTEGER REFERENCES teams(id),
    -- match location
    location TEXT,
    -- 
);

CREATE TABLE start_end_dates (
    -- ID
    id SERIAL PRIMARY KEY,
    -- Start
    start_date DATE NOT NULL,
    -- End
    end_date DATE NOT NULL,
    -- match ID
    match_id INTEGER REFERENCES matches(id),
);

CREATE TABLE standings (
    -- ID
    id SERIAL PRIMARY KEY,
    -- team name
    team_name INTEGER REFERENCES teams(id),
    -- points
    points INT,
);

CREATE TABLE goals (
    -- ID
    id SERIAL PRIMARY KEY,
    -- player name
    scored_by INTEGER REFERENCES players(id) ON DELETE SET NULL,
    -- current goal tally
    goal_num INT NOT NULL,
    -- during this match
    during_match INT REFERENCES matches(id),
);