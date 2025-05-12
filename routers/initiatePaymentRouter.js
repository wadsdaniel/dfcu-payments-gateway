import Router from 'express';
import initiatePaymentController from '../controllers/initiatePaymentController.js';

const app = Router();
app.post('/api/payments', initiatePaymentController);

export default app;