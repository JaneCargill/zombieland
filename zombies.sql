DROP TABLE bitings;
DROP TABLE zombies;
DROP TABLE victims;

CREATE TABLE zombies (
  name VARCHAR(255),
  type VARCHAR(255),
  id SERIAL8 primary key
);

CREATE TABLE victims(
name VARCHAR(255),
run_speed INT2,
id SERIAL8 primary key
);

CREATE TABLE bitings(
zombie_id INT8 references zombies(id),
victim_id INT8 references victims(id),
body_part VARCHAR(255)
);

INSERT INTO zombies (name, type) VALUES ('logan', 'drooler');
INSERT INTO zombies (name, type) VALUES ('federico', 'runner');
INSERT INTO zombies (name, type) VALUES ('john', 'walker');

SELECT * FROM zombies;

INSERT INTO victims (name, run_speed) VALUES ('lewis', 2);
INSERT INTO victims (name, run_speed) VALUES ('adam', 6);
INSERT INTO victims (name, run_speed) VALUES ('winnie', 5);

SELECT * FROM victims;

INSERT INTO bitings (zombie_id, victim_id, body_part) VALUES (1 , 1, 'arm');
INSERT INTO bitings (zombie_id, victim_id, body_part) VALUES (2, 2, 'ankle');
INSERT INTO bitings (zombie_id, victim_id, body_part) VALUES (2, 3, 'hand');
INSERT INTO bitings (zombie_id, victim_id, body_part) VALUES (3, 3, 'leg');

/**UPDATE bitings SET victim_id = (
SELECT name from victims WHERE id = bitings.victim_id
);**/

SELECT zombies.name, victims.name
FROM zombies, victims, bitings
WHERE zombies.id = bitings.zombie_id
AND victims.id = bitings.victim_id;

SELECT * FROM bitings;
