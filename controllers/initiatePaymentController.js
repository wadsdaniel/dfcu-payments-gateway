import connection from "../config/db.js";

const initiatePaymentController = (req, res) => {
  const data = req.body;

  /* Validate Data */
  if (
    !data.payerAccountNumber ||
    !data.payeeAccountNumber ||
    !data.amount ||
    !data.currency
  ) {
    res.status(400);
    res.send({
      message: "Please provide all required fields",
    });
    return;
  }

  /* Check that the supplied payer account numbers exist */
  const sql2 = "SELECT * FROM `accounts` WHERE `account_number` = ?";
  const values2 = [data.payerAccountNumber];

  connection.execute(sql2, values2, (err, rows, fields) => {
    if (err instanceof Error) {
      console.log(err);
      return;
    }

    if (rows.length === 0) {
      res.status(400);
      res.send({
        message: "Payer account number does not exist",
      });
      return;
    }
  });

  /* Check that the supplied payee account numbers exist */
  const sql3 = "SELECT * FROM `accounts` WHERE `account_number` = ?";
  const values3 = [data.payeeAccountNumber];

  connection.execute(sql3, values3, (err, rows, fields) => {
    if (err instanceof Error) {
      console.log(err);
      return;
    }

    if (rows.length === 0) {
      res.status(400);
      res.send({
        message: "Payee account number does not exist",
      });
      return;
    }
  });

  /*Post Data to Database */
  const sql =
    "INSERT INTO `initiated_payments`(`payer_account_number`, `payee_account_number`, `amount`, `currency`, `payer_reference`) VALUES (?, ?, ?, ?, ?)";

  const values = [
    data.payerAccountNumber,
    data.payeeAccountNumber,
    data.amount,
    data.currency,
    data.payerReference,
  ];

  connection.execute(sql, values, (err, result, fields) => {
    if (err instanceof Error) {
      console.log(err);
      return;
    }
    const paymentResponse = paymentProcessingSimulator();

    /* Update the payment record with the new data from the payment processing system simulator (transaction reference, status code, and the response message) */
    const sql2 =
      "INSERT INTO `processed_payments`(`initiated_payment_id`, `transaction_reference`, `status_code`, `response_message`) VALUES (?, ?, ?, ?)";

    const values2 = [
      result.insertId,
      paymentResponse.transactionReference,
      paymentResponse.statusCode,
      paymentResponse.responseMessage,
    ];

    connection.execute(sql2, values2, (err, result, fields) => {
      if (err instanceof Error) {
        console.log(err);
        return;
      }

      if (result.affectedRows === 1) {
        res.send(paymentResponse);
      } else {
        res.send("Error processing request!");
      }
    });
  });
};

function paymentProcessingSimulator() {
  /* Status code choices to satisfy the Pending - 10% (10 - 100s), Successful - 85% (85 200s), Failed - 5% (5 400s)  */
  const statusCodeChoices = [
    100, 200, 200, 200, 200, 200, 200, 200, 200, 100, 200, 200, 200, 200, 200,
    200, 200, 200, 200, 200, 200, 100, 200, 200, 200, 200, 200, 200, 400, 200,
    200, 200, 200, 200, 100, 200, 100, 200, 200, 200, 200, 200, 400, 200, 200,
    200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 400, 100, 200,
    200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200,
    200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 100, 200, 100, 200,
    400, 100, 200, 100, 200, 200, 200, 400, 200, 200,
  ];

  let randomStatusCode =
    statusCodeChoices[Math.floor(Math.random() * statusCodeChoices.length)];

  let transactionReference;

  transactionReference = generateTransactionReference();

  const response = {
    transactionReference: transactionReference,
    statusCode: randomStatusCode,
    responseMessage: responseMessage(randomStatusCode),
  };

  return response;
}

function responseMessage(statusCode) {
  let responseMessage = "";

  /* Because we are just simulating the payment processing service, we try to come up with some simulated error messages */
  const errorMessageChoices = [
    "There are insufficient funds on the account",
    "An error has occured at the server. Please contact the administrator",
    "Payee account is frozen",
    "System timeout. Please try again!",
    "Specified payer account is suspended",
    "Specified payee account is suspended",
    "Specified payer account is inactive",
    "Specified payee account is inactive",
  ];

  switch (statusCode) {
    case 100:
      responseMessage = "Transaction Pending";
      break;
    case 200:
      responseMessage = "Transaction successful";
      break;
    case 400:
      responseMessage = `Transaction failed - ${errorMessageChoices[Math.floor(Math.random() * errorMessageChoices.length)]}`;
      break;
    default:
      responseMessage = "No value found";
  }

  return responseMessage;
}

function generateTransactionReference() {
  let transactionReference = "";

  /* We want a 12 digit TRN */
  for (let i = 0; i < 12; ++i) {
    let randomDigit;
    if (i == 0) {
      /* We don't want the first digit to be a zero */
      randomDigit = Math.floor(Math.random() * 10) + 1;
    } else {
      randomDigit = Math.floor(Math.random() * 10);
    }
    transactionReference += randomDigit;
  }

  return Number(transactionReference);
}

export default initiatePaymentController;
