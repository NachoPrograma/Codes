
cabecera(){
    clear
    echo '########### PROGRAMA UT3_9 ##########'
    echo 'IES Las Salinas'
    echo 'Desarrollo de Aplicaciones multiplataforma'
    echo 'Sistemas informaticos' 
    echo ''
}


menuPrincipal(){
    while [[ true ]]; do
        cabecera
        echo '1.Mover'
        echo '2.Renombrar'
        echo '3.Buscar'
        echo '4.Salir'
        echo ''
        read -n 1 -p "Elige una opción: " opcion
        if [[ $opcion == '1' ]]; then
            menuMover
        elif [[ $opcion == '2' ]]; then
            echo 'TODO'
        elif [[ $opcion == '3' ]]; then
            echo 'TODO'
        elif [[ $opcion == '4' ]]; then
            read -n 1 -p "Realmente deseas salir?[s/n] " opcion
            if [[ $opcion == 's' || $opcion == 'S' ]]; then
                break
            fi
        fi
    done
}

menuMover(){
    while [[ true ]]; do
        cabecera
        echo '1.Mover archivo'
        echo '2.Mover directorio'
        echo '3.Volver'
        echo ''
        read -n 1 -p "Elige una opción: " opcion
        if [[ $opcion == '1' ]]; then
            echo 'TODO'
        elif [[ $opcion == '2' ]]; then
            moverDirectorio
        elif [[ $opcion == '3' ]]; then
            break
        fi
    done
}




moverDirectorio(){
    cd $rutaPermitida
    pedirRutaOrigen
    pedirRutaDestino
    mv $rutaOrigen $rutaDestino
    result=$?
    if [[ $result == 0 ]]; then
        cd $rutaPermitida
        cabecera
        tree
        echo "El directorio $rutaOrigen fue movido a $rutaDestino correctamente "
        read -n 1 -p "Pulse una tecla para volver al menu... "
    fi
}

pedirRutaOrigen(){
    while [[ true ]]; do
        cabecera
        tree
        echo 'Indica la ruta'
        read -p "RUTA ORIGEN: $rutaPermitida" ruta      
        comprobarRutaOrigen $ruta
        result=$?
        if [[ $result == 1 ]]; then
            read -n 1 -p "Pulsa una tecla para volver a intentarlo ..."
        else
            rutaOrigen=$rutaPermitida$ruta
            break
        fi
    done
}

pedirRutaDestino(){
    while [[ true ]]; do
        read -p "RUTA DESTINO: $rutaPermitida" ruta
        comprobarRutaDestino $ruta
        result=$?
        if [[ $result == 1 ]]; then
            read -n 1 -p "Pulsa una tecla para volver a intentarlo ..."
        else
            rutaDestino=$rutaPermitida$ruta
            break
        fi
    done

}


comprobarRutaOrigen(){
    ruta=$1
    if [[ $ruta == "" ]]; then
        echo "Debes poner una ruta"
        return 1
    elif [[ $ruta == *"."* ]]; then
        echo "La ruta no puede contener puntos"
        return 1
    elif [[ $ruta == *"/" ]]; then
        echo "La ruta del directorio no puede terminar en /"
        return 1
    fi
    
    cd $rutaPermitida$ruta
    result=$?
    if [[ $result == 1 ]]; then
        echo "La ruta indicada no existe"
        return 1
    fi
    return 0
}

comprobarRutaDestino(){
    ruta=$1
    rutaFiltrada=${ruta//,}
    rutaFiltrada=${rutaFiltrada//.}
    directorio=${rutaOrigen//*\/}
    if [[ $ruta == "" ]]; then
        echo "Debes poner una ruta"
        return 1
    elif ! [[ $ruta == *"/" ]]; then
        echo "Por favor, indica el cierre del directorio con /"
        return 1
    elif ! [[ $rutaFiltrada == $ruta ]]; then
        if ! [[ $ruta == "./"* || $ruta == "../"* ]]; then
            echo "La ruta no puede contener los caracteres , o ."
            return 1
        else
            echo ''
        fi
    fi
    
    cd $rutaPermitida$ruta$directorio
    result=$?
    if [[ $result == 0 ]]; then
        echo "La ruta de destino ya contiene un directorio con el nombre $Directorio"
        return 1
    fi
    
    cd $rutaPermitida$ruta
    result=$?
    if [[ $result == 1 ]]; then
        echo "La ruta indicada no existe"
        read -n 1 -p "¿Deseas crearla?[s/n]" opcion
        if [[ $opcion == 's' || $opcion == 'S' ]]; then
            mkdir -p $rutaPermitida$ruta
            return 0
        else
            return 1
        fi
    fi
    return 0
}


comprobarRutaInicial(){
    cd $rutaPermitida
    acceso=$?
    if [[ $acceso == 1 ]]; then
        clear
        echo '         ⚠️ ADVERTENCIA ⚠️'
        echo 'No puedes ejecutar este programa'
        echo 'No dispones de la ruta permitida'
        echo "RUTA PERMITIDA: $rutaPermitida "
        echo ''
        read -n 1  -p "Pulsa una tecla para finalizar .."
        echo ''
    else
        menuPrincipal
    fi
}

rutaPermitida="$HOME/ejercicios/rut3_0/rootX/"
rutaOrigen=''
rutaDestino=''

comprobarRutaInicial
