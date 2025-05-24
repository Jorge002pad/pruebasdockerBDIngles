-- Relaciones con user (es base de muchas claves foráneas)
ALTER TABLE `level` ADD FOREIGN KEY (`id_level_coordinator`) REFERENCES `user` (`id`);
ALTER TABLE `group` ADD FOREIGN KEY (`id_professor`) REFERENCES `user` (`id`);
ALTER TABLE `exam` ADD FOREIGN KEY (`who_created`) REFERENCES `user` (`id`);
ALTER TABLE `writing_template` ADD FOREIGN KEY (`who_created`) REFERENCES `user` (`id`);
ALTER TABLE `reading_template` ADD FOREIGN KEY (`who_created`) REFERENCES `user` (`id`);
ALTER TABLE `assigned_exam` ADD FOREIGN KEY (`id_proffesor`) REFERENCES `user` (`id`);
ALTER TABLE `evaluator_teacher` ADD FOREIGN KEY (`id_proffesor`) REFERENCES `user` (`id`);
ALTER TABLE `Sesion_User` ADD FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

-- Relaciones con level (clave muy usada)
ALTER TABLE `group` ADD FOREIGN KEY (`id_level`) REFERENCES `level` (`id`);
ALTER TABLE `student` ADD FOREIGN KEY (`id_level`) REFERENCES `level` (`id`);
ALTER TABLE `exam` ADD FOREIGN KEY (`id_level`) REFERENCES `level` (`id`);
ALTER TABLE `writing_template` ADD FOREIGN KEY (`id_level`) REFERENCES `level` (`id`);
ALTER TABLE `reading_template` ADD FOREIGN KEY (`id_level`) REFERENCES `level` (`id`);
ALTER TABLE `signs_template` ADD FOREIGN KEY (`id_level`) REFERENCES `level` (`id`);
ALTER TABLE `simple_multiple_template` ADD FOREIGN KEY (`id_level`) REFERENCES `level` (`id`);
ALTER TABLE `multiple_matching_template` ADD FOREIGN KEY (`id_level`) REFERENCES `level` (`id`);
ALTER TABLE `reading_comprehension_template` ADD FOREIGN KEY (`id_level`) REFERENCES `level` (`id`);
ALTER TABLE `gap_fill_template` ADD FOREIGN KEY (`id_level`) REFERENCES `level` (`id`);
ALTER TABLE `template_multiple_choice_cloze` ADD FOREIGN KEY (`id_level`) REFERENCES `level` (`id`);
ALTER TABLE `open_cloze_template` ADD FOREIGN KEY (`id_level`) REFERENCES `level` (`id`);

-- Relaciones con major
ALTER TABLE `student` ADD FOREIGN KEY (`id_major`) REFERENCES `major` (`id`);

-- Relaciones con group
ALTER TABLE `student` ADD FOREIGN KEY (`id_group_english`) REFERENCES `group` (`id`);

-- Relaciones de exam
ALTER TABLE `exam` ADD FOREIGN KEY (`id_writing_template`) REFERENCES `writing_template` (`id`);
ALTER TABLE `exam` ADD FOREIGN KEY (`id_reading_template`) REFERENCES `reading_template` (`id`);

-- Relaciones con writing_template
ALTER TABLE `image` ADD FOREIGN KEY (`id_writing_template`) REFERENCES `writing_template` (`id`);
ALTER TABLE `writing_answer` ADD FOREIGN KEY (`id_writing_template`) REFERENCES `writing_template` (`id`);
ALTER TABLE `writing_template` ADD FOREIGN KEY (`id_exam_type`) REFERENCES `exam_type` (`id`);

-- Relaciones con reading_template
ALTER TABLE `reading_template` ADD FOREIGN KEY (`id_exam_type`) REFERENCES `exam_type` (`id`);
ALTER TABLE `reading_template` ADD FOREIGN KEY (`id_signs_template`) REFERENCES `signs_template` (`id`);
ALTER TABLE `reading_template` ADD FOREIGN KEY (`id_simple_multiple_template`) REFERENCES `simple_multiple_template` (`id`);
ALTER TABLE `reading_template` ADD FOREIGN KEY (`id_multiple_matching_template`) REFERENCES `multiple_matching_template` (`id`);
ALTER TABLE `reading_template` ADD FOREIGN KEY (`id_reading_comprehension_template`) REFERENCES `reading_comprehension_template` (`id`);
ALTER TABLE `reading_template` ADD FOREIGN KEY (`id_open_cloze_template`) REFERENCES `open_cloze_template` (`id`);
ALTER TABLE `reading_template` ADD FOREIGN KEY (`id_template_multiple_choice_cloze`) REFERENCES `template_multiple_choice_cloze` (`id`);
ALTER TABLE `reading_template` ADD FOREIGN KEY (`id_gap_fill_template`) REFERENCES `gap_fill_template` (`id`);

-- Signs
ALTER TABLE `signs` ADD FOREIGN KEY (`id_sign_template`) REFERENCES `signs_template` (`id`);
ALTER TABLE `sign_options` ADD FOREIGN KEY (`id_sign`) REFERENCES `signs` (`id`);

