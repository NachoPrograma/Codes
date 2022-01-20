

echo '¿Deseas realizar la operación? [s/n]'
read resultado

if [[ $resultado == 's' ]]; then
    cd /
    mkdir 1damX
    cd 1damX
    mkdir ejercicios
    mkdir results
    cd ejercicios
    mkdir ut3_0
    cd ut3_0
    mkdir VEHICULOS
    mkdir BARCOS
    cd VEHICULOS
    mkdir 2RUEDAS
    mkdir 4RUEDAS
    cd 2RUEDAS
    mkdir BICI
    mkdir MOTO
    cd ..
    cd 4RUEDAS
    mkdir COCHE
    mkdir FURGONETA
    cd ../..
    cd BARCOS
    mkdir LANCHA
    mkdir VELEROS
    mkdir YATES
    echo 'Tarea ejecutada con exito'
    cd /1damX/
    tree
    cd /1damX/results
    touch ut3_0R.txt
    tree /1damX/ > ut3_0R.txt

    cd ~/Escritorio/github/1damX/results/ #aquí debe ir la ruta absoluta si no tienes permisos
    cp /1damX/results/ut3_0R.txt .
fi
