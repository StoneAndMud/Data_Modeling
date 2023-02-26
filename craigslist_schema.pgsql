-- The region of the craigslist post (San Francisco, Atlanta, Seattle, etc)
-- Users and preferred region
-- Posts: contains title, text, the user who has posted, the location of the posting, the region of the posting
-- Categories that each post belongs to

CREATE TABLE posts (
    -- ID
    id SERIAL PRIMARY KEY,
    -- Title
    title TEXT NOT NULL,
    -- Text
    content TEXT,
    -- Posted By USER ID
    posted_by INTEGER REFERENCES users(id) ON DELETE SET NULL,
    -- Location of post
    located_at INTEGER REFERENCES locations(id) ON DELETE SET NULL,
    -- region of the post
    of_region INTEGER REFERENCES regions(id) ON DELETE SET NULL,
    -- Category
    category INTEGER categories(id) ON DELETE SET NULL,
)

CREATE TABLE locations (
    -- ID
    id SERIAL PRIMARY KEY,
    -- location name
    location_name VARCHAR(20),
    -- In This Region
    in_region INTEGER REFERENCES regions(id) ON DELETE SET NULL,
)

CREATE TABLE regions (
    -- ID
    id SERIAL PRIMARY KEY,
    -- Region
    name TEXT,
)

CREATE TABLE users (
    -- ID
    id SERIAL PRIMARY KEY,
    -- Username
    username VARCHAR(25) NOT NULL,
    -- pass
    password VARCHAR(25) NOT NULL,
    -- pref Region
    preferred_region INTEGER REFERENCES regions(id) ON DELETE SET NULL,
)

CREATE TABLE categories (
    -- ID
    id SERIAL PRIMARY KEY,
    -- Category
    category TEXT,
)