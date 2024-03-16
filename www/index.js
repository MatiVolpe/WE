function changeProductImage() {
    let color = document.getElementById('selec-color');
    let img = document.getElementById('imagen');

    opcion = color.value;
    if (opcion == 'grafito') {
        img.src = 'https://dcdn.mitiendanube.com/stores/002/026/619/products/1-bd38d3d3892427dd7916921340529067-640-0.jpg';
    } else if (opcion == 'sierra') {
        img.src = 'https://www.mink.com.ar/qloud/ryr/fotos/22241-0.jpg';
    } else if (opcion == 'silver') {
        img.src = 'https://front.dev.malditohard.com.ar/img/migration/APPLE--IPHONE-13-PRO-MAX-256GB-SILVER.webp';
    } else if (opcion == 'gold') {
        img.src = 'https://cdn-ipoint.waugi.com.ar/22532-large_default/iphone-13-pro-128gb-gold.jpg';
    }

}

function calculatePrice() {
    let capacidad = document.getElementById('selec-capacidad');
    let cantidad = document.getElementById('selec-cantidad');
    let resultado = document.getElementById('result');

    precioCapacidad = 0;
    if (capacidad.value == '128') {
        precioCapacidad = 150000;
    } else if (capacidad.value == '256') {
        precioCapacidad = 165000;
    } else if (capacidad.value == '512') {
        precioCapacidad = 180000;
    }
    cant = parseInt(cantidad.value);
    total = precioCapacidad * cant;
    resultado.textContent = "Precio Final: $" + total;


}

let cotiz = document.getElementById('botonCotizar');
cotiz.onclick = calculatePrice;