
DROP DATABASE medical_center_db;
CREATE DATABASE medical_center_db;
\c medical_center_db;


CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    name TEXT,
    speciality TEXT
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name TEXT,
    disease TEXT,
    doctor_id INTEGER REFERENCES doctors ON DELETE SET NULL
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors ON DELETE SET NULL,
    patient_id INTEGER REFERENCES patients ON DELETE CASCADE,
    visit_date DATE,
    notes TEXT
);

CREATE TABLE diagnosis (
    id SERIAL PRIMARY KEY,
    visit_id INTEGER REFERENCES visits ON DELETE CASCADE,
    description TEXT
);


INSERT INTO doctors (name, speciality)
VALUES
('Katrina Bassett', 'Dermatology'),
('Joy Wu', 'Dermatology');

--Add this later one by one.

-- INSERT INTO patients (name, disease, doctor_id)
-- VALUES
-- ('Marie Hank', 'Melasma', 1),
-- ('James Smith', 'Rosacea',  2);

-- INSERT INTO visits (doctor_id, patient_id, visit_date, notes)
-- VALUES
-- (1, 1, '2022-07-19', 'Initial visit for skin check-up'),
-- (2, 2, '2020-06-06', 'Test');

-- INSERT INTO diagnosis (visit_id, description)
-- VALUES
-- (1, 'Diagnosed as Melasma.'),
-- (2, 'Diagnosed as Rosacea.');


