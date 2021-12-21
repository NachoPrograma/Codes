<#  IES Las Salinas Seseña
    DESARROLLO DE APLICACIONES MULTIPLATAFORMA
    Modulo: Sistemas Informaticos
    MANEJO DE FUNCIONES
#>

# Funcion simple. Esta funcion ejecuta las acciones que se encuentran entre llaves, cuando es llamada
function saludo1 ()
{
    Write-Host "Hola" # Se ejecuta cuando se llama a la funcion saludo1
}

saludo1 # LLamada a la funcion


#Funcion con 1 argumento de entrada
function saludo2 ($nombre)
{
    Write-Host "Hola" $nombre  # Se ejecuta cuando se llama a la funcion saludo2
}

saludo2("Rafa") # Llamada a la funcion saludo2 con el argumento de entrada "Rafa"