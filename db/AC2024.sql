DROP DATABASE IF EXISTS AC2024;
CREATE DATABASE AC2024;
USE AC2024;

CREATE TABLE USERS (
    ID INTEGER NOT NULL PRIMARY KEY auto_increment,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    password_hash VARCHAR(50) NOT NULL,
    major VARCHAR(100), 
    year_group INT,
    date_of_birth DATE,
    gender ENUM('Male', 'Female'),
    Created_at DATETIME NOT NULL,
    UNIQUE INDEX uq_email (email ASC)
);

CREATE TABLE POST (
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INTEGER NOT NULL,
    content TEXT NOT NULL,
    picture_path TEXT NOT NULL,
    created_at DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES USERS (ID)
);

CREATE TABLE COMMENT (
    ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    COMMENT_TEXT TEXT NOT NULL,
    POSTID INTEGER NOT NULL,
    userId INTEGER NOT NULL,
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (POSTID) REFERENCES POST (id),
    FOREIGN KEY (userId) REFERENCES USERS (ID)
);

CREATE TABLE LIKES (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    postId INTEGER NOT NULL,
    userId INTEGER NOT NULL,
    FOREIGN KEY (postId) REFERENCES POST(id),
    FOREIGN KEY (userId) REFERENCES USERS (id)
);

CREATE TABLE MESSAGES (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    sender_id INTEGER NOT NULL,
    receiver_id INTEGER NOT NULL,
    message_text TEXT NOT NULL,
    created_at DATETIME NOT NULL,
    FOREIGN KEY (sender_id) REFERENCES USERS (id),
    FOREIGN KEY (receiver_id) REFERENCES USERS (id)
);

CREATE TABLE EVENTS (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    event_name VARCHAR(100) NOT NULL,
    event_description TEXT,
    event_date DATE,
    location VARCHAR(255),
    created_at DATETIME NOT NULL
);

CREATE TABLE EVENT_SIGNUP (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    event_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    signup_date DATETIME NOT NULL,
    FOREIGN KEY (event_id) REFERENCES EVENTS (id),
    FOREIGN KEY (user_id) REFERENCES USERS (ID)
);

ALTER TABLE USERS
MODIFY COLUMN password_hash VARCHAR(255) NOT NULL;

ALTER TABLE USERS
ADD COLUMN reset_token VARCHAR(255) NOT NULL DEFAULT '';