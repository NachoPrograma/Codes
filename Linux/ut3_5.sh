

listarArchivos(){
    clear
    echo 'Esto es el listado de archivos de la ruta: '
    pwd
    echo 'Aquí tienes el arbol de archivos'
    tree
    read -n 1 -p "Pulsa una tecla para continuar ... "
}


crearDirectorio(){
    
    while [[ true ]]; do
        clear
        echo 'CREAR DIRECTORIOS'
        
        echo "Te encuentras en el directorio: " 
        pwd
        echo ''
        read -p "Escribe el nombre del directorio: " nombre
        if [[ $nombre != "" ]]; then
            read -n 1 -p "Has escrito $nombre. ¿Es correcto?[s/n]: " result
            if [[ $result == 's' || $result == 'S' ]]; then
                mkdir $nombre
                if [[ $? == 1 ]]; then
                    read -n 1 -p "Pulsa una tecla para volver a intentarlo ... "
                else
                    tree
                    echo "Directorio $nombre creado" 
                    read -n 1 -p "¿Deseas crear otro [s/n]?: " result
                    if [[ $result == 'n' || $result == 'N' ]]; then
                        break
                    fi
                fi
            fi
            
            
            
        else
            echo 'El nombre no puede estar vacio'
            read -n 1 -p "Pulsa enter para volver a intentarlo, s volver al menu ... " result
            if [[ $result == 's' || $result == 'S' ]]; then
                break
            fi
        fi
    done
}

while [[ true ]]; do
    clear
    echo 'DESARROLLO DE APLICACIONES MULTIPLATAFORMA'
    echo '1DAM Sistemas informáticos'
    echo "Programa realizado por: Rafa🍺"
    echo '________________________'
    echo ''
    echo '    ⚡MENU PRINCIPAL⚡'
    echo '________________________'
    echo '   ❶ Listar archivos'
    echo '   ❷ Crear un directorio'
    echo '   ❸ Crear un archivo'
    echo '   ❹ Mover un archivo'
    echo '   ❺ Salir'
    echo ''
    read -n 1 -p "Elige una opción ... 👀 " opcion
    
    if [[ $opcion == "1" ]]; then
        listarArchivos
    elif [[ $opcion == "2" ]]; then
        crearDirectorio
    elif [[ $opcion == 3 ]]; then
        echo ''
    elif [[ $opcion == 4 ]]; then
        echo ''
    elif [[ $opcion == 5 ]]; then
        echo ''
        read -n 1 -p "¿Realmente deseas salir? 💥" result
        if [[ $result == 's' || $result == 'S' ]]; then
            clear
            echo ''
            echo ''
            echo ''
            echo 'Gracias por usar nuestro programa 😍'
            echo 'HASTA PRONTO!👾'
            echo ''
            echo ''
            echo ''
            break
        fi
        
    fi
done
