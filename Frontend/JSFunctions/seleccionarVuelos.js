import { postData } from "./requests.js";

let btnBuscar = document.querySelector("#btnBuscar");
btnBuscar.addEventListener("click", (e) => {
  e.preventDefault();
  let origen = document.querySelector("#origen").value;
  let destino = document.querySelector("#destino").value;
  let fechaIda = document.querySelector("#fechaIda").value;
  let numPersonas = document.querySelector("#personas").value;
  console.log(origen);
  console.log(destino);
  console.log(fechaIda);
  console.log(numPersonas);

  let busquedaVuelo = {
    ciudad_origen: origen,
    ciudad_destino: destino,
    fecha_salida: fechaIda,
    cantidad_sillas: numPersonas,
  };



  postData("/flights/search/form", busquedaVuelo).then((data) => {
    console.log(data); // JSON data parsed by `data.json()` call
  });
});
