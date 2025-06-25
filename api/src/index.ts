import 'dotenv/config';
import  express  from 'express';
  
function main() {
 
  const app = express();


  app.listen(3333, () => console.log('servidor está rodando'))

}
main();