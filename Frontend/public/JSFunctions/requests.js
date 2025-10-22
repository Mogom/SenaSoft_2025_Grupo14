// Funcion global para ejecutar metodos POST:
const config ={
    "api-key":"vuelos-x-api-key",
    "port":"http://localhost:3000"
}

export async function postData(url = '', data = {}) {
  const response = await fetch(config.port+url, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'x-api-key': config["api-key"]
    },
    redirect: 'follow', // manual, *follow, error
    referrerPolicy: 'no-referrer', // no-referrer, *no-referrer-when-downgrade, origin, origin-when-cross-origin, same-origin, strict-origin, strict-origin-when-cross-origin, unsafe-url
    body: JSON.stringify(data) // body data type must match "Content-Type" header
  });
  return response.json(); // parses JSON response into native JavaScript objects
}

export async function getData(url = '') {
  const response = await fetch(config.port+url, {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json',
      'x-api-key': config["api-key"]
    },
  });
  return response.json(); // parses JSON response into native JavaScript objects
}

// getData('http://localhost:3000/flights/get:1')
//   .then(data => {
//     console.log(data); // JSON data parsed by `data.json()` call
// });

// postData('http://localhost:3000/users', { answer: 42 })
//   .then(data => {
//     console.log(data); // JSON data parsed by `data.json()` call
//   });


