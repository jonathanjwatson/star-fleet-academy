var mysql = require("mysql");
var inquirer = require("inquirer");

var connection = mysql.createConnection({
  host: "localhost",

  // Your port; if not 3306
  port: 3306,

  // Your username
  user: "root",

  // Your password
  password: "Mickey19",
  database: "star_trekDB",
});

connection.connect(function (err) {
  if (err) throw err;
  console.log(connection.threadId);
  addNewCrew();
});

function addNewCrew() {
  connection.query("SELECT * FROM ranks", (err, data) => {
    if (err) throw err;
    console.log(data);
    // let arrayOfNames = [];
    // for (let i = 0; i < data.length; i++) {
    //   arrayOfNames.push(data[i].name);
    // }
    const arrayOfNames = data.map((object) => object.name);
    console.log(arrayOfNames);
    inquirer
      .prompt([
        {
          type: "input",
          message: "What is your new crew member's name?",
          name: "crewName",
        },
        {
          type: "list",
          message: "Please select the crew member's rank:",
          choices: arrayOfNames,
          name: "crewRank",
        },
      ])
      .then((response) => {
        console.log(response);
        const rankObject = data.filter(
          (object) => object.name === response.crewRank
        );
        console.log(rankObject);
      });
  });
}
