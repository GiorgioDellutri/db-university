1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT `students`.`name`, `students`.`surname`, `registration_number`, `degrees`.`name`
FROM `students`
JOIN `degrees`
ON `students`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`name` = 'Corso di Laurea in Economia';

2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze

SELECT `degrees`.`name`, `degrees`.`level`, `departments`.`name`
FROM `departments`
JOIN `degrees`
ON `departments`.`id` = `degrees`.`department_id`
WHERE `degrees`.`level` = 'magistrale'
AND `departments`.`name` = 'Dipartimento di Neuroscienze';

3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT  `teachers`.`name`, `teachers`.`surname`, `teachers`.`id` AS 'teacher id', `courses`.`name` AS 'course name'
FROM `teachers`
JOIN `course_teacher`
ON `teachers`.`id` = `course_teacher`.`teacher_id` 
JOIN `courses`
ON `course_teacher`.`course_id` = `courses`.id
WHERE `teachers`.`id` = '44';

4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il
relativo dipartimento, in ordine alfabetico per cognome e nome

SELECT `students`.`surname`, `students`.`name`, `degrees`.`name`, `departments`.`name`
FROM `departments`
JOIN `degrees`
ON `departments`.`id` = `degrees`.`department_id`
JOIN `students`
ON `degrees`.`id` = `students`.`degree_id`
ORDER BY `students`.`surname` ASC, `students`.`name` ASC;

5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT `teachers`.`name`, `teachers`.`surname`, `degrees`.`name`, `courses`.`year`
FROM `degrees`
JOIN `courses`
ON `degrees`.`id` = `courses`.`degree_id`
JOIN `course_teacher`
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers`
ON `course_teacher`.`teacher_id` = `teachers`.`id`;

6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)

SELECT DISTINCT `teachers`.`name`, `teachers`.`surname` 
FROM `teachers`
JOIN `course_teacher`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
JOIN `courses`
ON `course_teacher`.`course_id` = `courses`.`id`
JOIN `degrees`
ON `courses`.`degree_id` = `degrees`.`id`
JOIN `departments`
ON `degrees`.`department_id` = `departments`.`id`
WHERE `departments`.`name` =  'Dipartimento di Matematica';

7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per
superare ciascuno dei suoi esami

SELECT  `students`.`name`, `students`.`surname`, `exam_student`.`exam_id`, COUNT(`exam_student`.`vote`) as Tentativi, `exam_student`.`vote`
FROM `students` 
JOIN `exam_student`
ON `students`.`id` = `exam_student`.`student_id`
WHERE `exam_student`.`vote` <= 18
GROUP BY `students`.`id`, `exam_student`.`exam_id`  

