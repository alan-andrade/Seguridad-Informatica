# Algoritmos de cifrado

## PlayFair
Es el algoritmo en desarrollo.

### IMPORTANTE
La matrix que se usa para este algoritmo es del siguiente tipo.
`[ [5 pos],[ 5 pos ],[ .. ],[ .. ],[ .. ] ]`

Al momento de tomar las coordenadas, naturalmente comenzamos con la 'x' y despues 'y'. Para esta solucion es
diferente. Se comienza con la 'y' y luego con la 'x'.

* Ejemplo *
(arreglo de 3 x 3)

` [ ['g', 'a', 'l'],

    ['o', 'b', 'c'],
    
    ['d', 'e', 'f'] ] `

La posicion de la letra 'g' seria. y=0, x=0.
Y es hacia abajo arriba.
X es hacia la derecha izquierda.

La posicion de 'c' seria.
y=1
x=c

## DES
Aun esta en planeacion.

## Para correrlo.

`require './algorithms.rb'

Algorithms::Playfair.encrypt('lucy in the sky with diamonds', 'monarchy')`
