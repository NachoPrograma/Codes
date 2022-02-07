
#Definicion de variables globales (Acceso desde caulquier sitio)
usuario='Invitado'
fallos=0
aciertos=0

#Método para mostrar la cabecera del programa
cabecera(){
    clear
    echo "#########################"
    echo " 📙️   EL GRAN TEST   🖊️ "
    echo "#########################"
    echo "### Usuario: $usuario ###"
    echo ''
}

#Metodo para pedir el nombre de usuario, y saludo
pedirNombre(){
    cabecera "Invitado"
    read -p "Dime tu nombre: " nombre
    
    #Pequeña validacion por si no se escribe nada (queda Invitado por defecto)
    if [[ $nombre != "" ]]; then
        usuario=$nombre
    fi
    clear
    echo ''
    echo "Hola $usuario, espero te diviertas"
    echo ""
    read -n 1 -p "Pulsa una tecla para ir al menú principal... "
}

#Metodo que muestra la pregunta segun el argumento de entrada (numero de pregunta)
pregunta(){

    numeroPregunta=$1
    while [[ true ]]; do
        clear
        echo "                                          Pregunta $numeroPregunta / 5"
        echo ''
        #Se forma la ruta del archivo que contiene la pregunta
        preguntaPath="./preguntas/p$numeroPregunta.txt"
        cat $preguntaPath #Se muestra el archivo segun hemos definido en preguntaPath
        echo ''
        read -n 1 -p "Respuesta: " respuesta
        if [[ $respuesta == 'a' || $respuesta == 'b' || $respuesta == 'c' || $respuesta == 'd' ]]; then
            echo ''
            read -n 1 -p "Has elegido la opción: $respuesta -- ¿Continuar? [s/n]" opcion
            if [[ $opcion == 's' || $opcion == 'S' ]]; then
                break
            fi
        fi
    done
    
    # Dado que los return solo retornan un numero, debemos crear estos condicionales
    # para hacer una equivalencia entre letras y numeros, y asi poder retornar algo
    # que nos sea util despues
    if [[ $respuesta == 'a' ]]; then
        return 1
    elif [[ $respuesta == 'b' ]]; then
        return 2
    elif [[ $respuesta == 'c' ]]; then
        return 3
    elif [[ $respuesta == 'd' ]]; then
        return 4
    fi
    
}

# Comprobar respuestas. Se pasa como primer argumento la respuesta de usuario
# y como segundo argumento la respuesta correcta para poder hacer una comparativa
# Dado que las variables aciertos y fallos son globales, accedemos directamente.
checkRespuesta(){
   respuestaUsuario=$1
   respuestaCorrecta=$2
   
   if [[ $respuestaUsuario == $respuestaCorrecta ]]; then
        aciertos=$((aciertos+1))
    else
        fallos=$((fallos+1))
    fi
}

# Metodo para realizar la correcion del examen.
# Contiene las respuetas correctas.
# Informamos al usuario de su resultado y los guardamos en un archivo 
comprobar(){
    cabecera
    
    # Variables respuestas correctas 
    r1=1
    r2=4
    r3=4
    r4=3
    r5=3
    
    # Llamada a los metodos para comprobar la respuestas
    checkRespuesta $1 $r1
    checkRespuesta $2 $r2
    checkRespuesta $3 $r3
    checkRespuesta $4 $r4
    checkRespuesta $5 $r5
    
    echo ''
    #Creamos el archivo con el nombre de usuario.
    # En caso de existir el archivo, el metodo touch no lo crea de nuevo
    # Lo que permite seguir guardando registros
    archivo="respuestas/"$nombre".txt"
    touch $archivo
    echo '' >> $archivo
    date >> $archivo
    echo 'TUS RESULTADOS' >> $archivo
    echo "FALLOS:   $fallos" >> $archivo
    echo "ACIERTOS: $aciertos" >> $archivo
    echo '' >> $archivo
    cat $archivo
    read -n 1 -p "Pulsa una tecla para volver al menu... "
}

# Metodo para mostrar una despedida personalizada al nombre
despedida(){
    clear
    echo ''
    echo "Espero que hayas divertido con este programa $usuario"
    echo 'Vuelve cuando quieras'
    echo ''
}

# Metodo que contiene la secuencia que se debe seguir para realizar el test
iniciarTest(){
  
    pregunta "1"
    r1=$?
    pregunta "2"
    r2=$?
    pregunta "3"
    r3=$?
    pregunta "4"
    r4=$?
    pregunta "5"
    r5=$?
    
    # Llamada al metodo que se encarga de corregir el test
    # Se pasa como argumentos las respuestas que se han dado
    comprobar $r1 $r2 $3 $4 $5
    
}

# Metodo para consultar el resultado de los test según usuario
consultar(){
    clear
    cabecera
    echo ''
    echo 'Ultimos resultados del test'
    echo ''
    if [[ -f "./respuestas/"$usuario".txt" ]]; then
        cat "./respuestas/"$usuario".txt"
    else
        echo "No constan datos del usuario $usuario"
    fi
    read -n 1 -p "Pulsa una tecla para volver al menú... "
}

# Metodo que muestra el menu principal del programa
menu(){
    while [[ true ]]; do
        cabecera
        echo ''
        echo '1. Empezar'
        echo '2. Consular'
        echo '3. Salir'
        echo ''
        read -n 1 -p "Elige una opción.. " opcion
        if [[ $opcion == '1' ]]; then
            iniciarTest
        elif [[ $opcion == '2' ]]; then
            consultar
        elif [[ $opcion == '3' ]]; then
            echo ''
            read -n 1 -p "¿Realmente quieres abandonar el programa?[s/n]: " respuesta
            if [[ $respuesta == 's' || $respuesta == 'S' ]]; then
                despedida
                break;
            fi
        fi
    done
}

# Metodo que nos sirve para el inicio del programa
# Primero pide el nombre de usuario
# Segundo muestra el menu
iniciar(){
    pedirNombre
    menu
}

# Llamada al metodo iniciar
iniciar

