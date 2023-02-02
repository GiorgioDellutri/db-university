1. Contare quanti iscritti ci sono stati ogni anno

SELECT COUNT(*) AS 'Numero di iscritti', YEAR(`enrolment_date`) AS 'Anno'
FROM `students`
GROUP BY YEAR(`enrolment_date`);

2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio

SELECT COUNT(*) AS 'Numero insegnanti',  `office_address` AS 'Indirizzo ufficio'
FROM `teachers`
GROUP BY `office_address`; 