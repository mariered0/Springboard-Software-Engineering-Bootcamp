
DROP DATABASE craigslist_db;
CREATE DATABASE craigslist_db;
\c craigslist_db;


CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT,
    region_id INTEGER REFERENCES regions ON DELETE SET NULL
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    category_name TEXT
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(50),
    description TEXT,
    category_id INTEGER REFERENCES categories ON DELETE SET NULL,
    user_id INTEGER REFERENCES users ON DELETE SET NULL,
    region_id INTEGER REFERENCES regions ON DELETE SET NULL,
    post_date DATE
);


-- INSERT INTO regions (name)
-- VALUES
-- ('San Francisco'),
-- ('Atlanta'),
-- ('Seattle'),
-- ('New York');

-- INSERT INTO users (username, region_id)
-- VALUES
-- ('marired', 3),
-- ('stevie_w', 1),
-- ('wonder', 2),
-- ('peco', 4);

-- INSERT INTO categories (category_name)
-- VALUES
-- ('sell'),
-- ('job'),
-- ('appartment');

-- INSERT INTO posts (title, description, category_id, user_id, region_id, post_date)
-- VALUES
-- ('heyhey', 'Anyone looking for a bed?', 1, 2, 4, '2022-07-19'),
-- ('Looking for a receptionist', 'Hello. We are currently looking for a receptionist.', 2, 4, 4, '2020-10-29'),
-- ('A furnished room', 'looking for a room mate', 3, 1, 3, '2010-05-05');