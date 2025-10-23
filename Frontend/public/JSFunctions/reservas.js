import { getData } from "./requests.js"

getData(`/tickets/user/get:1`)
    .then(data => {
        console.log(data); // JSON data parsed by `data.json()` call
        const contenedorVuelos = document.getElementById('contenedorVuelos');

        data.result.forEach((element) => {
            // Crear el contenedor principal de la tarjeta de vuelo
            let card = document.createElement("div");
            card.classList.add("card", "mb-3", "shadow-sm", "flight-card");

            // Crear el header de la tarjeta
            let cardHeader = document.createElement("div");
            cardHeader.classList.add("card-header", "text-black", "d-flex", "justify-content-between", "align-items-center");

            let flightInfo = document.createElement("div");
            flightInfo.innerHTML = `<strong>Vuelo #${element.numero_vuelo || element.id}</strong>`;

            let statusBadge = document.createElement("span");
            statusBadge.classList.add("badge", "bg-light", "text-dark");
            statusBadge.textContent = element.estado_reserva || "CONFIRMADO";

            cardHeader.appendChild(flightInfo);
            cardHeader.appendChild(statusBadge);

            // Crear el cuerpo de la tarjeta
            let cardBody = document.createElement("div");
            cardBody.classList.add("card-body");

            // Crear fila para la información del vuelo
            let flightRow = document.createElement("div");
            flightRow.classList.add("row", "g-3");

            // Columna izquierda - Origen
            let originCol = document.createElement("div");
            originCol.classList.add("col-md-3", "text-center");
            originCol.innerHTML = `
        <div class="flight-city">${element.ciudad_origen}</div>
        <div class="flight-time">${element.hora_salida}</div>
        <div class="flight-date text-muted small">${new Date(element.fecha_salida).toLocaleDateString()}</div>
      `;

            // Columna central - Información del vuelo
            let flightInfoCol = document.createElement("div");
            flightInfoCol.classList.add("col-md-6", "text-center");
            flightInfoCol.innerHTML = `
        <div class="flight-route mb-2">
          <i class="fas fa-plane text-primary"></i>
          <div class="flight-duration small text-muted mt-1">Duración estimada</div>
        </div>
        <div class="flight-code small text-muted">Código: ${element.codigo_reserva || 'N/A'}</div>
      `;

            // Columna derecha - Destino
            let destinationCol = document.createElement("div");
            destinationCol.classList.add("col-md-3", "text-center");
            destinationCol.innerHTML = `
        <div class="flight-city">${element.ciudad_destino}</div>
        <div class="flight-time">${element.hora_llegada}</div>
        <div class="flight-date text-muted small">${new Date(element.fecha_llegada).toLocaleDateString()}</div>
      `;

            // Agregar columnas a la fila
            flightRow.appendChild(originCol);
            flightRow.appendChild(flightInfoCol);
            flightRow.appendChild(destinationCol);

            // Información adicional
            let additionalInfo = document.createElement("div");
            additionalInfo.classList.add("row", "mt-3", "pt-3", "border-top");

            let infoCol1 = document.createElement("div");
            infoCol1.classList.add("col-md-6");
            infoCol1.innerHTML = `
        <small class="text-muted">
          <i class="fas fa-chair me-1"></i> Asiento: ${element.codigo_asiento || 'N/A'}
        </small><br>
        <small class="text-muted">
          <i class="fas fa-layer-group me-1"></i> Clase: ${element.clase || 'ECONOMICA'}
        </small>
      `;

            let infoCol2 = document.createElement("div");
            infoCol2.classList.add("col-md-6", "text-end");
            infoCol2.innerHTML = `
        <small class="text-muted">
          <i class="fas fa-dollar-sign me-1"></i> Precio: $${element.valor || element.monto_pago || '0'}
        </small><br>
        <small class="text-muted">
          <i class="fas fa-user me-1"></i> Pasajero: ${element.nombres || 'N/A'}
        </small>
      `;

            additionalInfo.appendChild(infoCol1);
            additionalInfo.appendChild(infoCol2);

            // Agregar todo al cuerpo de la tarjeta
            cardBody.appendChild(flightRow);
            cardBody.appendChild(additionalInfo);

            // Agregar header y body a la tarjeta
            card.appendChild(cardHeader);
            card.appendChild(cardBody);

            // Agregar la tarjeta al contenedor
            contenedorVuelos.appendChild(card);
        });

        // Si no hay vuelos, mostrar mensaje
        if (data.result.length === 0) {
            contenedorVuelos.innerHTML = `
        <div class="alert alert-info text-center">
          <i class="fas fa-plane-slash fa-2x mb-3"></i>
          <h5>No tienes vuelos reservados</h5>
          <p class="mb-0">Comienza explorando y reservando tu próximo viaje.</p>
        </div>
      `;
        }
    })
    .catch(error => {
        console.error('Error:', error);
        const contenedorVuelos = document.getElementById('contenedorVuelos');
        contenedorVuelos.innerHTML = `
      <div class="alert alert-danger text-center">
        <i class="fas fa-exclamation-triangle fa-2x mb-3"></i>
        <h5>Error al cargar los vuelos</h5>
        <p class="mb-0">Por favor, intenta nuevamente más tarde.</p>
      </div>
    `;
    });