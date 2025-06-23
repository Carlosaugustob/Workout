import 'dotenv/config';
import { drizzle } from 'drizzle-orm/mysql2';
import { eq } from 'drizzle-orm';
import { instructorTable } from './db/schema';
  
const db = drizzle(process.env.DATABASE_URL!);
async function main() {
  const user: typeof instructorTable.$inferInsert = {
    id? 'John',
    age: 30,
    email: 'john@example.com',
  };
  await db.insert(instructorTable).values(user);
  console.log('New user created!')
  const users = await db.select().from(instructorTable);
  console.log('Getting all users from the database: ', users)
  /*
  const users: {
    id: number;
    name: string;
    age: number;
    email: string;
  }[]
  */
  await db
    .update(instructorTable)
    .set({
      age: 31,
    })
    .where(eq(instructorTable.email, user.email));
  console.log('User info updated!')
  await db.delete(instructorTable).where(eq(instructorTable.email, user.email));
  console.log('User deleted!')
}
main();