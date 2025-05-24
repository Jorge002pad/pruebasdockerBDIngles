USE nombreBD;

CREATE TABLE `major` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `major_name` VARCHAR(100),
  `description` TEXT,
  `created_at` timestamp
);

CREATE TABLE `question_type` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `question_name` VARCHAR(300),
  `created_at` timestamp
);

CREATE TABLE `level` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `level_name` VARCHAR(300),
  `description` TEXT,
  `id_level_coordinator` INT NOT NULL,
  `created_at` timestamp
);

CREATE TABLE `group` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name_group` VARCHAR(200),
  `id_professor` INT NOT NULL,
  `id_level` INT NOT NULL,
  `created_at` timestamp
);

CREATE TABLE `student` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `first_names` VARCHAR(100),
  `last_name` VARCHAR(100),
  `id_major` INT NOT NULL,
  `id_level` INT NOT NULL,
  `id_group_english` INT NOT NULL,
  `matricula` VARCHAR(30),
  `email` VARCHAR(300),
  `password` VARCHAR(300),
  `is_active` BOOLEAN,
  `created_at` timestamp
);

CREATE TABLE `user` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `first_names` VARCHAR(100),
  `last_name` VARCHAR(100),
  `office` VARCHAR(100),
  `email` VARCHAR(300) UNIQUE,
  `password` VARCHAR(300),
  `is_professor` BOOL DEFAULT false,
  `is_level_coordinator` BOOL DEFAULT false,
  `is_administrator` BOOL DEFAULT false,
  `is_active` BOOLEAN,
  `created_at` timestamp
);

CREATE TABLE `exam_type` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `exam_name` VARCHAR(300),
  `created_at` timestamp
);

CREATE TABLE `exam` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_level` INT NOT NULL,
  `id_writing_template` INT NOT NULL,
  `id_reading_template` INT NOT NULL,
  `duration_time` INT,
  `who_created` INT NOT NULL,
  `updated_at` DATETIME,
  `created_at` timestamp
);

CREATE TABLE `writing_template` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_level` INT NOT NULL,
  `id_exam_type` INT NOT NULL,
  `texto` TEXT,
  `who_created` INT NOT NULL,
  `topic` VARCHAR(100),
  `updated_at` DATETIME,
  `created_at` timestamp
);

CREATE TABLE `image` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `link_image` TEXT,
  `id_writing_template` INT NOT NULL,
  `created_at` timestamp
);

CREATE TABLE `writing_answer` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_writing_template` INT NOT NULL,
  `texto` TEXT,
  `answer` VARCHAR(100),
  `created_at` timestamp
);

CREATE TABLE `reading_template` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `who_created` INT NOT NULL,
  `id_level` INT NOT NULL,
  `title` VARCHAR(200),
  `description` TEXT,
  `id_exam_type` INT NOT NULL,
  `id_signs_template` INT DEFAULT null,
  `id_simple_multiple_template` INT DEFAULT null,
  `id_multiple_matching_template` INT DEFAULT null,
  `id_reading_comprehension_template` INT DEFAULT null,
  `id_open_cloze_template` INT DEFAULT null,
  `id_template_multiple_choice_cloze` INT DEFAULT null,
  `id_gap_fill_template` INT DEFAULT null,
  `updated_at` DATETIME,
  `created_at` timestamp
);

CREATE TABLE `signs_template` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(300),
  `instruction` TEXT,
  `question_number` INT,
  `id_level` INT NOT NULL,
  `created_at` timestamp
);

CREATE TABLE `signs` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_sign_template` INT NOT NULL,
  `link_img` VARCHAR(300),
  `created_at` timestamp
);

CREATE TABLE `sign_options` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(300),
  `id_sign` INT NOT NULL,
  `correct_answer` BOOL DEFAULT 0,
  `created_at` timestamp
);

CREATE TABLE `simple_multiple_template` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(300),
  `instruction` TEXT,
  `question_number` INT,
  `id_level` INT NOT NULL,
  `created_at` timestamp
);

CREATE TABLE `simple_multiple` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_simple_multiple_template` INT NOT NULL,
  `sentence` VARCHAR(300),
  `created_at` timestamp
);

CREATE TABLE `option_simple_multiple` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `description` VARCAHR(100),
  `correct_answer` BOOL DEFAULT false,
  `id_simple_multiple` INT NOT NULL,
  `created_at` timestamp
);

CREATE TABLE `multiple_matching_template` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(300),
  `instruction` VARCHAR(300),
  `question_number` INT,
  `topic` VARCHAR(300),
  `id_level` INT NOT NULL,
  `created_at` timestamp
);

CREATE TABLE `option_multiple_matching` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(300),
  `description` TEXT,
  `id_multiple_matching_template` INT NOT NULL,
  `created_at` timestamp
);

CREATE TABLE `multiple_matching` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `description` TEXT,
  `id_correct_answer` INT DEFAULT null,
  `id_multiple_matching_template` INT NOT NULL,
  `created_at` timestamp
);

CREATE TABLE `reading_comprehension_template` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(300),
  `instruction` VARCHAR(300),
  `question_number` INT,
  `topic` VARCHAR(300),
  `description` text,
  `id_level` INT NOT NULL,
  `created_at` timestamp
);

