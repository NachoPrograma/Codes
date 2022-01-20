<#  IES Las Salinas Seseña
    DESARROLLO DE APLICACIONES MULTIPLATAFORMA
    Modulo: Sistemas Informaticos
    WRITE-HOST
#>
Write-Host ""
Write-Host ""
Clear-Host

Write-Host ""
Write-Host "Ejemplo simple Write-Host" -ForegroundColor Blue -BackgroundColor Yellow
# Ejemplo basico de uso de Write-Host
Write-Host "Hola que tal. "
Write-Host "Nuevo texto"

Write-Host ""
Write-Host "-NoNewline. Para evitar un salto de linea" -ForegroundColor Blue -BackgroundColor Yellow
# -NoNewline Escribir en la consola sin agregar una nueva linea
Write-Host "Esto es una prueba. " -NoNewline
Write-Host "Nuevo texto"


Write-Host ""
Write-Host "-ForegroundColor Color -BackgroundColor Color Para personalizar la salida" -ForegroundColor Blue -BackgroundColor Yellow
# ForegroundColor es el color de la letra, y BackgroundColor el color de fondo
Write-Host "Fondo rojo y letras blacas" -ForegroundColor White -BackgroundColor Red

Write-Host ""
Write-Host "-Separator. Usado para sustituir los espacios" -ForegroundColor Blue -BackgroundColor Yellow
Write-Host "Hola" "Adios" -Separator " ," # En este caso se sustituye por una ,
Write-Host "ROJO" "AZUL" "VERDE" -Separator " - " # Los espacios se sustituyen por -


Write-Host ""
Write-Host ""
Write-Host "FIN" -ForegroundColor Yellow -BackgroundColor Blue