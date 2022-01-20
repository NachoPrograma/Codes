
e00(){
    echo 'Estas en el metodo e00'
    touch /1damX/ejercicios/ut3_0/VEHICULOS/4RUEDAS/COCHE/ut3_3.txt
    echo "Una frase cualquiera" > /1damX/ejercicios/ut3_0/VEHICULOS/4RUEDAS/COCHE/ut3_3.txt    
    mkdir /1damX/ejercicios/ut3_3
    cp /1damX/ejercicios/ut3_0/VEHICULOS/4RUEDAS/COCHE/ut3_3.txt /1damX/ejercicios/ut3_3/ut3_3cp.txt
    touch /1damX/results/ut3_3R.txt
    tree /1damX/ejercicios/ut3_0 > /1damX/results/ut3_3R.txt
    tree /1damX/ejercicios/ut3_3 >> /1damX/results/ut3_3R.txt
    cp /1damX/results/ut3_3R.txt /home/rafa/Escritorio/github/1damX/results/ut3_3R.txt
    git add -A
    git commit -m "Ejercicio 3_3"
    git push
 
}

salir=0
while [[ $salir == 0 ]]; do
    clear
    printf "¿Quieres ejecutar el script?[s/n]:"
    read -r result

    if [[ $result == 's' || $result == 'S' ]]; then
        echo "Has pulsado s"
        e00
        break;

    elif [[ $result == 'n' || $result == 'N' ]]; then
        echo "Has pulsado n o N"
        
        while [[ true ]]; do
            printf "¿Realmente quieres salir?[s/n]:"
            read -r result2
            if [[ $result2 == 's' || $result2 == 'S' ]]; then
                echo "has pulsado s S"
                salir=1
                clear
                echo "Gracias por usar nuestros servicios"
                break
            elif [[ $result2 == 'n' || $result2 == 'N' ]]; then
                echo "has pulsado n N"
                break
            else
                clear
                echo "No es valido. Has pulsado:" $result2
            fi #fin pregunta 2
        done #fin segundo while
        
        
    else 
        echo "No coincide con ninguna opcion"
    fi #fin del primer if

done #fin del while


