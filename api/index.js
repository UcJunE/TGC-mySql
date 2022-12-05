const express = require("express");
const cors = require("cors");
const app = express();
const mysql2 = require("mysql2/promise");
require("dotenv").config();

//make sure  to require the mysql2/promise version
// because???
app.use(express.json()); //req.bodu will be formatted as a json object.
app.use(cors());

//route
async function main() {
  const connection = await mysql2.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    database: process.env.DB_DATABASE,
    password: process.env.DB_PASSWORD,
    // we leave password blank becauase root acc has no password
  });

  app.get("/", function (req, res) {
    res.send("Hello world");
  });

  app.get("/artist", async function (req, res) {
    const [results] = await connection.execute("SELECT * FROM Artist");
    res.json(results);
  });

  app.get("/album", async function (req, res) {});

  app.get("/employee", async function (req, res) {
    //always start with Where 1 , so it will show everything.
    //create always true where query . 1 = true , so it will return all the data from table
    let query = "SELECT * FROM Employee WHERE 1";

    if (req.query.job_title) {
      query += `AND Title like "%${req.query.job_title}%"`;
    }
    const [results] = await connection.execute(query);
    res.json(results);
  });
}
main();

app.listen(3000, function () {
  console.log("Server started at port 3000");
});
