/* Database schema to keep the structure of entire database. */
CREATE TABLE animals (
 id INT GENERATED ALWAYS AS IDENTITY,
 name VARCHAR(50),
 date_of_birth DATE,
 escape_attempts INT,
 neutered BOOLEAN DEFAULT false,
 weight_kg DECIMAL,
 PRIMARY KEY(id)
);

-- Add a column species of type string to your animals table.
 ALTER TABLE animals ADD species VARCHAR(50);

-- Create Owners Table
CREATE TABLE owners(
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 full_name VARCHAR(50),
 age INT
);

-- Create Species Table
CREATE TABLE species(
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 name VARCHAR(50)
);

-- Drop Species Column
ALTER TABLE animals DROP COLUMN species;

-- Alter Animals Table
ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_name FOREIGN KEY(species_id) REFERENCES species(id);
ALTER TABLE animals ADD owner_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_name2 FOREIGN KEY(owner_id) REFERENCES owners(id);


-- Day 4

-- Create Vets Table
CREATE TABLE vets(
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 name VARCHAR(50),
 age INT,
 date_of_graduation DATE
);

-- Create Specializations Table
CREATE TABLE specializations (
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 vets_id INT,
 species_id INT,
 CONSTRAINT vet_fk FOREIGN KEY(vets_id) REFERENCES vets(id),
 CONSTRAINT species_fk FOREIGN KEY(species_id) REFERENCES species(id)
);

--  Create Visits Table
CREATE TABLE visits (
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 animals_id INT,
 vets_id INT,
 date_of_visit DATE,
 CONSTRAINT vet_fk FOREIGN KEY(vets_id) REFERENCES vets(id),
 CONSTRAINT animals_fk FOREIGN KEY(animals_id) REFERENCES animals(id)
);


