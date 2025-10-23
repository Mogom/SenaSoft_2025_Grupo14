import { getData } from "./requests.js"

getData(`/tickets/receipt/get:1`)
    .then(data => {
        console.log(data); // JSON data parsed by `data.json()` call
        const contenedorVuelos = document.getElementById('contenedorVuelos');

        data.result.forEach((element) => {
            // Crear tarjeta simple
            let card = document.createElement("div");
            card.classList.add("card", "mb-3", "border-0", "shadow");
            
            // Header con verde oscuro
            let cardHeader = document.createElement("div");
            cardHeader.classList.add("card-header", "bg-success", "text-white", "py-2");
            cardHeader.innerHTML = `
                <div class="d-flex justify-content-between align-items-center">
                    <strong>Recibo #${element.id}</strong>
                    <span class="badge bg-light text-dark">${element.metodo_pago}</span>
                </div>
            `;

            // Cuerpo de la tarjeta
            let cardBody = document.createElement("div");
            cardBody.classList.add("card-body", "p-3");
            
            // Información principal
            let mainInfo = document.createElement("div");
            mainInfo.classList.add("row", "mb-2");
            mainInfo.innerHTML = `
                <div class="col-6">
                    <small class="text-muted">Total Pagado:</small>
                    <div class="fw-bold text-success">$${element.total}</div>
                </div>
                <div class="col-6">
                    <small class="text-muted">Asientos:</small>
                    <div class="fw-bold">${element.numero_asientos}</div>
                </div>
            `;

            // Información secundaria
            let secondaryInfo = document.createElement("div");
            secondaryInfo.classList.add("row", "text-muted", "small");
            secondaryInfo.innerHTML = `
                <div class="col-6">
                    <i class="fas fa-calendar me-1"></i>
                    ${new Date(element.fecha).toLocaleDateString()}
                </div>
                <div class="col-6 text-end">
                    <i class="fas fa-clock me-1"></i>
                    ${element.hora}
                </div>
            `;


            // Agregar elementos al cuerpo
            cardBody.appendChild(mainInfo);
            cardBody.appendChild(secondaryInfo);

            // Agregar header y body a la tarjeta
            card.appendChild(cardHeader);
            card.appendChild(cardBody);

            // Agregar la tarjeta al contenedor
            contenedorVuelos.appendChild(card);
        });

        // Si no hay recibos, mostrar mensaje
        if (data.result.length === 0) {
            contenedorVuelos.innerHTML = `
                <div class="alert alert-info text-center">
                    <i class="fas fa-receipt fa-2x mb-3"></i>
                    <h5>No tienes recibos</h5>
                    <p class="mb-0">No se encontraron recibos de pago.</p>
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
                <h5>Error al cargar los recibos</h5>
                <p class="mb-0">Por favor, intenta nuevamente más tarde.</p>
            </div>
        `;
    });