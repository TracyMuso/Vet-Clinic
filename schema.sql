/* Database schema to keep the structure of entire database. */

-- create database
CREATE DATABASE vet_clinic;

CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(80),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL
);

ALTER TABLE animals
  ADD species VARCHAR(80);
  
  -- create owner table
  CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(80),
    age INT
  );
-- create species table
  CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(80)
  );

 ALTER TABLE animals
 DROP COLUMN species,
 ADD COLUMN species_id INT REFERENCESspecies,
 ADD COLUMN owner_id INT REFERENCES owners;

-- create vets table
CREATE TABLE vets (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  age INT,
  date_of_graduation DATE
);

-- create specializations join table
CREATE TABLE specializations (
  id SERIAL PRIMARY KEY,
  species_id INT REFERENCES species(id),
  vet_id INT REFERENCES vets(id)
);

-- create visits join table
CREATE TABLE visits (
  id SERIAL PRIMARY KEY,
  animal_id INT REFERENCES animals(id),
  vet_id INT REFERENCES vets(id),
  date_of_visit DATE
);
