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

            // BOTÓN VER TICKET
            let buttonContainer = document.createElement("div");
            buttonContainer.classList.add("row", "mt-3", "pt-3", "border-top");
            buttonContainer.innerHTML = `
                <div class="col-12 text-center">
                    <button class="btn btn-success btn-ver-ticket" data-ticket-id="${element.ticket_id}">
                        <i class="fas fa-ticket-alt me-2"></i>Ver Ticket
                    </button>
                </div>
            `;

            cardBody.appendChild(flightRow);
            cardBody.appendChild(additionalInfo);
            cardBody.appendChild(buttonContainer);

            card.appendChild(cardHeader);
            card.appendChild(cardBody);
            contenedorVuelos.appendChild(card);
        });

        // Agregar event listeners a los botones
        document.querySelectorAll('.btn-ver-ticket').forEach(button => {
            button.addEventListener('click', function() {
                const ticketId = this.getAttribute('data-ticket-id');
                generarPDF(ticketId);
            });
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

// Función para generar PDF usando getData
async function generarPDF(ticketId) {
    try {
        // Mostrar loading
        mostrarLoading();
        
        // Usar getData para obtener el ticket específico
        const data = await getData(`/tickets/get:${ticketId}`);
        
        if (data.result && data.result.length > 0) {
            const ticket = data.result[0];
            crearPDF(ticket);
        } else {
            alert('No se encontró el ticket');
        }
    } catch (error) {
        console.error('Error al obtener el ticket:', error);
        alert('Error al generar el PDF');
    } finally {
        // Ocultar loading
        ocultarLoading();
    }
}

// Función para crear el PDF
function crearPDF(ticket) {
    if (typeof html2pdf === 'undefined') {
        const script = document.createElement('script');
        script.src = 'https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js';
        script.onload = () => generarPDFConHtml2pdf(ticket);
        document.head.appendChild(script);
    } else {
        generarPDFConHtml2pdf(ticket);
    }
}

function generarPDFConHtml2pdf(ticket) {
    // Formatear fechas
    const fechaSalida = new Date(ticket.fecha_salida).toLocaleDateString('es-ES');
    
    // Crear el HTML del ticket con un diseño más compatible
    const ticketHTML = `
        <!DOCTYPE html>
        <html>
        <head>
            <meta charset="UTF-8">
            <style>
                body {
                    margin: 0;
                    padding: 0;
                    font-family: Arial, sans-serif;
                    background: white;
                }
                .ticket {
                    width: 300px; /* Ajustado para un tamaño de ticket más realista */
                    border: 1px solid #000;
                    padding: 10px;
                    background: white;
                    margin: auto; /* Centrar el ticket */
                }
                .header {
                    text-align: center;
                    border-bottom: 2px solid #000;
                    padding-bottom: 5px;
                    margin-bottom: 10px;
                }
                .header h1 {
                    margin: 0;
                    font-size: 14px;
                    font-weight: bold;
                }
                .divider {
                    height: 2px;
                    background-color: #000;
                    margin: 5px 0;
                }
                .row {
                    overflow: hidden; /* Para que los elementos flotantes se comporten bien */
                    margin-bottom: 5px;
                }
                .column {
                    float: left;
                    width: 50%; /* Dos columnas */
                }
                .label {
                    font-weight: bold;
                    font-size: 10px;
                }
                .value {
                    font-size: 10px;
                }
                .airline {
                    text-align: center;
                    font-weight: bold;
                    font-size: 10px;
                    margin-top: 10px;
                }
                .name-section .label {
                    margin-bottom: 5px;
                }
                .name-section .value {
                    border-bottom: 1px solid #000;
                    padding-bottom: 5px;
                }
                .origin-dest {
                    overflow: hidden;
                    margin-top: 10px;
                    border-bottom: 2px solid #000;
                    padding-bottom: 10px;
                }
                .origin-dest .column {
                    text-align: center;
                }
            </style>
        </head>
        <body>
            <div class="ticket">
                <div class="header">
                    <div class="label">PASE DE ABORDAJE / BOARDING PASS</div>
                    <div class="divider"></div>
                </div>

                <div class="row">
                    <div class="column">
                        <div class="label">CÓDIGO</div>
                        <div class="value">${ticket.codigo_reserva}</div>
                    </div>
                    <div class="column">
                        <div class="label">FECHA / DATE</div>
                        <div class="value">${fechaSalida}</div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="column">
                        <div class="label">SILLA / SEAT</div>
                        <div class="value">${ticket.codigo_asiento}</div>
                    </div>
                    <div class="column">
                        <div class="label">HORA / TIME</div>
                        <div class="value">${ticket.hora_salida.substring(0, 5)}</div>
                    </div>
                </div>

                <div class="name-section">
                    <div class="label">NOMBRE DEL PASAJERO</div>
                    <div class="divider"></div>
                    <div class="value">${ticket.nombre_pasajero}</div>
                </div>

                <div class="origin-dest">
                    <div class="column">
                        <div class="label">ORIGEN / ORIGIN</div>
                        <div class="value">${ticket.ciudad_origen}</div>
                    </div>
                    <div class="column">
                        <div class="label">DESTINO / DESTINY</div>
                        <div class="value">${ticket.ciudad_destino}</div>
                    </div>
                </div>
                
                <div class="airline">
                    &lt;SENA/Soft&gt;<br>
                    AirLines
                </div>
            </div>
        </body>
        </html>
    `;

    // Configuración para html2pdf
    const options = {
        margin: [10, 10, 10, 10], // Margen en el PDF final
        filename: `ticket-${ticket.codigo_reserva}.pdf`,
        image: { type: 'jpeg', quality: 0.98 },
        html2canvas: { 
            scale: 2, // Ajusta la escala para mejor calidad sin ser excesiva
            useCORS: true,
            logging: false
        },
        jsPDF: { 
            unit: 'mm', 
            format: 'a6', 
            orientation: 'portrait'
        }
    };

    // Generar PDF
    html2pdf().from(ticketHTML).set(options).save();
}


// Funciones para mostrar/ocultar loading
function mostrarLoading() {
    let loadingDiv = document.getElementById('pdf-loading');
    if (!loadingDiv) {
        loadingDiv = document.createElement('div');
        loadingDiv.id = 'pdf-loading';
        loadingDiv.className = 'pdf-loading';
        loadingDiv.innerHTML = `
            <div class="pdf-loading-content">
                <div class="spinner-border text-success" role="status">
                    <span class="visually-hidden">Generando PDF...</span>
                </div>
                <p class="mt-2">Generando PDF...</p>
            </div>
        `;
        document.body.appendChild(loadingDiv);
    }
    loadingDiv.style.display = 'flex';
}

function ocultarLoading() {
    const loadingDiv = document.getElementById('pdf-loading');
    if (loadingDiv) {
        loadingDiv.style.display = 'none';
    }
}