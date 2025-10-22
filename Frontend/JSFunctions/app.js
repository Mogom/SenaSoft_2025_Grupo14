// Seleccionar los radioButton
let btnIda = document.querySelector("#ida");
let btnIdaVuelta = document.querySelector("#idaVuelta");

// Seleccionar el form
let formVuelos = document.querySelector("#frmVuelo");
console.log(formVuelos)

btnIda.addEventListener('change', () => {
    // Si el radio btn IDA y Vuelta esta seleccionado
    if (btnIda.checked) {
        // Creo el dateTimepicker
        let inpFechaVuelta = document.createElement('input');
        inpFechaVuelta.setAttribute("type", "date");

    }
})
btnIdaVuelta.addEventListener("change", () => {
  // Si el radio btn IDA y Vuelta esta seleccionado
  if (btnIdaVuelta.checked) {
    
    // Creo el dateTimepicker
    let inpFechaVuelta = document.createElement("input");
    inpFechaVuelta.setAttribute("type", "date");
  }
});