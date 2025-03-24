SELECT si.roll_number, si.name
FROM student_information as si join examination_marks as em
on si.roll_number = em.roll_number
WHERE em.subject_one+em.subject_two+em.subject_three < 100;