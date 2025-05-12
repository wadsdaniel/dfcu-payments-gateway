import connection from "../config/db.js";

const reportController = (req, res) => {
  let reportData = {};

  /* Get the successful payments */
  const sql =
    "SELECT COUNT(id) FROM `processed_payments` WHERE `status_code` = ?";
  const values = [200];

  connection.execute(sql, values, (err, rows, fields) => {
    if (err instanceof Error) {
      console.log(err);
      return;
    }
    reportData.successfulPayments = rows[0]["COUNT(id)"];

    /* Get the pending payments */
    const sql2 =
      "SELECT COUNT(id) FROM `processed_payments` WHERE `status_code` = ?";
    const values2 = [100];
    connection.execute(sql2, values2, (err, rows, fields) => {
      if (err instanceof Error) {
        console.log(err);
        return;
      }
      reportData.pendingPayments = rows[0]["COUNT(id)"];

      /* Get the failed payments */
      const sql3 =
        "SELECT COUNT(id) FROM `processed_payments` WHERE `status_code` = ?";
      const values3 = [400];
      connection.execute(sql3, values3, (err, rows, fields) => {
        if (err instanceof Error) {
          console.log(err);
          return;
        }
        reportData.failedPayments = rows[0]["COUNT(id)"];
        res.send(reportData);
      });
    });
  });
};

export default reportController;
