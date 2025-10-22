import { postData } from "./requests.js";

function seleccionarVuelos() {}

postData("http://localhost:3000/users").then((data) => {
  console.log(data); // JSON data parsed by `data.json()` call
});
