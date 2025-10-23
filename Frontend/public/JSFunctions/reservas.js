import { getData } from "./requests.js"

getData(`/tickets/user/get:1`)
    .then(data => {
        console.log(data);
        const contenedorVuelos = document.getElementById('contenedorVuelos');

        data.result.forEach((element) => {
            let card = document.createElement("div");
            card.classList.add("card", "mb-3", "shadow-sm", "flight-card");

            let cardHeader = document.createElement("div");
            cardHeader.classList.add("card-header", "text-black", "d-flex", "justify-content-between", "align-items-center");

            let flightInfo = document.createElement("div");
            flightInfo.innerHTML = `<strong>Vuelo #${element.numero_vuelo}</strong>`;

            let statusBadge = document.createElement("span");
            statusBadge.classList.add("badge", "bg-light", "text-dark");
            statusBadge.textContent = "CONFIRMADO";

            cardHeader.appendChild(flightInfo);
            cardHeader.appendChild(statusBadge);

            let cardBody = document.createElement("div");
            cardBody.classList.add("card-body");

            let flightRow = document.createElement("div");
            flightRow.classList.add("row", "g-3");

            let originCol = document.createElement("div");
            originCol.classList.add("col-md-3", "text-center");
            originCol.innerHTML = `
                <div class="flight-city">${element.ciudad_origen}</div>
                <div class="flight-time">${element.hora_salida}</div>
                <div class="flight-date text-muted small">${new Date(element.fecha_salida).toLocaleDateString()}</div>
            `;

            let flightInfoCol = document.createElement("div");
            flightInfoCol.classList.add("col-md-6", "text-center");
            flightInfoCol.innerHTML = `
                <div class="flight-route mb-2">
                    <i class="fas fa-plane text-primary"></i>
                    <div class="flight-duration small text-muted mt-1">Duración estimada</div>
                </div>
                <div class="flight-code small text-muted">Código: ${element.codigo_reserva}</div>
            `;

            let destinationCol = document.createElement("div");
            destinationCol.classList.add("col-md-3", "text-center");
            destinationCol.innerHTML = `
                <div class="flight-city">${element.ciudad_destino}</div>
                <div class="flight-time">${element.hora_llegada}</div>
                <div class="flight-date text-muted small">${new Date(element.fecha_llegada).toLocaleDateString()}</div>
            `;

            flightRow.appendChild(originCol);
            flightRow.appendChild(flightInfoCol);
            flightRow.appendChild(destinationCol);

            let additionalInfo = document.createElement("div");
            additionalInfo.classList.add("row", "mt-3", "pt-3", "border-top");

            let infoCol1 = document.createElement("div");
            infoCol1.classList.add("col-md-6");
            infoCol1.innerHTML = `
                <small class="text-muted">
                    <i class="fas fa-chair me-1"></i> Asiento: ${element.codigo_asiento}
                </small><br>
                <small class="text-muted">
                    <i class="fas fa-layer-group me-1"></i> Clase: ${element.clase}
                </small>
            `;

            let infoCol2 = document.createElement("div");
            infoCol2.classList.add("col-md-6", "text-end");
            infoCol2.innerHTML = `
                <small class="text-muted">
                    <i class="fas fa-dollar-sign me-1"></i> Precio: $${element.valor}
                </small><br>
                <small class="text-muted">
                    <i class="fas fa-user me-1"></i> Pasajero: ${element.nombre_pasajero}
                </small>
            `;

            additionalInfo.appendChild(infoCol1);
            additionalInfo.appendChild(infoCol2);

            // BOTÓN VER TICKET - AHORA CON ENLACE DIRECTO
            let buttonContainer = document.createElement("div");
            buttonContainer.classList.add("row", "mt-3", "pt-3", "border-top");
            
            // Formatear fecha para el ticket
            const fechaFormateada = new Date(element.fecha_salida).toLocaleDateString('es-ES');
            
            buttonContainer.innerHTML = `
                <div class="col-12 text-center">
                    <a href="ticket-template.html?codigo=${element.codigo_reserva}&fecha=${fechaFormateada}&asiento=${element.codigo_asiento}&hora=${element.hora_salida.substring(0,5)}&pasajero=${encodeURIComponent(element.nombre_pasajero)}&origen=${element.ciudad_origen}&destino=${element.ciudad_destino}" 
                       class="btn btn-success" 
                       target="_blank">
                        <i class="fas fa-ticket-alt me-2"></i>Ver Ticket
                    </a>
                </div>
            `;

            cardBody.appendChild(flightRow);
            cardBody.appendChild(additionalInfo);
            cardBody.appendChild(buttonContainer);

            card.appendChild(cardHeader);
            card.appendChild(cardBody);
            contenedorVuelos.appendChild(card);
        });

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