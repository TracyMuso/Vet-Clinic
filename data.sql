/* Populate database with sample data. */

INSERT INTO animals (
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
) VALUES
  (1, 'Agumon', '2020-02-03', 0, true, 10.23),
  (2, 'Gabumon', '2018-11-15', 2, true, 8),
  (3, 'Pikachu', '2021-01-07', 1, false, 15.04),
  (4, 'Devimon', '2017-05-12', 5, true, 11);

  INSERT INTO animals (
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  ) VALUES
  (5, 'Charmander', '2020-02-08', 0, false, -11),
  (6, 'Plantmon', '2021-11-15', 2, true, -5.7),
  (7, 'Squirtle', '1993-04-02', 3, false, -12.13),
  (8, 'Angemon', '2005-06-12', 1, true, -45),
  (9, 'Boarmon', '2005-07-12', 7, true, 20.4),
  (10, 'Blossom', '1998-10-13', 3, true, 17),
  (11, 'Ditto', '2022-05-14', 4, false, 22);

  INSERT INTO owners (
    id,
    full_name,
    age
  ) VALUES
  (1, 'Sam Smith', 34),
  (2, 'Jennifer Orwell', 19),
  (3, 'Bob', 45),
  (4, 'Melody Pond', 77),
  (5, 'Dean Winchester', 14),
  (6, 'Jodie Whittaker', 38);

  INSERT INTO species (
    id, name
  ) VALUES
  (1, 'pokemon'),
  (2, 'digimon');

  UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';

  UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';

  UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
  UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';
  UPDATE animals SET owner_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';
  UPDATE animals SET owner_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' or name = 'Blossom';
  UPDATE animals SET owner_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';
