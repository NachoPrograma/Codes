<#  IES Las Salinas Seseña
    DESARROLLO DE APLICACIONES MULTIPLATAFORMA
    Modulo: Sistemas Informaticos
    READ-HOST
#>
Write-Host ""
Write-Host ""
Clear-Host

Write-Host ""
Write-Host "Capturar texto por teclado" -ForegroundColor Blue -BackgroundColor Yellow
$usuario = Read-Host "Indica tu nombre de usuario"
Write-Host "Hola" $usuario

Write-Host ""
Write-Host "Capturar contraseña segura" -ForegroundColor Blue -BackgroundColor Yellow
$passSecure = Read-Host "Escribe una contraseña" -AsSecureString
Write-Host $passSecure

Write-Host ""
Write-Host "Capturar contraseña como cadena de texto" -ForegroundColor Blue -BackgroundColor Yellow
$passString = Read-Host "Escribe otra contraseña distinta" -MaskInput
Write-Host $passString


Write-Host ""
Write-Host ""
Write-Host "FIN" -ForegroundColor Yellow -BackgroundColor Blue