-- Simple Multiple
ALTER TABLE `simple_multiple` ADD FOREIGN KEY (`id_simple_multiple_template`) REFERENCES `simple_multiple_template` (`id`);
ALTER TABLE `option_simple_multiple` ADD FOREIGN KEY (`id_simple_multiple`) REFERENCES `simple_multiple` (`id`);

-- Multiple Matching
ALTER TABLE `option_multiple_matching` ADD FOREIGN KEY (`id_multiple_matching_template`) REFERENCES `multiple_matching_template` (`id`);
ALTER TABLE `multiple_matching` ADD FOREIGN KEY (`id_correct_answer`) REFERENCES `option_multiple_matching` (`id`);
ALTER TABLE `multiple_matching` ADD FOREIGN KEY (`id_multiple_matching_template`) REFERENCES `multiple_matching_template` (`id`);

-- Reading Comprehension
ALTER TABLE `reading_comprehension` ADD FOREIGN KEY (`id_reading_comprehension_template`) REFERENCES `reading_comprehension_template` (`id`);
ALTER TABLE `option_reading_comprehension` ADD FOREIGN KEY (`id_reading_comprehension`) REFERENCES `reading_comprehension` (`id`);

-- Gap Fill
ALTER TABLE `gap_fill_option` ADD FOREIGN KEY (`id_gap_fill_question`) REFERENCES `gap_fill_question` (`id`);
ALTER TABLE `gap_fill_question` ADD FOREIGN KEY (`id_gap_fill_template`) REFERENCES `gap_fill_template` (`id`);

-- Multiple Choice Cloze
ALTER TABLE `multiple_choice_cloze` ADD FOREIGN KEY (`id_template`) REFERENCES `template_multiple_choice_cloze` (`id`);
ALTER TABLE `question_number` ADD FOREIGN KEY (`id_multiple`) REFERENCES `multiple_choice_cloze` (`id`);
ALTER TABLE `options_multiple_choice_cloze` ADD FOREIGN KEY (`id_question_number`) REFERENCES `question_number` (`id`);

-- Open Cloze
ALTER TABLE `open_cloze_option` ADD FOREIGN KEY (`id_open_cloze_question`) REFERENCES `open_cloze_question` (`id`);
ALTER TABLE `open_cloze_question` ADD FOREIGN KEY (`id_open_cloze_template`) REFERENCES `open_cloze_template` (`id`);

-- Assigned Exam
ALTER TABLE `assigned_exam` ADD FOREIGN KEY (`id_student`) REFERENCES `student` (`id`);
ALTER TABLE `assigned_exam` ADD FOREIGN KEY (`id_exam`) REFERENCES `exam` (`id`);

-- Evaluator Teacher
ALTER TABLE `evaluator_teacher` ADD FOREIGN KEY (`id_assigned_exam`) REFERENCES `assigned_exam` (`id`);

-- Completed Exam
ALTER TABLE `completed_exam` ADD FOREIGN KEY (`id_assigned_exam`) REFERENCES `assigned_exam` (`id`);
ALTER TABLE `completed_exam` ADD FOREIGN KEY (`id_student`) REFERENCES `student` (`id`);
ALTER TABLE `completed_exam` ADD FOREIGN KEY (`id_reading_answer`) REFERENCES `reading_answer` (`id`);
ALTER TABLE `completed_exam` ADD FOREIGN KEY (`id_writing_answer`) REFERENCES `writing_answer` (`id`);

-- Reading Answer
ALTER TABLE `reading_answer` ADD FOREIGN KEY (`id_signs_answer`) REFERENCES `signs_answer` (`id`);
ALTER TABLE `reading_answer` ADD FOREIGN KEY (`id_simple_multiple_answer`) REFERENCES `simple_multiple_answer` (`id`);
ALTER TABLE `reading_answer` ADD FOREIGN KEY (`id_multiple_matching_answer`) REFERENCES `multiple_matching_answer` (`id`);
ALTER TABLE `reading_answer` ADD FOREIGN KEY (`id_reading_comprehension_answer`) REFERENCES `reading_comprehension_answer` (`id`);
ALTER TABLE `reading_answer` ADD FOREIGN KEY (`id_open_cloze_answer`) REFERENCES `open_cloze_answer` (`id`);
ALTER TABLE `reading_answer` ADD FOREIGN KEY (`id_answer_multiple_choice_cloze`) REFERENCES `answer_multiple_choice_cloze` (`id`);
ALTER TABLE `reading_answer` ADD FOREIGN KEY (`id_gap_fill_answer`) REFERENCES `gap_fill_answer` (`id`);

-- Calification
ALTER TABLE `calification` ADD FOREIGN KEY (`id_student`) REFERENCES `student` (`id`);
ALTER TABLE `calification` ADD FOREIGN KEY (`id_completed_exam`) REFERENCES `completed_exam` (`id`);

-- Sesiones
ALTER TABLE `Sesion_Student` ADD FOREIGN KEY (`id_student`) REFERENCES `student` (`id`);
