import Router from 'express';
import reportController from '../controllers/reportController.js';

const app = Router();
app.get('/api/report', reportController);

export default app;