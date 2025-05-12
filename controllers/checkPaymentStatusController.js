import connection from "../config/db.js";

const checkPaymentStatusController = (req, res) => {
  const transactionReference = req.params.transactionReference;

  let response;

  const sql =
    "SELECT * FROM `processed_payments` WHERE `transaction_reference` = ?";
  const values = [Number(transactionReference)];

  connection.execute(sql, values, (err, rows, fields) => {
    if (err instanceof Error) {
      console.log(err);
      return;
    }

    if (rows.length > 0) {
      response = {
        status: "success",
        message: "Payment status retrieved successfully",
        data: rows[0],
      };
      res.status(200).json(response);
    } else {
      response = {
        status: "failed",
        message: "Transaction reference not found",
        data: null,
      };
      res.status(404).json(response);
    }
  });
};

export default checkPaymentStatusController;
