import { postData } from "./requests.js";

function crearParrafo(titulo, contenido) {
  let parrafo = document.createElement("p");
  parrafo.classList.add("card-text", "mx-2");
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
      row.classList.add("row", "mt-3");
      let card = document.createElement("div");
      card.classList.add("card");
      row.appendChild(card);

      let cardBody = document.createElement("div");
      cardBody.classList.add("card-body", "d-flex");
      card.appendChild(cardBody)

      let ciudad_origen = crearParrafo("Ciudad origen: ", element.ciudad_origen)
      let ciudad_destino = crearParrafo("Ciudad de destino: ", element.ciudad_destino)
      let fecha_llegada_format = new Date(element.fecha_llegada)
       let fecha_salida_format = new Date(element.fecha_salida);
      let fecha_llegada = crearParrafo("Fecha de llegada: ", fecha_llegada_format.toLocaleDateString())
      let hora_llegada = crearParrafo("Hora de llegada: ", element.hora_llegada)
      let fecha_salida = crearParrafo("Fecha de salida: ", fecha_salida_format.toLocaleDateString())
      let hora_salida = crearParrafo("Hora de salida: ", element.hora_salida)
      cardBody.appendChild(ciudad_origen);
      cardBody.appendChild(ciudad_destino)
      cardBody.appendChild(fecha_llegada);
      cardBody.appendChild(hora_llegada);
      cardBody.appendChild(fecha_salida)
       cardBody.appendChild(hora_salida);
      contenedorVuelos.appendChild(row)
      
    });
  });
});
