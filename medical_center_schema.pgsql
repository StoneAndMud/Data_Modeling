-- A Medical Center Employs Several Doctors
-- A Doctor Can See Many Patients
-- A Patient Can Be Seen By Many Doctors
-- During A Visit A Patient May Be Diagnosed To Have One Or More Diseases

CREATE TABLE medical_center (
    -- ID
    id SERIAL PRIMARY KEY,
    -- Name of center
    name TEXT NOT NULL,
    -- number of employees
    num_of_employees INTEGER,
    -- number of patients
    num_of_patients INTEGER,
    -- Id's of Patients that are treated at that center
    patient_id REFERENCES patients(id)
)

CREATE TABLE doctors (
    -- ID
    id SERIAL PRIMARY KEY,
    -- Doc First
    first_name NOT NULL,
    -- Doc Last
    last_name NOT NULL,
    -- Id of center that doc works at
    medical_center_id REFERENCES medical_center(id)
)

CREATE TABLE patients_seen_by (
    -- ID
    id SERIAL PRIMARY KEY,
    -- Patient ID
    patient_id INTEGER REFERENCES patients(id),
    -- Doc ID
    doctor_id INTEGER REFERENCES doctors(id),
)

CREATE TABLE patients (
    -- ID
    id SERIAL PRIMARY KEY,
    -- pat First
    first_name NOT NULL,
    -- pat Last
    last_name NOT NULL,
    -- pats latest doctor
    last_seen_by INTEGER REFERENCES doctors(id)
)

CREATE TABLE diseases (
    -- ID
    id SERIAL PRIMARY KEY,
    -- Diseases
    diagnosis VARCHAR(20),
    -- Desc. of Disease
    description TEXT,
)

CREATE TABLE patient_diagnoses (
    -- ID
    id SERIAL PRIMARY KEY,
    -- Pat ID
    patient_id INTEGER REFERENCES patients(id),
    -- Diagnosed with 
    diagnoses_id INTEGER REFERENCES diseases(id),
)