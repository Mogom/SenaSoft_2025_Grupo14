// Seleccionar los radio buttons
let btnIda = document.querySelector("#ida");
let btnIdaVuelta = document.querySelector("#idaVuelta");

// Seleccionar el formulario
let formVuelos = document.querySelector("#frmVuelo");
let inpFechaIda = document.querySelector("#fechaIda");
console.log(inpFechaIda)

// Funcion de validacion rango
function validarRangoFechas(inpFecha) {
  // Validacion de fecha(hoy, a partir de 2 meses)
  const hoy = new Date();

  const fechaActualFormat = hoy.toISOString().split("T")[0];

  // Establecer fecha minima
  inpFecha.min = fechaActualFormat;

  // Establecer fecha maxima
  const fechaMax = new Date(hoy);
  fechaMax.setMonth(hoy.getMonth() + 2);
  const fechaMaxFormateada = fechaMax.toISOString().split("T")[0];
  inpFecha.max = fechaMaxFormateada;
}

validarRangoFechas(inpFechaIda);

btnIda.addEventListener("change", () => {
  // Si el radio button de "Ida" está seleccionado
  if (btnIda.checked) {
    // Eliminar la columna de "Fecha de vuelta" si existe
    let fechaRow = document.querySelector("#fechaRow");
    let fechaVueltaCol = document.querySelector("#fechaVueltaCol");
    if (fechaVueltaCol) {
      fechaRow.removeChild(fechaVueltaCol);
    }
  }
});

btnIdaVuelta.addEventListener("change", () => {
  // Si el radio button de "Ida y vuelta" está seleccionado
  if (btnIdaVuelta.checked) {
    // Crear la columna para "Fecha de vuelta"
    let fechaRow = document.querySelector("#fechaRow");

    // Verificar si la columna de "Fecha de vuelta" ya existe
    if (!document.querySelector("#fechaVueltaCol")) {
      let colFechaVuelta = document.createElement("div");
      colFechaVuelta.classList.add("col-sm-2");
      colFechaVuelta.id = "fechaVueltaCol";

      // Crear el label para "Fecha de vuelta"
      let lblFechaVuelta = document.createElement("label");

      lblFechaVuelta.setAttribute("for", "fechaVuelta");
      lblFechaVuelta.textContent = "Vuelta";

      // Crear el input de "Fecha de vuelta"
      let inpFechaVuelta = document.createElement("input");
      inpFechaVuelta.setAttribute("type", "date");
      inpFechaVuelta.setAttribute("id", "fechaVuelta");
      inpFechaVuelta.classList.add("form-control");
      validarRangoFechas(inpFechaVuelta);

      // Insertar el label y el input dentro de la nueva columna
      colFechaVuelta.appendChild(lblFechaVuelta);
      colFechaVuelta.appendChild(inpFechaVuelta);

      // Insertar la nueva columna al lado de la columna de "Fecha de ida"
      fechaRow.insertBefore(colFechaVuelta, fechaRow.children[2]); // Insertar después de la columna de "Origen"
    }
  }
});





