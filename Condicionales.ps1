<#  IES Las Salinas Seseña
    DESARROLLO DE APLICACIONES MULTIPLATAFORMA
    Modulo: Sistemas Informaticos
    MANEJO DE CONDICIONALES Y COMPARADORES
#>

# OPERADORES DE COMPARACION
Write-Host ""
Write-Host "OPERADOR -eq" -ForegroundColor Blue -BackgroundColor Yellow
# -eq Compara si dos valores son exactamente iguales
$miVariable = 9
$miVariable -eq 5 # La salida es False ya que nco son iguales
$miVariable -eq 9 # La salida es True ya que son iguales

Write-Host ""
Write-Host "OPERADOR -ceq" -ForegroundColor Blue -BackgroundColor Yellow
# -ceq  distingue entre mayusculas y minusculas
$miVariable = "PowerShell"
$miVariable -ceq "powershell" # El retorno es False ya que no son iguales
$miVariable -ceq "PowerShell" # El retorno es True ya que son iguales

Write-Host ""
Write-Host "OPERADOR -ne" -ForegroundColor Blue -BackgroundColor Yellow
# -ne Retorna la negativa de la comparacion (la inversa de -eq)
$miVariable = 9
$miVariable -ne 9   # Retornara False ya que son iguales
$miVariable -ne 324 # Devuelve True ya que no son iguales

Write-Host ""
Write-Host "OPERADOR -cne" -ForegroundColor Blue -BackgroundColor Yellow
# -cne Retrona la negativa de la comparacion, distinguiendo entre mayusculas y minusculas
$miVariable = "Sistemas"
$miVariable -cne "sistemas" # Retorna True ya que no son iguales
$miVariable -cne "Sistemas" # Retorna False ya que son iguales

<# COMPARADORES MAYOR/MENOR
                        Distingue mayusculas y minusculas
    -gt mayor que           -cgt mayor que
    -ge mayor o igual que   -cge mayor o igual que
    -lt menor que           -clt menor que
    -le menor o igual que   -cle menor o igual que
#>

Write-Host ""
Write-Host "OPERADOR -like" -ForegroundColor Blue -BackgroundColor Yellow
# -like Compara de forma aproximada dos valores, usando comodines de aproximacion
$miVariable = "PowerShell"
$miVariable -like "?owershell" #? indica un caracter indeterminado. Retorna True
$miVariable -like "pow*"       #* indica un grupo de caracteres indeterminado. Retorna True

<#  VARIANTES DE -like
    -clike distingue entre mayusculas y minusculas
    -notlike inversa de like
    -cnotlike inversa de clike
#>

Write-Host ""
Write-Host "OPERADOR -is" -ForegroundColor Blue -BackgroundColor Yellow
# -is permite conocer si una variable es de un tipo concreto
$miVariable = $true
$miVariable -is [bool]   # Devuelve True ya que es bool
$miVariable -is [string] # Retorna False ya que no es string

Write-Host ""
Write-Host "OPERADOR -contains" -ForegroundColor Blue -BackgroundColor Yellow
# -contains permite conocer si una lista o coleccion contiene un valor determinado
$miLista = "rojo", "amarillo", "verde"
$miLista -contains "naranja"  # Retorna False ya que no contiene este string
$miLista -contains "amarillo" # Retorna True ya que la lista contiene el string "amarillo"

Write-Host ""
Write-Host "OPERADOR -in" -ForegroundColor Blue -BackgroundColor Yellow
# -contains permite conocer si una lista o coleccion contiene un valor determinado
$miLista = 23, $false, "verde"
$miLista -contains "verde"  # Retorna True
$miLista -contains 23 # Retorna True

<#  OPERADORES LOGICOS
    -not y ! Invierte el resultado de una condicion
    -and permite anidar operaciones logicas (se deben cumplir TODAS para que el resultado sea true)
    -or permite anidar operaciones logicas, y devuelve true si alguna es correcta (vale con una)
#>

<#  CODICIONAL IF
    Con el condicional if podemos definir diferentes caminios de ejecucion dentro del codigo
    Para ello, se tiene que cumplir siempre la condicion que ponemos
#> 

Write-Host ""
Write-Host "CONDICIONAL if" -ForegroundColor Blue -BackgroundColor Yellow
# Se tiene que cumplir la condicion de que miVariable sea hola (no distingue mayusculas de minusculas)
$miVariable = "Hola"
if ($miVariable -eq "hola"){
    Write-Host "CORRECTO 1"
}
# Se tiene que cumplir la condicion de que miVariable sea hola (no distingue mayusculas de minusculas)
if ($miVariable -ceq "hola"){
    Write-Host "CORRECTO 2"
} #NO TENDREMOS SALIDA YA QUE NO SE CUMPLE LA CONDICION


Write-Host ""
Write-Host "CONDICIONAL if con else" -ForegroundColor Blue -BackgroundColor Yellow
# else lo que nos proporciona es una salida alternativa si no se cumple la condicion que hemos puesto
$miVariable = "PowerShell"
if($miVariable -eq "PowerShell"){
    Write-Host "CORRECTO"
}else{
    Write-Host "INCORRECTO"
}

Write-Host ""
Write-Host "CONDICIONAL elseif" -ForegroundColor Blue -BackgroundColor Yellow
# elseif sirve para seguir realizando comprobaciones de condicion
# Si se cumple la condicion deja de realizar los elseif que falten
# Si no se cumple ninguna de las condiciones toma el camino de else
$miVariable = "Hola"
if($miVariable -eq "Adios"){
    Write-Host "Mi variable es Adios"
}elseif ($miVariable -eq "Hasta luego"){
    Write-Host "Mi variable es Hasta luego"
}elseif ($miVariable -eq 100){
    Write-Host "Mi variable es 100"
}elseif ($miVariable -eq "Hola"){
    Write-Host "Mi variable es Hola"
}else{
    Write-Host "Mi variable no esta entre las condiciones"
}

Write-Host ""
Write-Host "CONDICIONAL if ASIGNANDO VALOR A VARIABLE" -ForegroundColor Blue -BackgroundColor Yellow
# Podemos asignar el valor a una variable dependiendo del resultado
$miVariable = 5
$resultado = if ($miVariable -eq 5){
    "cinco"
}else {
    "otro"
}
Write-Host "El resultado es: "$resultado # Sacamos el valor en la terminal

Write-Host ""
Write-Host "CONDICIONAL SWITCH" -ForegroundColor Blue -BackgroundColor Yellow
# Funcionamiento parecido al operador if, pudiendo realizar acciones concretas
# dependiendo de la entrada
$miVariable = "hola"
switch ($miVariable) {
    "Adios" {Write-Host "Has escrito Hola" }
    "Hola"  {Write-Host "Has escrito Hola"}
    Default {Write-Host "No esta entre las opciones"}
}


Write-Host ""
Write-Host ""
Write-Host "FIN" -ForegroundColor Yellow -BackgroundColor Blue