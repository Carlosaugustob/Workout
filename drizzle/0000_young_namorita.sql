CREATE TABLE `exercise` (
	`unsigned` int NOT NULL,
	`name` varchar(255) NOT NULL,
	CONSTRAINT `exercise_unsigned` PRIMARY KEY(`unsigned`)
);
--> statement-breakpoint
CREATE TABLE `instructorHasStudent` (
	`id` serial AUTO_INCREMENT NOT NULL,
	`unsigned` int NOT NULL,
	CONSTRAINT `instructorHasStudent_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `instructor` (
	`unsigned` int NOT NULL,
	`name` varchar(255) NOT NULL,
	`age` int NOT NULL,
	`email` varchar(255) NOT NULL,
	`phoneNumber` varchar(255) NOT NULL,
	`password` varchar(255) NOT NULL,
	`serialCONFEF` varchar(255) NOT NULL,
	CONSTRAINT `instructor_unsigned` PRIMARY KEY(`unsigned`),
	CONSTRAINT `instructor_email_unique` UNIQUE(`email`),
	CONSTRAINT `instructor_phoneNumber_unique` UNIQUE(`phoneNumber`),
	CONSTRAINT `instructor_password_unique` UNIQUE(`password`),
	CONSTRAINT `instructor_serialCONFEF_unique` UNIQUE(`serialCONFEF`)
);
--> statement-breakpoint
CREATE TABLE `student` (
	`unsigned` int NOT NULL,
	`name` varchar(255) NOT NULL,
	`age` int NOT NULL,
	`phoneNumber` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL,
	`weight` varchar(255) NOT NULL,
	`dateOfBirth` varchar(255) NOT NULL,
	`height` varchar(255) NOT NULL,
	`startDate` varchar(255) NOT NULL,
	`password` varchar(255) NOT NULL,
	CONSTRAINT `student_unsigned` PRIMARY KEY(`unsigned`),
	CONSTRAINT `student_phoneNumber_unique` UNIQUE(`phoneNumber`),
	CONSTRAINT `student_email_unique` UNIQUE(`email`),
	CONSTRAINT `student_weight_unique` UNIQUE(`weight`),
	CONSTRAINT `student_dateOfBirth_unique` UNIQUE(`dateOfBirth`),
	CONSTRAINT `student_height_unique` UNIQUE(`height`),
	CONSTRAINT `student_startDate_unique` UNIQUE(`startDate`),
	CONSTRAINT `student_password_unique` UNIQUE(`password`)
);
--> statement-breakpoint
CREATE TABLE `workoutHasExercise` (
	`id` serial AUTO_INCREMENT NOT NULL,
	`unsigned` int NOT NULL,
	`series` varchar(255) NOT NULL,
	`reps` varchar(255) NOT NULL,
	`exerciseWeight` varchar(255) NOT NULL,
	CONSTRAINT `workoutHasExercise_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `workout` (
	`unsigned` int NOT NULL,
	`name` varchar(255) NOT NULL,
	CONSTRAINT `workout_unsigned` PRIMARY KEY(`unsigned`)
);
--> statement-breakpoint
ALTER TABLE `instructorHasStudent` ADD CONSTRAINT `instructorHasStudent_unsigned_instructor_unsigned_fk` FOREIGN KEY (`unsigned`) REFERENCES `instructor`(`unsigned`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `instructorHasStudent` ADD CONSTRAINT `instructorHasStudent_unsigned_student_unsigned_fk` FOREIGN KEY (`unsigned`) REFERENCES `student`(`unsigned`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `workoutHasExercise` ADD CONSTRAINT `workoutHasExercise_unsigned_workout_unsigned_fk` FOREIGN KEY (`unsigned`) REFERENCES `workout`(`unsigned`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `workoutHasExercise` ADD CONSTRAINT `workoutHasExercise_unsigned_exercise_unsigned_fk` FOREIGN KEY (`unsigned`) REFERENCES `exercise`(`unsigned`) ON DELETE cascade ON UPDATE no action;