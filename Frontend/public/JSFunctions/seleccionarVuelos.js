import { postData } from "./requests.js";

function crearParrafo(titulo, contenido) {
  const p = document.createElement("p");
  p.classList.add("mb-1");
  p.innerHTML = `<strong>${titulo}</strong> ${contenido}`;
  return p;
}

const btnBuscar = document.querySelector("#btnBuscar");

btnBuscar.addEventListener("click", (e) => {
  e.preventDefault();

  const contenedorVuelos = document.querySelector("#vuelos");
  contenedorVuelos.innerHTML = ""; // Limpiar resultados previos

  const origen = document.querySelector("#origen").value.trim();
  const destino = document.querySelector("#destino").value.trim();
  const fechaIda = document.querySelector("#fechaIda").value;
  const numPersonas = document.querySelector("#personas").value;
  const busquedaVuelo = {
    ciudad_origen: origen,
    ciudad_destino: destino,
    fecha_salida: fechaIda,
    cantidad_sillas: numPersonas,
  };

  if (origin.length === 0 && destino.length === 0 && fechaIda.length === 0) {
     Swal.fire({
       title: "ERROR",
       text: "Faltan campos por rellenar",
       icon: "error",
     });
     return;
  }

  postData("/flights/search/form", busquedaVuelo).then((data) => {
    console.log(data);
    if (data.result === undefined) {
      Swal.fire({
        title: "Aviso",
        text: "No se encontraron vuelos disponibles",
        icon: "warning"
      })
      return;
    }
    data.result.forEach((element) => {
      const row = document.createElement("div");
      row.classList.add(
        "row",
        "align-items-center",
        "bg-light",
        "rounded-4",
        "shadow-sm",
        "my-3",
        "p-3"
      );
      row.style.transition = "transform 0.2s ease-in-out";
      row.setAttribute("id", element.id);

      // Efecto hover
      row.addEventListener(
        "mouseenter",
        () => (row.style.transform = "scale(1.01)")
      );
      row.addEventListener(
        "mouseleave",
        () => (row.style.transform = "scale(1)")
      );

      // Columna 1: Origen y destino
      const colOrigenDestino = document.createElement("div");
      colOrigenDestino.classList.add("col-md-3", "text-center", "border-end");
      colOrigenDestino.innerHTML = `
        <h6 class="fw-bold text-primary mb-2">Trayecto</h6>
        <p class="mb-0">Ciudad de origen: <strong>${element.ciudad_origen}</strong></p>
        <p class="mb-0">Ciudad de destino: <strong>${element.ciudad_destino}</strong></p>
      `;

      // Columna 2: Fechas
      const colFechas = document.createElement("div");
      colFechas.classList.add("col-md-4", "text-center", "border-end");
      const fechaSalida = new Date(element.fecha_salida).toLocaleDateString();
      const fechaLlegada = new Date(element.fecha_llegada).toLocaleDateString();
      colFechas.innerHTML = `
        <h6 class="fw-bold text-success mb-2">Fechas</h6>
        <p class="mb-0">Salida: <strong>${fechaSalida}</strong> 🕓 ${element.hora_salida}</p>
        <p class="mb-0">Llegada: <strong>${fechaLlegada}</strong> 🕘 ${element.hora_llegada}</p>
      `;

      // Columna 3: Detalles
      const colDetalles = document.createElement("div");
      colDetalles.classList.add("col-md-3", "text-center", "border-end");
      colDetalles.innerHTML = `
        <h6 class="fw-bold text-secondary mb-2">Detalles</h6>
        <p class="mb-0">🧍‍♂️ Personas: <strong>${busquedaVuelo.cantidad_sillas}</strong></p>
        <p class="mb-0">ID vuelo: <strong>${element.id}</strong></p>
      `;

      // Columna 4: Botón
      const colBoton = document.createElement("div");
      colBoton.classList.add("col-md-2", "text-center");
      const btnSeleccionar = document.createElement("button");
      btnSeleccionar.classList.add(
        "btn",
        "btn-primary",
        "fw-semibold",
        "px-4",
        "py-2"
      );
      btnSeleccionar.textContent = "Seleccionar";
      btnSeleccionar.addEventListener("click", () => {
        alert(`Vuelo seleccionado con ID: ${element.id}`);
        const datosVuelo = {
          id: element.id,
          numPersonas: numPersonas
        }
        // window.location.href = `./frmPasajeros.html?id_vuelo=${element.id}&num=${numPersonas}`
        localStorage.setItem('vueloData', JSON.stringify(datosVuelo))
          window.location.href = `./frmPasajeros.html`;
        
      });

      colBoton.appendChild(btnSeleccionar);

      // Agregar columnas a la fila
      row.append(colOrigenDestino, colFechas, colDetalles, colBoton);

      // Agregar fila al contenedor
      contenedorVuelos.appendChild(row);
    });
  });
});
