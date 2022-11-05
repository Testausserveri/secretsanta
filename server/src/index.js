const express = require('express');
const mongoose = require('mongoose');

const userRouter = require('./router/user');
const adminRouter = require('./router/admin');

const app = express();

async function bootstrap() {
  console.log('Connecting to database');
  await mongoose.connect('mongodb://junction:password@localhost:27017/junction?authSource=admin');
  app.use(express.json());

  app.use('/user', userRouter);
  app.use('/admin', adminRouter);
  app.listen(process.env.PORT || 3000, () => {
    console.log(`Connected and we are now online! Port ${process.env.PORT || 3000}`);
  })
}

bootstrap();