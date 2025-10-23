import { getData } from "./requests.js";
const pasajerosdataJson = localStorage.getItem("pasajerosData");
if (pasajerosdataJson) {
  const datos = JSON.parse(pasajerosdataJson);
    let capaForm = document.querySelector("#capaForm");
    let aviso = document.createElement("h3");
    aviso.classList.add("fw-bold", "text-center", "mb-5");
    aviso.textContent = "Seleccione su cantidad de asientos: " + datos[0].numPersonas
    capaForm.appendChild(aviso)
    let contador = 0;

  console.log(datos);

  getData("/flights/all/chairs:" + datos[0].id_vuelo).then((data) => {
    console.log(data);
      data.result.forEach((element) => {
      let col = document.createElement("div");
      col.classList.add("col-sm-3", "text-light", "rounded-3", "mx-2");
      (col.style.width = "100px"), (col.style.height = "100px");
          if (element.disponibilidad === "DISPONIBLE") {
              col.classList.add("bg-success")
          } else {
              col.classList.add("bg-body-secondary");
          }
          
      col.textContent = element.codigo_asiento;
        capaForm.appendChild(col);
        
          col.addEventListener("click", () => {
              contador++;

            if (contador > datos[0].numPersonas) {
                Swal.fire({
                    "title": "Error",
                    "text": "No puede seleccionar más asientos de la cantidad escogida",
                    "icon": "error"
                }
                )
                return;
              }
              console.log(datos)
            col.classList.remove("bg-success")
            col.classList.add("bg-primary")
          
           
        })
    });
  });
}
