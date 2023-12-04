/* query number 1 */
SELECT
  TO_CHAR(date_column, 'Mon') AS month,
  COUNT(*) AS total_lessons,
  COUNT(CASE WHEN lesson_type = 'Individual' THEN 1 END) AS individual_lessons,
  COUNT(CASE WHEN lesson_type = 'Group' THEN 1 END) AS group_lessons,
  COUNT(CASE WHEN lesson_type = 'Ensemble' THEN 1 END) AS ensemble_lessons
FROM
  (
    SELECT
      date AS date_column,
      'Individual' AS lesson_type
    FROM
      individual_lesson
    WHERE
      EXTRACT(YEAR FROM date) = 2023

    UNION ALL

    SELECT
      date AS date_column,
      'Group' AS lesson_type
    FROM
      group_lesson
    WHERE
      EXTRACT(YEAR FROM date) = 2023

    UNION ALL

    SELECT
      date AS date_column,
      'Ensemble' AS lesson_type
    FROM
      ensemble
    WHERE
      EXTRACT(YEAR FROM date) = 2023
  ) AS combined_lessons
GROUP BY
  TO_CHAR(date_column, 'Mon')
ORDER BY
  TO_DATE(TO_CHAR(date_column, 'Mon'), 'Mon');





/*QUERY number 2*/

SELECT
    s.sibling_count AS "No of Siblings",
    COUNT(*) AS "No of Students"
FROM
    (
        SELECT
            student.id,
            COUNT(ssi.siblings_id) AS sibling_count
        FROM
            student
        LEFT JOIN
            student_siblings ssi ON student.id = ssi.student_id
        GROUP BY
            student.id
    ) s
GROUP BY
    s.sibling_count
ORDER BY
    s.sibling_count;


/* QUERY number 3 */

SELECT 
    instructor_id AS Instructor_id,
    (SELECT first_name FROM person WHERE id = instructor_id) AS First_Name,
    (SELECT last_name FROM person WHERE id = instructor_id) AS Last_Name,
    
COUNT(*) AS No_of_Lessons
FROM (
    SELECT instructor_id FROM individual_lesson WHERE EXTRACT(MONTH FROM date) = EXTRACT(MONTH FROM CURRENT_DATE)

    UNION ALL
    SELECT instructor_id FROM ensemble WHERE EXTRACT (MONTH FROM date) = EXTRACT(MONTH FROM CURRENT_DATE)
    UNION ALL
    SELECT instructor_id FROM group_lesson WHERE EXTRACT (MONTH FROM date) = EXTRACT(MONTH FROM CURRENT_DATE)
) AS AllLessons
GROUP BY instructor_id
HAVING COUNT(*) > 2
ORDER BY No_of_Lessons DESC;


/* QUERY number 4 */

SELECT
	TO_CHAR(date, 'Dy') AS Day,
	genre,
	CASE
    	WHEN max_students - COUNT(se.student_id) = 0 THEN 'No Seats'
    	WHEN max_students - COUNT(se.student_id) BETWEEN 1 AND 2 THEN '1 or 2 Seats'
    	ELSE 'Many Seats'
	END AS "No of Free Seats"
FROM ensemble e
LEFT JOIN student_ensemble_lesson se ON e.id = se.lesson_id
WHERE date BETWEEN CURRENT_DATE AND CURRENT_DATE + INTERVAL '7 days'
GROUP BY e.id, Day, genre, max_students
ORDER BY Day, genre;
