menuPrincipal(){
    while [[ true ]]; do
        clear
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
            echo ''
            read  -p "Deseas salir?[s/n] " opcion
            if [[ ${opcion,,} == 's' ]]; then
                clear
                echo ''
                echo 'Hasta la vista'
                echo ''
                break;
            fi
        fi
        
        
    done
    
   
}

menuMover(){
    while [[ true ]]; do
        clear
        echo '1.Mover archivo'
        echo '2.Mover directorio'
        echo '3.Volver'
        echo ''
        read -n 1 -p "Elige una opción: " opcion
        if [[ $opcion == '1' ]]; then
            echo 'TODO'
        elif [[ $opcion == '2' ]]; then
            bash "$HOME/repositorios/1damX/linux/UT3_10_/moverDirectorio.sh" $rutaPermitida
        elif [[ $opcion == '3' ]]; then
            break;
        fi
        
        
    done
}

comprobarRutaInicial(){
    cd $rutaPermitida
    acceso=$?
    if [[ $acceso == 1 ]];then
        clear
        echo 'NO TIENES ACCESO ⛔️'
        echo 'No dispones de la ruta permitida'
        echo "RUTA PERMITIDA: $rutaPermitida"
    else
        menuPrincipal
    fi
}


# INICIALIZACION DE VARIBALES
rutaPermitida="$HOME/ejercicios/rut3_0/rootX/"
rutaOrigen=''
rutaDestino=''

comprobarRutaInicial
