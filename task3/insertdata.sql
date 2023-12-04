INSERT INTO person (first_name, last_name, person_number, address, phone_number)
VALUES  ('Evelina', 'Berg', '1234567890', '123 Main St', '555-1234'),
        ('Victor', 'Karlström', '5559998', '125 Main St', '556-1234'),           
        ('Mattias', 'Ritze', '0987654321', '456 Oak St', '555-5678'),
        ('Anna', 'Andersson', '987654321', '789 Elm St', '555-8765'),
        ('John', 'Smith', '5551234', '234 Maple St', '555-4321'),

        ('Emily', 'Johnson', '7778888', '567 Pine St', '555-9876'),
        ('Daniel', 'Williams', '123123123', '890 Cedar St', '555-3456'),
        ('Sophia', 'Davis', '456789456', '901 Birch St', '555-6789'),
        ('Oliver', 'Martinez', '111222333', '345 Oak St', '555-2345'),
        ('Bob', 'Bobbe', '39423323', '345 Bob St', '076-248903'),
        ('Ava', 'Taylor', '444555666', '678 Pine St', '555-7890');

INSERT INTO student (contact_person_phone, person_id, sibling_discount)
VALUES
    ('076-888-9955', 6, 't'),
    ('071-777-8844', 7, 't'),
    ('073-666-7733', 8, 'f'),
    ('072-555-6622', 9, 'f'),
    ('070-444-5511', 10, 'f'),
    ('075-333-4400', 11, 'f');


INSERT INTO instructor (can_teach_ensemble, person_id)
VALUES
    ('t', 1),
    ('t', 2),
    ('t', 3),
    ('t', 4),
    ('t', 5);

INSERT INTO instruments (which_instrument, amount_in_stock, brand)
VALUES
    ('Piano', '15', 'Yamaha'),
    ('Guitar', '25', 'Fender'),
    ('Violin', '20', 'Stradivarius'),
    ('Flute', '12', 'Pearl'),
    ('Trumpet', '18', 'Bach'),
    ('Drums', '10', 'Pearl'),
    ('Saxophone', '15', 'Yamaha'),
    ('Clarinet', '8', 'Buffet Crampon'),
    ('Cello', '12', 'D''Addario'), -- Note the double single quote for the brand with an apostrophe
    ('Bass Guitar', '10', 'Ibanez');


INSERT INTO rent_instruments (number_of_instruments_rented, lease_time, price, student_id, instrument_id)
VALUES 
    ('1', '8', '100', '1', '1');

INSERT INTO available (date, time, instructor_id)
VALUES
    ('2023-11-27', '07:00', 1),
    ('2023-11-28', '09:30', 2),
    ('2023-11-29', '12:00', 3),
    ('2023-11-30', '14:45', 4),
    ('2023-12-01', '16:30', 5),
    ('2023-12-02', '11:15', 1),
    ('2023-12-03', '18:00', 2),
    ('2023-12-01', '08:30', 3),
    ('2023-11-29', '15:15', 4),
    ('2023-11-28', '10:45', 5);

INSERT INTO can_teach_instruments (instrument)
VALUES
    ('Piano'),
    ('Guitar'),
    ('Violin'),
    ('Flute'),
    ('Trumpet'),
    ('Drums'),
    ('Saxophone'),
    ('Clarinet'),
    ('Cello'),
    ('Bass Guitar');

