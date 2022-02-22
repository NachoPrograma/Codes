comprobarRutaOrigen(){
    ruta=$1
    if [[ $ruta == "" ]]; then
        echo 'Tienes que escribir algo'
        return 1
    elif [[ $ruta == *"."* ]]; then
        echo 'El directorio no puede tener una extension'
        return 1
    elif [[ $ruta == *"/" ]]; then
        echo 'El directorio no puede terminar en /'
        return 1
    fi
    
    cd $rutaPermitida$ruta
    result=$?
    if [[ $result == 1 ]]; then
        clear
        echo 'El directorio no existe'
        return 1
    fi
    
    return 0
    
    
}


pedirRutaOrigen(){
    while [[ true ]]; do
        tree
        echo 'Indica una ruta'
        read -p "RUTA ORIGEN: $rutaPermitida" ruta
        comprobarRutaOrigen $ruta
        retorno=$?
        if [[ $retorno == 1 ]]; then
            read -n 1 -p "Pulsa una tecla para volver a intentarlo"
        else
            rutaOrigen=$ruta
            break
        fi
    done
}


comprobarRutaDestino(){
    ruta=$1
    rutaFiltrada=${ruta//.}
    rutaFiltrada=${rutaFiltrada//,}
    
    directorio=${rutaOrigen//*\/}
    
    if [[ $ruta == "" ]]; then
        echo 'Tienes que escribir algo'
        return 1
    elif ! [[ $ruta == *"/" ]]; then
        echo 'El directorio tiene que terminar en /'
        return 1
    elif ! [[ $ruta == $rutaFiltrada ]]; then
        if ! [[ $ruta == "./"* || $ruta == "../"* ]]; then
            echo 'La ruta no puede contener . o ,'
            return 1
        fi
        
    fi
    
    cd $rutaPermitida$ruta$directorio
    result=$?
    if [[ $result == 0 ]]; then
        echo 'El directorio ya existe en el destino'
        return 1
    fi
    
    cd $rutaPermitida$ruta
    result=$?
    if [[ $result == 1 ]]; then
        echo 'La ruta no existe'
        read -n 1 -p "Deseas crear esta ruta? [s/n]" opcion
        if [[ ${opcion,,} == 's' ]]; then
            mkdir $rutaPermitida$ruta
        fi
        
    fi
    
}

pedirRutaDestino(){
    while [[ true ]]; do
        echo 'Indica una ruta'
        read -p "RUTA DESTINO: $rutaPermitida" ruta
        comprobarRutaDestino $ruta
        retorno=$?
        if [[ $retorno == 1 ]]; then
            read -n 1 -p "Pulsa una tecla para volver a intentarlo"
        else
            rutaDestino=$ruta
            break
        fi
    done
}


moverDirectorio(){
    clear
    cd $rutaPermitida
    pedirRutaOrigen
    pedirRutaDestino
    mv $rutaPermitida$rutaOrigen $rutaPermitida$rutaDestino
    result=$?
    echo "$rutaOrigen"
    echo "$rutaDestino"
    read
    if [[ $result == 0 ]]; then
        cd $rutaPermitida
        tree
        echo "El directorio $rutaOrigen fue movido a $ruta destino"
        echo ''
        read -n 1 -p "Pulsa una tecla para continuar"
    fi

}

# INICIALIZACION DE VARIBALES
rutaPermitida=$1
rutaOrigen=''
rutaDestino=''

moverDirectorio

