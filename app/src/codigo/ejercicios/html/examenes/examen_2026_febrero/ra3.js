/*
 * Resolución de pantalla óptima: 1366x768
 * Este archivo contiene las funciones JavaScript para calcular el perímetro de un rectángulo.
 * Se carga externamente desde ra3.html
 */

// Función que se ejecuta cuando la página ha cargado completamente
document.addEventListener('DOMContentLoaded', function() {
    // Crear el párrafo con el texto "Cálculo del perímetro" en rojo y centrado
    var parrafo = document.createElement('p');
    parrafo.textContent = 'Cálculo del perímetro';
    parrafo.style.color = 'red';
    parrafo.style.textAlign = 'center';
    parrafo.style.marginTop = '20px';
    
    // Insertar el párrafo al final del body
    document.body.appendChild(parrafo);
    
    // Asignar el evento click al botón
    document.getElementById('calcular').addEventListener('click', calcularPerimetro);
});

// Función que calcula y muestra el perímetro del rectángulo
function calcularPerimetro() {
    // Obtener los valores de los campos de entrada
    var base = parseFloat(document.getElementById('base').value);
    var altura = parseFloat(document.getElementById('altura').value);
    
    // Validar que los valores sean números válidos
    if (isNaN(base) || isNaN(altura) || base <= 0 || altura <= 0) {
        alert('Por favor, introduce valores numéricos válidos mayores que cero.');
        return;
    }
    
    // Calcular el perímetro: 2 * (base + altura)
    var perimetro = 2 * (base + altura);
    
    // Mostrar el resultado en una ventana emergente (alert)
    alert('El rectángulo con base: ' + base + ' y altura: ' + altura + ' tiene como perímetro: ' + perimetro);
}