INSERT INTO instructor_instruments (instruments_id, instructor_id)
VALUES 
     ('1', '1'),
    ('2', '1'),
    ('3', '1'),
    ('4', '1'),
    ('5', '1'),
    ('6', '1'),
    ('7', '1'),
    ('8', '1'),
    ('9', '1'),
    ('10', '1'),

    ('1', '2'),
    ('2', '2'),
    ('3', '2'),
    ('4', '2'),
    ('5', '2'),
    ('6', '2'),
    ('7', '2'),

    ('1', '3'),
    ('2', '3'),
    ('3', '3'),
    ('4', '3'),
    ('5', '3'),
    ('6', '3'),
    ('7', '3'),
    ('8', '3'),

    ('1', '4'),
    ('2', '4'),
    ('3', '4'),
    ('4', '4'),
    ('5', '4'),
    ('6', '4'),
    ('7', '4'),
    ('8', '4'),
    ('9', '4'),
    ('10', '4'),

    ('1', '5'),
    ('2', '5'),
    ('3', '5'),
    ('4', '5'),
    ('5', '5'),
    ('6', '5'),
    ('7', '5'),
    ('8', '5');

    INSERT INTO sibling_student_ids (sibling_student_id)
    VALUES ('1'),
           ('2');

    INSERT INTO student_siblings (student_id, siblings_id)
    VALUES ('1', '2'),
            ('2', '1');

    INSERT INTO group_lesson(instrument, skill_level, min_students, max_students, date, time, instructor_id)
    VALUES
            ('Piano', 'Beginner', '5', '10', '2023-11-27', '11:00', '1'),
            ('Guitar', 'Intermediate', '6', '12', '2023-11-28', '14:30', '2'),
            ('Violin', 'Advanced', '7', '15', '2023-11-29', '10:45', '3'),
            ('Flute', 'Beginner', '4', '8', '2023-11-30', '13:15', '4'),
            ('Saxophone', 'Intermediate', '8', '12', '2023-12-01', '16:00', '5');

 INSERT INTO individual_lesson(instrument, skill_level, instructor_id, student_id, date)
 VALUES      ('Piano', 'Intermediate',  1, 1, '2023-10-11'),
            ('Guitar', 'Beginner',  2, 2, '2023-10-9'),
             ('Violin', 'Advanced',  3, 3, '2023-9-11'),
             ('Flute', 'Intermediate',  4, 4, '2023-12-24'),
             ('Saxophone', 'Beginner',  5, 5, '2023-11-2');

 INSERT INTO ensemble(min_students, max_students, genre, date, time, instructor_id)
    VALUES
            ('5', '10', 'Punk', '2023-11-03', '11:00', '1'),    
            ('8', '15', 'Rock', '2023-11-04', '14:30', '2'),
            ('6', '12', 'Jazz', '2023-11-05', '10:45', '3'),
            ('7', '14', 'Classical', '2023-11-06', '13:15', '4'),
            ('9', '18', 'Blues', '2023-11-07', '16:00', '5');

INSERT INTO student_group_lesson(student_id, group_id)
    VALUES
             ('1', '1'),
                ('2', '1'),
                ('3', '2'),
                ('4', '2'),
                ('5', '3'),
                ('1', '3'),
                ('2', '4'),
                ('3', '4'),
                ('4', '5'),
                ('5', '5');

INSERT INTO student_ensemble_lesson(student_id, lesson_id)
    VALUES
             ('1', '1'),
                ('2', '1'),
                ('3', '2'),
                ('4', '2'),
                ('5', '3'),
                ('1', '3'),
                ('2', '4'),
                ('3', '4'),
                ('4', '5'),
                ('5', '5');

INSERT INTO group_lesson_price(cost, lesson_id)
    VALUES
            ('60', '1'),
            ('70', '2'),
            ('90', '3'),
            ('139', '4'),
            ('84', '5');

INSERT INTO individual_lesson_price(cost, lesson_id)
    VALUES
            ('60', '1'),
            ('70', '2'),
            ('90', '3'),
            ('139', '4'),
            ('84', '5');

INSERT INTO ensemble_price(cost, lesson_id)
    VALUES
        ('60', '1'),
            ('70', '2'),
            ('90', '3'),
            ('139', '4'),
            ('84', '5');



             INSERT INTO ensemble(min_students, max_students, genre, date, time, instructor_id)
    VALUES
            ('5', '10', 'Punk', '2023-12-5', '11:00', '1'),  
            ('5', '10', 'Punk', '2023-12-6', '11:00', '1'),
            ('5', '10', 'Punk', '2023-12-7', '11:00', '1');


            INSERT INTO ensemble(min_students, max_students, genre, date, time, instructor_id)
    VALUES
            ('1', '3', 'Rock', '2023-12-8', '11:00', '1'),  
            ('1', '1', 'Classical', '2023-12-9', '11:00', '1');

            INSERT INTO student_ensemble_lesson(student_id, lesson_id)
    VALUES
             ('1', '9'),
                ('2', '10');


            INSERT INTO group_lesson(instrument, skill_level, min_students, max_students, date, time, instructor_id)
    VALUES
            ('Piano', 'Beginner', '5', '10', '2023-12-15', '11:00', '2'),
            ('Flute', 'Beginner', '4', '8', '2023-12-5', '13:15', '3');

 INSERT INTO individual_lesson(instrument, skill_level, instructor_id, student_id, date)
 VALUES      ('Piano', 'Intermediate',  2, 1, '2023-12-11'),
            ('Guitar', 'Beginner',  3, 2, '2023-12-9');
        
         INSERT INTO ensemble(min_students, max_students, genre, date, time, instructor_id)
    VALUES
            ('1', '3', 'Rock', '2023-12-10', '11:00', '2'),  
            ('1', '1', 'Classical', '2023-12-11', '11:00', '3');
