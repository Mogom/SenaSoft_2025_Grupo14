import {getData} from "./requests.js"


getData(`/flights/get:1`)
  .then(data => {
    console.log(data); // JSON data parsed by `data.json()` call
});
