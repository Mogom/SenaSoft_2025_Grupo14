const userdataJson = localStorage.getItem("vueloData");
if (userdataJson) {
  const datos = JSON.parse(userdataJson);
  let capaForm = document.querySelector("#capaForm");
  let form = document.createElement("form");
  form.classList.add("row");
  console.log(datos.id);
  console.log(datos.numPersonas);
  // Formulario
  for (let i = 0; i < datos.numPersonas; i++) {
    let col = document.createElement("div");
    col.classList.add("col-sm-2", "mx-auto");
    let titulo = document.createElement("h2");
    titulo.classList.add("fw-bold", "mb-2");
    titulo.textContent = "Persona: " + (i + 1);
    col.appendChild(titulo);
    crearCampos(
      "Primer apellido",
      "form-control",
      "text",
      col,
      "primer_apellido" + (i + 1)
    );
    crearCampos(
      "Segundo apellido",
      "form-control",
      "text",
      col,
      "segundo_apellido" + (i + 1)
    );
    crearCampos("Nombres", "form-control", "text", col, "nombres" + (i + 1));
    crearCampos(
      "Fecha de nacimiento",
      "form-control",
      "date",
      col,
      "fecha_nacimiento" + (i + 1)
    );
    crearSelect(
      "Genero",
      "form-select",
      col,
      "genero" + (i + 1),
      "M",
      "Masculino",
      "F",
      "Feminino"
    );
    crearSelect(
      "Tipo de documento",
      "form-select",
      col,
      "tipo_documento" + (i + 1),
      "CC",
      "CC",
      "TI",
      "TI"
    );
    crearCampos(
      "Telefono",
      "form-control",
      "number",
      col,
      "telefono" + (i + 1)
    );
    crearCampos("Correo", "form-control", "email", col, "correo" + (i + 1));
    crearCampoRol("form-control", "hidden", col, "rol", "Cliente" + (i + 1));

    crearSelect(
      "Condicion de infante (menor a 3 años)",
      "form-select",
      col,
      "condicion_infante" + (i + 1),
      "No",
      "No",
      "Si",
      "Si"
    );

    form.appendChild(col);
    capaForm.appendChild(form);
  }

  // Btn enviar
  let btnEnviar = document.createElement("button");
  btnEnviar.classList.add("btn", "btn-primary", "w-25", "btn-enviar");
  btnEnviar.textContent = "Enviar";
  let col = document.createElement("div");
  col.classList.add("col-sm-12", "mt-4", "text-center");
  col.appendChild(btnEnviar);
  form.appendChild(col);

  // Evento del boton
  btnEnviar.addEventListener("click", (e) => {
    e.preventDefault();
    for (let i = 0; i < datos.numPersonas; i++) {
      let primer_apellido = document.querySelector(
        "#primer_apellido" + (i + 1)
      ).value;
      let segundo_apellido = document.querySelector(
        "#segundo_apellido" + (i + 1)
      ).value;
      let nombres = document.querySelector("#nombres" + (i + 1)).value;
      let fecha_nacimiento = document.querySelector(
        "#fecha_nacimiento" + (i + 1)
      ).value;
      let genero = document.querySelector("#genero" + (i + 1)).value;
      let tipo_documento = document.querySelector(
        "#tipo_documento" + (i + 1)
      ).value;
      let telefono = document.querySelector("#telefono" + (i + 1)).value;
        let correo = document.querySelector("#correo" + (i + 1)).value;
        let condicion_infante = document.querySelector("#condicion_infante" + (i + 1)).value;
    }
  });
}

function crearCampos(contLabel, claseInput, tipoInput, capa, idInput) {
  let label = document.createElement("label");
  label.classList.add("form-label", "my-1");
  label.textContent = contLabel;
  let input = document.createElement("input");
  input.classList.add(claseInput);
  input.setAttribute("type", tipoInput);
  input.setAttribute("id", idInput);
  capa.appendChild(label);
  capa.appendChild(input);
}
function crearCampoRol(claseInput, tipoInput, capa, idInput, value) {
  let input = document.createElement("input");
  input.classList.add(claseInput);
  input.setAttribute("type", tipoInput);
  input.setAttribute("id", idInput);
  input.setAttribute("value", value);
  capa.appendChild(input);
}

function crearSelect(
  contLabel,
  claseInput,
  capa,
  idInput,
  valueOpcion1,
  contOpcion1,
  valueOpcion2,
  contOpcion2
) {
  let label = document.createElement("label");
  label.classList.add("form-label", "mt-3");
  label.textContent = contLabel;
  let select = document.createElement("select");
  select.classList.add(claseInput);
  select.setAttribute("id", idInput);
  let opcionMasculino = document.createElement("option");
  opcionMasculino.setAttribute("value", valueOpcion1);
  opcionMasculino.textContent = contOpcion1;
  select.appendChild(opcionMasculino);

  let opcionFemenino = document.createElement("option");
  opcionFemenino.setAttribute("value", valueOpcion2);
  opcionFemenino.textContent = contOpcion2;
  select.appendChild(opcionFemenino);

  capa.appendChild(label);
  capa.appendChild(select);
}
