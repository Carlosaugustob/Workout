CREATE TABLE `exercise` (
	`id` serial AUTO_INCREMENT NOT NULL,
	`name` varchar(255) NOT NULL,
	CONSTRAINT `exercise_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `instructorHasStudent` (
	`id` serial AUTO_INCREMENT NOT NULL,
	`structorId` int,
	`studentId` int,
	CONSTRAINT `instructorHasStudent_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `instructor` (
	`id` serial AUTO_INCREMENT NOT NULL,
	`name` varchar(255) NOT NULL,
	`age` int NOT NULL,
	`email` varchar(255) NOT NULL,
	`phoneNumber` varchar(255) NOT NULL,
	`password` varchar(255) NOT NULL,
	`serialCONFEF` varchar(255) NOT NULL,
	CONSTRAINT `instructor_id` PRIMARY KEY(`id`),
	CONSTRAINT `instructor_email_unique` UNIQUE(`email`),
	CONSTRAINT `instructor_phoneNumber_unique` UNIQUE(`phoneNumber`),
	CONSTRAINT `instructor_password_unique` UNIQUE(`password`),
	CONSTRAINT `instructor_serialCONFEF_unique` UNIQUE(`serialCONFEF`)
);
--> statement-breakpoint
CREATE TABLE `student` (
	`id` serial AUTO_INCREMENT NOT NULL,
	`name` varchar(255) NOT NULL,
	`age` int NOT NULL,
	`phoneNumber` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL,
	`weight` varchar(255) NOT NULL,
	`dateOfBirth` varchar(255) NOT NULL,
	`height` varchar(255) NOT NULL,
	`startDate` varchar(255) NOT NULL,
	`password` varchar(255) NOT NULL,
	CONSTRAINT `student_id` PRIMARY KEY(`id`),
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
	`workoutId` int,
	`exercisetId` int,
	`series` varchar(255) NOT NULL,
	`reps` varchar(255) NOT NULL,
	`exerciseWeight` varchar(255) NOT NULL,
	CONSTRAINT `workoutHasExercise_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `workout` (
	`id` serial AUTO_INCREMENT NOT NULL,
	`name` varchar(255) NOT NULL,
	CONSTRAINT `workout_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
ALTER TABLE `instructorHasStudent` ADD CONSTRAINT `instructorHasStudent_structorId_instructor_id_fk` FOREIGN KEY (`structorId`) REFERENCES `instructor`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `instructorHasStudent` ADD CONSTRAINT `instructorHasStudent_studentId_student_id_fk` FOREIGN KEY (`studentId`) REFERENCES `student`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `workoutHasExercise` ADD CONSTRAINT `workoutHasExercise_workoutId_workout_id_fk` FOREIGN KEY (`workoutId`) REFERENCES `workout`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `workoutHasExercise` ADD CONSTRAINT `workoutHasExercise_exercisetId_exercise_id_fk` FOREIGN KEY (`exercisetId`) REFERENCES `exercise`(`id`) ON DELETE cascade ON UPDATE no action;