import { postData } from "./requests.js";

function crearParrafo(titulo, contenido) {
  let parrafo = document.createElement("p");
  parrafo.classList.add("card-text");
  parrafo.textContent = titulo + " " + contenido
  return parrafo;
}

let btnBuscar = document.querySelector("#btnBuscar");
btnBuscar.addEventListener("click", (e) => {
  e.preventDefault();
  let contenedorVuelos = document.querySelector("#vuelos");
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
    data.result.forEach((element) => {
      let row = document.createElement("div");
      row.classList.add("row");
      let card = document.createElement("div");
      card.classList.add("card");
      row.appendChild(card);

      let cardBody = document.createElement("div");
      cardBody.classList.add("card-body");
      card.appendChild(cardBody)

      let ciudad_origen = crearParrafo("Ciudad origen: ", element.ciudad_origen)
      let ciudad_destino = crearParrafo("Ciudad de destino: ", element.ciudad_destino)
      cardBody.appendChild(ciudad_origen);
      cardBody.appendChild(ciudad_destino)
      contenedorVuelos.appendChild(cardBody)
      
    });
  });
});
