CREATE TABLE classroom (
 room_id BIGSERIAL NOT NULL PRIMARY KEY,
 street_name VARCHAR(100) NOT NULL,
 zip_code VARCHAR(100) NOT NULL,
 city_name VARCHAR(100) NOT NULL,
 status VARCHAR(500) NOT NULL,
 lesson_id BIGINT REFERENCES lesson(id) ON DELETE NO ACTION
);

CREATE TABLE contact_person(
 person_id BIGINT REFERENCES person (id),
 student_id BIGINT REFERENCES student(student_id),
 PRIMARY KEY(person_id)
);

CREATE TABLE ensembles (
 lesson_id BIGINT REFERENCES lesson(id) ON DELETE CASCADE,
 genre VARCHAR(100) NOT NULL,
 min_of_students VARCHAR(100) NOT NULL,
 max_of_students VARCHAR(100) NOT NULL,
 enrolled_students VARCHAR(100) NOT NULL
);

CREATE TABLE group_lesson (
 lesson_id BIGINT REFERENCES lesson(id) ON DELETE CASCADE,
 instrument_type VARCHAR(100) NOT NULL,
 min_of_students VARCHAR(100) NOT NULL
);

CREATE TABLE instructor (
 employment_id VARCHAR(100) NOT NULL,
 is_available VARCHAR(100) NOT NULL,
 person_id BIGINT REFERENCES person (id),
 UNIQUE (employment_id),
 PRIMARY KEY(person_id)
);

CREATE TABLE instrument (
 instrument_id BIGSERIAL NOT NULL PRIMARY KEY,
 status VARCHAR(100) NOT NULL,
 instrument_type VARCHAR(100) NOT NULL
);

CREATE TABLE lesson (
 id BIGSERIAL NOT NULL PRIMARY KEY,
 time TIMESTAMP(6),
 price_category_id BIGINT REFERENCES price_category(id) ,
 instructor_person_id BIGINT REFERENCES instructor (person_id),
 student_person_id BIGINT REFERENCES student (person_id)
);

CREATE TABLE person (
 id BIGSERIAL NOT NULL PRIMARY KEY,
 person_number VARCHAR(12) NOT NULL,
 first_name VARCHAR(100) NOT NULL,
 last_name VARCHAR(100) NOT NULL,
 email VARCHAR(100) ,
 street_name VARCHAR(100) NOT NULL,
 zip_code VARCHAR(100) NOT NULL,
 city_name VARCHAR(100) NOT NULL,
 gender VARCHAR(100) NOT NULL,
 UNIQUE (person_number)
);

CREATE TABLE phone (
 phone_no BIGSERIAL NOT NULL,
 person_id BIGINT REFERENCES person (id) ON DELETE CASCADE,
 PRIMARY KEY(person_id, phone_no)
);

CREATE TABLE price_category (
 id BIGSERIAL NOT NULL PRIMARY KEY,
 lesson_price DOUBLE PRECISION NOT NULL,
 discount DOUBLE PRECISION,
 instructors_salary DOUBLE PRECISION NOT NULL
);

CREATE TABLE private_lesson (
 lesson_id BIGINT REFERENCES lesson(id) ON DELETE CASCADE,
 instrument_type VARCHAR(100) NOT NULL
);

CREATE TABLE rent_instrument (
 rent_id BIGSERIAL NOT NULL PRIMARY KEY,
 time_rented TIMESTAMP(6),
 price DOUBLE PRECISION NOT NULL,
 person_id BIGINT REFERENCES student (person_id),
 instrument_id BIGINT REFERENCES instrument(instrument_id)
);

CREATE TABLE sibling (
 person_id BIGINT REFERENCES person (id) ON DELETE CASCADE,
 student_id BIGINT REFERENCES student(student_id) ON DELETE CASCADE,
 PRIMARY KEY(person_id, student_id)
);

CREATE TABLE skill_level (
 lesson_id BIGINT REFERENCES lesson(id) ON DELETE CASCADE,
 beginner VARCHAR(100) NOT NULL,
 intermediate VARCHAR(100) NOT NULL,
 Advanced VARCHAR(100) NOT NULL
);

CREATE TABLE student (
 student_id BIGSERIAL NOT NULL,
 person_id BIGINT REFERENCES person (id),
 UNIQUE (student_id),
 PRIMARY KEY(person_id)
);

CREATE TABLE type_of_instruments (
 person_id BIGINT REFERENCES instructor (person_id) ON DELETE CASCADE,
 instrument_type VARCHAR(100) NOT NULL,
 PRIMARY KEY(person_id, instrument_type)
);
