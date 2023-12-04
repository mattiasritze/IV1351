CREATE TABLE can_teach_instruments (
 id SERIAL NOT NULL,
 instrument VARCHAR(50)
);

ALTER TABLE can_teach_instruments ADD CONSTRAINT PK_can_teach_instruments PRIMARY KEY (id);


CREATE TABLE instruments (
 id SERIAL NOT NULL,
 which_instrument VARCHAR(50),
 amount_in_stock INT,
 brand VARCHAR(50)
);

ALTER TABLE instruments ADD CONSTRAINT PK_instruments PRIMARY KEY (id);


CREATE TABLE person (
 id SERIAL NOT NULL,
 first_name VARCHAR(1337) NOT NULL,
 last_name VARCHAR(1337) NOT NULL,
 person_number VARCHAR(12) NOT NULL,
 address VARCHAR(500) NOT NULL,
 phone_number VARCHAR(50) NOT NULL
);

ALTER TABLE person ADD CONSTRAINT PK_person PRIMARY KEY (id);


CREATE TABLE sibling_student_ids (
 id SERIAL NOT NULL,
 sibling_student_id INT
);

ALTER TABLE sibling_student_ids ADD CONSTRAINT PK_sibling_student_ids PRIMARY KEY (id);


CREATE TABLE student (
 id SERIAL NOT NULL,
 contact_person_phone VARCHAR(50) NOT NULL,
 person_id SERIAL NOT NULL,
 sibling_discount BOOLEAN
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (id);


CREATE TABLE student_siblings (
 student_id SERIAL NOT NULL,
 siblings_id SERIAL NOT NULL
);

ALTER TABLE student_siblings ADD CONSTRAINT PK_student_siblings PRIMARY KEY (student_id,siblings_id);


CREATE TABLE instructor (
 id SERIAL NOT NULL,
 can_teach_ensemble BOOLEAN NOT NULL,
 person_id SERIAL NOT NULL
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (id);


CREATE TABLE instructor_instruments (
 instruments_id SERIAL NOT NULL,
 instructor_id SERIAL NOT NULL
);

ALTER TABLE instructor_instruments ADD CONSTRAINT PK_instructor_instruments PRIMARY KEY (instruments_id,instructor_id);


CREATE TABLE rent_instruments (
 id SERIAL NOT NULL,
 number_of_instruments_rented INT,
 lease_time INT,
 price INT,
 student_id SERIAL NOT NULL,
 instrument_id SERIAL NOT NULL
);

ALTER TABLE rent_instruments ADD CONSTRAINT PK_rent_instruments PRIMARY KEY (id);


CREATE TABLE available (
 id SERIAL NOT NULL,
 date VARCHAR(50),
 time VARCHAR(50),
 instructor_id SERIAL NOT NULL
);

ALTER TABLE available ADD CONSTRAINT PK_available PRIMARY KEY (id);


CREATE TABLE ensemble (
 id SERIAL NOT NULL,
 min_students INT NOT NULL,
 max_students INT NOT NULL,
 genre VARCHAR(50) NOT NULL,
 date DATE NOT NULL,
 time VARCHAR(50) NOT NULL,
 instructor_id SERIAL NOT NULL
);

ALTER TABLE ensemble ADD CONSTRAINT PK_ensemble PRIMARY KEY (id);


CREATE TABLE ensemble_price (
 id SERIAL NOT NULL,
 cost INT NOT NULL,
 lesson_id SERIAL NOT NULL
);

ALTER TABLE ensemble_price ADD CONSTRAINT PK_ensemble_price PRIMARY KEY (id);


CREATE TABLE group_lesson (
 id SERIAL NOT NULL,
 instrument VARCHAR(50) NOT NULL,
 skill_level VARCHAR(50) NOT NULL,
 min_students INT NOT NULL,
 max_students INT NOT NULL,
 date DATE NOT NULL,
 time VARCHAR(50) NOT NULL,
 instructor_id SERIAL NOT NULL
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (id);


CREATE TABLE group_lesson_price (
 id SERIAL NOT NULL,
 cost INT NOT NULL,
 lesson_id SERIAL NOT NULL
);

ALTER TABLE group_lesson_price ADD CONSTRAINT PK_group_lesson_price PRIMARY KEY (id);


CREATE TABLE individual_lesson (
 id SERIAL NOT NULL,
 instrument VARCHAR(50) NOT NULL,
 skill_level VARCHAR(50) NOT NULL,
 instructor_id SERIAL NOT NULL,
 student_id SERIAL NOT NULL,
 date DATE NOT NULL
);

ALTER TABLE individual_lesson ADD CONSTRAINT PK_individual_lesson PRIMARY KEY (id);


CREATE TABLE individual_lesson_price (
 id SERIAL NOT NULL,
 cost INT NOT NULL,
 lesson_id SERIAL NOT NULL
);

ALTER TABLE individual_lesson_price ADD CONSTRAINT PK_individual_lesson_price PRIMARY KEY (id);


CREATE TABLE student_ensemble_lesson (
 student_id SERIAL NOT NULL,
 lesson_id SERIAL NOT NULL
);

ALTER TABLE student_ensemble_lesson ADD CONSTRAINT PK_student_ensemble_lesson PRIMARY KEY (student_id,lesson_id);


CREATE TABLE student_group_lesson (
 student_id SERIAL NOT NULL,
 group_id SERIAL NOT NULL
);

ALTER TABLE student_group_lesson ADD CONSTRAINT PK_student_group_lesson PRIMARY KEY (student_id,group_id);


ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (person_id) REFERENCES person (id);


ALTER TABLE student_siblings ADD CONSTRAINT FK_student_siblings_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE student_siblings ADD CONSTRAINT FK_student_siblings_1 FOREIGN KEY (siblings_id) REFERENCES sibling_student_ids (id);


ALTER TABLE instructor ADD CONSTRAINT FK_instructor_0 FOREIGN KEY (person_id) REFERENCES person (id);


ALTER TABLE instructor_instruments ADD CONSTRAINT FK_instructor_instruments_0 FOREIGN KEY (instruments_id) REFERENCES can_teach_instruments (id);
ALTER TABLE instructor_instruments ADD CONSTRAINT FK_instructor_instruments_1 FOREIGN KEY (instructor_id) REFERENCES instructor (id);


ALTER TABLE rent_instruments ADD CONSTRAINT FK_rent_instruments_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE rent_instruments ADD CONSTRAINT FK_rent_instruments_1 FOREIGN KEY (instrument_id) REFERENCES instruments (id);


ALTER TABLE available ADD CONSTRAINT FK_available_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id);


ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id);


ALTER TABLE ensemble_price ADD CONSTRAINT FK_ensemble_price_0 FOREIGN KEY (lesson_id) REFERENCES ensemble (id);


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id);


ALTER TABLE group_lesson_price ADD CONSTRAINT FK_group_lesson_price_0 FOREIGN KEY (lesson_id) REFERENCES group_lesson (id);


ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id);
ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_1 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE individual_lesson_price ADD CONSTRAINT FK_individual_lesson_price_0 FOREIGN KEY (lesson_id) REFERENCES individual_lesson (id);


ALTER TABLE student_ensemble_lesson ADD CONSTRAINT FK_student_ensemble_lesson_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE student_ensemble_lesson ADD CONSTRAINT FK_student_ensemble_lesson_1 FOREIGN KEY (lesson_id) REFERENCES ensemble (id);


ALTER TABLE student_group_lesson ADD CONSTRAINT FK_student_group_lesson_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE student_group_lesson ADD CONSTRAINT FK_student_group_lesson_1 FOREIGN KEY (group_id) REFERENCES group_lesson (id);


