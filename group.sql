1. Contare quanti iscritti ci sono stati ogni anno

SELECT COUNT(*) AS 'Numero di iscritti', YEAR(`enrolment_date`) AS 'Anno'
FROM `students`
GROUP BY YEAR(`enrolment_date`);

2. Contare gli insegnanti che hanno l ufficio nello stesso edificio

SELECT COUNT(*) AS 'Numero insegnanti',  `office_address` AS 'Indirizzo ufficio'
FROM `teachers`
GROUP BY `office_address`; 

3. Calcolare la media dei voti di ogni appello d esame

SELECT `exam_id` AS 'Id esame', AVG(`vote`) AS 'Voto medio'
FROM `exam_student`
GROUP BY `exam_id`;

4. Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT  `department_id` AS 'ID Dipartimento' ,COUNT(*) AS 'Numero Corsi di Laurea'
FROM `degrees`
GROUP BY `department_id`;