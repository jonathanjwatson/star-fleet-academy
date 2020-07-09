DROP DATABASE IF EXISTS star_trekDB;
CREATE DATABASE star_trekDB;

USE star_trekDB;

CREATE TABLE ranks(
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(30),
num_pips INT,
PRIMARY KEY (id)
);

CREATE TABLE specialties(
id INT NOT NULL AUTO_INCREMENT,
title VARCHAR(30),
shirt_color VARCHAR(10),
PRIMARY KEY (id)
);

CREATE TABLE crew_members(
  id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(100),
    specialty_id INT,
    rank_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (specialty_id) REFERENCES specialties(id),
  FOREIGN KEY (rank_id) REFERENCES ranks(id)
);

SELECT * FROM ranks;
SELECT * FROM specialties;
SELECT * FROM crew_members;

INSERT INTO ranks(name, num_pips)
VALUES ("Captain", 4), ("Commander", 3), ("Lieutenant", 2), ("Ensign", 1);

INSERT INTO specialties (title, shirt_color)
VALUES ("Command", "red"), ("Science", "blue"), ("Engineering", "yellow");

INSERT INTO crew_members(name, specialty_id, rank_id)
VALUES ("Jean Luc Picard", 1, 1), ("Data", 3, 2), ("Deanna Troi", 2, 2);

INSERT INTO crew_members(name, rank_id)
VALUES ("Seven of Nine", 1);

SELECT crew_members.id, crew_members.name, ranks.name AS current_rank, ranks.num_pips, specialties.title, specialties.shirt_color 
FROM crew_members
LEFT JOIN specialties ON crew_members.specialty_id = specialties.id
LEFT JOIN ranks ON crew_members.rank_id = ranks.id;



