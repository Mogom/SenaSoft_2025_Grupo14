import { postData } from "./requests.js";

function seleccionarVuelos() {}

postData("/users").then((data) => {
  console.log(data); // JSON data parsed by `data.json()` call
});
