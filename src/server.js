import express from 'express';
import { config } from 'dotenv'

import routersStudents from './routers/students.route.js'
import routersGurups from './routers/group.route.js'
config()

const server = express();
server.use(express.json());
server.use('/students', routersStudents);
server.use('/groups', routersGroups);

const PORT = process.env.PORT
server.listen(PORT, () => console.log(`server is running PORT: ${PORT}`))