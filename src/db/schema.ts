import { int, mysqlTable, serial, varchar } from 'drizzle-orm/mysql-core';


export const instructorTable = mysqlTable('instructor', {
    id: int('unsigned').primaryKey(),
    name: varchar({ length: 255 }).notNull(),
    age: int().notNull(),
    email: varchar({ length: 255 }).notNull().unique(),
    phoneNumber: varchar({ length: 255 }).notNull().unique(),
    password: varchar({ length: 255 }).notNull().unique(),
    serialCONFEF: varchar({ length: 255 }).notNull().unique()
});
export const studentTable = mysqlTable('student', {
    id: int('unsigned').primaryKey(),
    name: varchar({ length: 255 }).notNull(),
    age: int().notNull(),
    phoneNumber: varchar({ length: 255 }).notNull().unique(),
    email: varchar({ length: 255 }).notNull().unique(),
    weight: varchar({ length: 255 }).notNull().unique(),
    dateOfBirth: varchar({ length: 255 }).notNull().unique(),
    height: varchar({ length: 255 }).notNull().unique(),
    startDate: varchar({ length: 255 }).notNull().unique(),
    password: varchar({ length: 255 }).notNull().unique()
});
export const workoutTable = mysqlTable('workout', {
    id: int('unsigned').primaryKey(),
    name: varchar({ length: 255 }).notNull(),
});
export const ExerciseTable = mysqlTable('exercise', {
    id: int('unsigned').primaryKey(),
    name: varchar({ length: 255 }).notNull(),
});
export const workoutHasExerciseTable = mysqlTable('workoutHasExercise', {
    id: serial().primaryKey(),
    workoutId: int('unsigned').notNull().references(() => workoutTable.id, { onDelete: "cascade" }),
    exercisetId: int('unsigned').notNull().references(() => ExerciseTable.id, { onDelete: "cascade" }),
    series: varchar({ length: 255 }).notNull(),
    reps: varchar({ length: 255 }).notNull(),
    exerciseWeight: varchar({ length: 255 }).notNull(),

});
export const InstructorHasStudentTable = mysqlTable('instructorHasStudent', {
    id: serial().primaryKey(),
    instructorId: int('unsigned').notNull().references(() => instructorTable.id, { onDelete: "cascade" }),
    studentId: int('unsigned').notNull().references(() => studentTable.id, { onDelete: "cascade" }),

});
