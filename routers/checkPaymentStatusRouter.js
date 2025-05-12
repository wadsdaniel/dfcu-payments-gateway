import Router from 'express';
import checkPaymentStatusController from '../controllers/checkPaymentStatusController.js';

const app = Router();
app.get('/api/payments/:transactionReference', checkPaymentStatusController);

export default app;