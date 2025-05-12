import express from "express";
import cors from "cors";
import "dotenv/config";
import checkPaymentStatusRouter from "./routers/checkPaymentStatusRouter.js";
import initiatePaymentRouter from "./routers/initiatePaymentRouter.js";
import reportRouter from "./routers/reportRouter.js";

const port = process.env.APP_PORT;
const app = express();
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

/* API Authentication Middleware */
app.use((req, res, next) => {
  const clientReqApiKey = req.get("X-API-Key");

  if (clientReqApiKey === process.env.API_KEY) {
    next();
  } else {
    res.status(401);
    res.send({
      message: "Authentication Failed!",
    });
  }
});

/* CORS Middleware */
app.use(function (req, res, next) {
  res.setHeader("Access-Control-Allow-Origin", `${process.env.CLIENT_APP_URL}`);
  res.setHeader(
    "Access-Control-Allow-Methods",
    "GET, POST, OPTIONS, PUT, PATCH, DELETE",
  );
  res.setHeader(
    "Access-Control-Allow-Headers",
    "X-Requested-With,content-type",
    "X-API-Key",
  );
  res.setHeader("Access-Control-Allow-Credentials", true);
  next();
});

/* API Routes */
app.use(initiatePaymentRouter);
app.use(checkPaymentStatusRouter);
app.use(reportRouter);

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
