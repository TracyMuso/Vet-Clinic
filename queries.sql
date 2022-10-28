/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';
SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name from animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth from animals WHERE name = 'Pikachu' OR name = 'Agumon';
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered = true;
SELECT * from animals WHERE NOT name = 'Gabumon';
SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- start transactions
BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;

BEGIN
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE name NOT LIKE '%mon';
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT tooyoung;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT tooyoung;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT (*) FROM animals;
SELECT COUNT (*) FROM animals WHERE escape_attempts = 0;
SELECT AVG (weight_kg) FROM animals;
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;
SELECT MAX(weight_kg), MIN(weight_kg) FROM animals;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

-- make queries using join
SELECT animals.name FROM animals
INNER JOIN owners ON owners.id = animals.owner_id
WHERE owners.full_name = 'Melody Pond';

SELECT * FROM animals
JOIN species ON animals.species_id = species.id
WHERE species.name = 'pokemon';

SELECT animals.name, owners.full_name FROM animals
RIGHT JOIN owners ON animals.owner_id = owners.id;

SELECT species.name, COUNT(animals.species_id) FROM animals
JOIN species ON species.id = animals.species_id GROUP BY species.name;

SELECT animals.name FROM animals JOIN owners ON owners.id = animals.owner_id JOIN species on species.id = animals.species_id WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'digimon'; 

SELECT animals.name FROM animals JOIN owners ON owners.id = animals.owner_id WHERE animals.escape_attempts = 0 AND owners.full_name = 'Dean Winchester';

SELECT owners.full_name, COUNT(animals.name) FROM owners LEFT JOIN animals ON owners.id = animals.owner_id GROUP BY owners.full_name ORDER BY COUNT(animals.name) DESC;

-- queries on vet and specializations tables
SELECT animals.name, visits.date_of_visit FROM animals JOIN visits ON visits.animal_id = animals.id JOIN vets ON vets.id = visits.vet_id WHERE vets.name = 'William Tatcher' ORDER BY visits.date_of_visit DESC LIMIT 1;

SELECT COUNT(DISTINCT(animals.name)) FROM animals JOIN visits ON visits.animal_id = animals.id
JOIN vets ON visits.vet_id = vets.id WHERE vets.name = 'Stephanie Mendez';

SELECT vets.name, species.name as vet_dets FROM vets LEFT JOIN specializations ON vets.id = specializations.vet_id LEFT JOIN species ON species.id = specializations.species_id;

SELECT animals.name, visits.date_of_visit FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON vets.id = visits.vet_id WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

SELECT animals.name, COUNT(visits.date_of_visit) AS max_visits FROM animals JOIN visits ON animals.id = visits.animal_id GROUP BY animals.name ORDER BY max_visits DESC LIMIT 1;

SELECT animals.name, visits.date_of_visit FROM animals JOIN visits on animals.id = visits.animal_id JOIN vets ON vets.id = visits.vet_id WHERE vets.name = 'Maisy Smith' ORDER BY visits.date_of_visit ASC LIMIT 1;

SELECT animals.name, animals.neutered, vets.name, vets.age, visits.date_of_visit AS last_visit FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON vets.id = visits.vet_id ORDER BY visits.date_of_visit DESC LIMIT 1;

SELECT COUNT(date_of_visit), vets.name FROM visits RIGHT JOIN vets ON vets.id = visits.vet_id JOIN animals ON animals.id = visits.animal_id JOIN specializations ON specializations.vet_id = vets.id WHERE specializations.species_id != animals.species_id GROUP BY vets.name;

SELECT vets.name, species.name, COUNT(species.name) FROM visits LEFT JOIN animals ON animals.id = visits.animal_id INNER JOIN vets ON vets.id = visits.vet_id INNER JOIN species ON species.id = animals.species_id WHERE vets.name = 'Maisy Smith' GROUP BY vets.name, species.name ORDER BY COUNT DESC LIMIT 1;
