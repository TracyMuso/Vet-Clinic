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
  
  CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(80),
    age INT
  );

  CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(80)
  );

  CREATE SEQUENCE  animals_id_seq owned BY animals.id;
  ALTER TABLE ANIMALS ALTER COLUMN id SET DEFAULT nextval('animals_id_seq');

  ALTER TABLE animals
  DROP COLUMN species,
  ADD COLUMN species_id INT REFERENCES species,
  ADD COLUMN owner_id INT REFERENCES owners;