CREATE TABLE `reading_comprehension` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `sentence` VARCHAR(300),
  `id_reading_comprehension_template` INT NOT NULL,
  `created_at` timestamp
);

CREATE TABLE `option_reading_comprehension` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(300),
  `correct_answer` BOOL DEFAULT false,
  `id_reading_comprehension` INT NOT NULL,
  `created_at` timestamp
);

CREATE TABLE `gap_fill_template` (
  `id` integer PRIMARY KEY,
  `title` tinytext NOT NULL,
  `instruction` tinytext,
  `topic` tinytext NOT NULL,
  `id_level` INT NOT NULL,
  `created_at` timestamp
);

CREATE TABLE `gap_fill_question` (
  `id` integer PRIMARY KEY,
  `texto` tinytext NOT NULL,
  `counter` integer,
  `id_gap_fill_template` integer NOT NULL,
  `created_at` timestamp
);

CREATE TABLE `gap_fill_option` (
  `id` integer PRIMARY KEY,
  `id_gap_fill_question` integer NOT NULL,
  `answer` tinytext NOT NULL,
  `created_at` timestamp
);

CREATE TABLE `template_multiple_choice_cloze` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `title` tinytext NOT NULL,
  `instruction` tinytext,
  `topic` tinytext NOT NULL,
  `id_level` INT NOT NULL,
  `created_at` timestamp
);

CREATE TABLE `multiple_choice_cloze` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `counter` int NOT NULL,
  `texto` tinytext,
  `id_template` int,
  `created_at` timestamp
);

CREATE TABLE `question_number` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `id_multiple` int,
  `created_at` timestamp
);timestamp

CREATE TABLE `options_multiple_choice_cloze` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `description` tinytext NOT NULL,
  `id_question_number` int,
  `created_at` timestamp
);

CREATE TABLE `open_cloze_template` (
  `id` integer PRIMARY KEY,
  `title` tinytext NOT NULL,
  `instruction` tinytext,
  `topic` tinytext NOT NULL,
  `id_level` INT NOT NULL,
  `created_at` timestamp
);

CREATE TABLE `open_cloze_question` (
  `id` integer PRIMARY KEY,
  `texto` tinytext NOT NULL,
  `counter` integer,
  `id_open_cloze_template` integer NOT NULL,
  `created_at` timestamp
);

CREATE TABLE `open_cloze_option` (
  `id` integer PRIMARY KEY,
  `id_respuesta` integer,
  `description` tinytext NOT NULL,
  `id_open_cloze_question` integer NOT NULL,
  `created_at` timestamp
);

CREATE TABLE `assigned_exam` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_proffesor` INT NOT NULL,
  `id_student` INT NOT NULL,
  `id_exam` INT NOT NULL,
  `created_at` timestamp
);

CREATE TABLE `evaluator_teacher` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_assigned_exam` INT NOT NULL,
  `id_proffesor` INT NOT NULL,
  `created_at` timestamp
);

CREATE TABLE `completed_exam` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_assigned_exam` INT NOT NULL,
  `id_student` INT NOT NULL,
  `dateComplete` DATE,
  `id_reading_answer` INT NOT NULL,
  `id_writing_answer` INT NOT NULL,
  `created_at` timestamp
);

CREATE TABLE `reading_answer` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_signs_answer` INT DEFAULT null,
  `id_simple_multiple_answer` INT DEFAULT null,
  `id_multiple_matching_answer` INT DEFAULT null,
  `id_reading_comprehension_answer` INT DEFAULT null,
  `id_open_cloze_answer` INT DEFAULT null,
  `id_answer_multiple_choice_cloze` INT DEFAULT null,
  `id_gap_fill_answer` INT DEFAULT null,
  `created_at` timestamp
);

CREATE TABLE `signs_answer` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `answer` INT,
  `created_at` timestamp
);

CREATE TABLE `simple_multiple_answer` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `answer` INT,
  `created_at` timestamp
);

CREATE TABLE `multiple_matching_answer` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `question_answer` INT,
  `option_answer` INT,
  `created_at` timestamp
);

CREATE TABLE `reading_comprehension_answer` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `question_answer` INT,
  `option_answer` INT,
  `created_at` timestamp
);

CREATE TABLE `open_cloze_answer` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `answer` TEXT,
  `question_number` INT,
  `created_at` timestamp
);

CREATE TABLE `answer_multiple_choice_cloze` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `question_answer` INT,
  `option_answer` INT,
  `created_at` timestamp
);

CREATE TABLE `gap_fill_answer` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `question_number` INT,
  `option_answer` INT,
  `created_at` timestamp
);

CREATE TABLE `calification` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_student` INT NOT NULL,
  `id_completed_exam` INT NOT NULL,
  `score_reading` INT,
  `score_writing` INT,
  `created_at` timestamp
);

CREATE TABLE `Sesion_Student` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `Ip` TEXT,
  `id_student` INT NOT NULL,
  `created_at` timestamp
);

CREATE TABLE `Sesion_User` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `Ip` TEXT,
  `id_user` INT NOT NULL,
  `created_at` timestamp
);