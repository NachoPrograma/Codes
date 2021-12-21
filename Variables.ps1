<#
  IES Las Salinas
  Introduccion a PowerShell
  En este ejemplo veremos los tipos de variables
  Para mas informacion visita:
  https://docs.microsoft.com/es-es/powershell/module/microsoft.powershell.core/about/about_variables?view=powershell-7.2
  
  Para crear una variables se pone el simbolo $ seguido del nombre de la variable
  ESTA PROHIBIDO EL USO DE ACENTOS, TILDES, SIMBOLOS PARA NOMBRAR VARIABLES
  Para indicar su valor ponemos el simbolo = seguido del valor deseado.
  Si no indicamos nada, por defecto el valor es null
  Podemos especificar, o no, el tipo de datos de la variable
  Veremos varios tipos de variables que podemos crear.

  La inicializacion de variables es un espacio al principio del codigo, dedicado a iniciar las variables
  Siempre es lo primero que debemos poner en nuestro codigo, junto con un comentario de su finalidad

  De forma conjunta veremos uno de los comandos mas utilizados para imprimir por pantalla Write-Host
  Para generar un salto de linea se utiliza la expresion "`n"
#>


# Variable tipo entero
Write-Host ""
Write-Host "Variable tipo entero" -ForegroundColor Blue -BackgroundColor Yellow
$variableEntero = 35
# Imprimimos por pantalla el tipo de variable usando la expresion .GetType().Name
# Podemos incluir texto (string) de forma conjunta con la variable, simpre entre comillas dobles
Write-Host "La variable es tipo" $variableEntero.GetType().Name "y su valor es:"$variableEntero

Write-Host ""
Write-Host "Variable tipo string" -ForegroundColor Blue -BackgroundColor Yellow
# Ejemplo de varibale tipo String (texto)
$variableString = "Mi texto"
Write-Host "La variable es de tipo" $variableString.GetType().Name "y su valor es:"$variableString

Write-Host ""
Write-Host "Variable tipo BOOL" -ForegroundColor Blue -BackgroundColor Yellow
# VARIABLE TIPO BOOL (TRUE / FALSE)
$variableBool = $true
Write-Host "El valor de la variable es" $variableBool "y es de tipo"$variableBool.GetType().Name


Write-Host ""
Write-Host "Variable tipo lista 2" -ForegroundColor Blue -BackgroundColor Yellow
# Ejemplo variable tipo lista (Object[])
$variableLista1 = 1, 2, 3
Write-Host "La variable es de tipo" $variableLista1.GetType().Name "y su valor es:"$variableLista1
# Para acceder a un elemento concreto de una lista, debo especificar su posicion, siendo 0 la primera
Write-Host "El valor de la PRIMERA posicion de la lista1 es" $variableLista1.Get(0)

Write-Host ""
Write-Host "Variable tipo lista 2" -ForegroundColor Blue -BackgroundColor Yellow
# Ejemplo variable tipo lista (Object[])
$variableLista2 = "Pera", "Manzana", "Platano"
Write-Host "La variable es de tipo" $variableLista2.GetType().Name "y su valor es:"$variableLista2
Write-Host "El valor de la SEGUNDA posicion de la lista2 es" $variableLista2.Get(1) "`n"

Write-Host ""
Write-Host "Eliminar el valor de una variable" -ForegroundColor Blue -BackgroundColor Yellow
# ELIMINAR EL VALOR DE UNA VARIABLE
$variableTest = "Un valor string"
Write-Host "El valor de la variable es" $variableTest
$variableTest = $null
Write-Host "El valor de la variable es" $variableTest

Write-Host ""
Write-Host "Asignacion multiple de variables 1" -ForegroundColor Blue -BackgroundColor Yellow
# ASIGNACION MULTIPLE 1
$a = $b = $c = 10 # a b y c son igual a 10
Write-Host "El valor de a, b y c es: " $a "," $b "," $c 

Write-Host ""
Write-Host "Asignacion multiple de variables 2" -ForegroundColor Blue -BackgroundColor Yellow
# ASIGNACION MULTIPLE 2
$i, $j, $k = 23, "azul", $false # En este caso i es 23, j es azul, y k es falso
Write-Host "El valor de i, j, k es: " $i "," $j "," $j

Write-Host ""
Write-Host "Asignacion multiple de variables 3" -ForegroundColor Blue -BackgroundColor Yellow
# ASIGNACION MULTIPLE 3
$m, $n = 35, "verde", $false # m es 10, n es una lista Object[] de verde y falso
Write-Host "El valor de m, n es: " $m "," $n

# ESPECIFICAR TIPO DE DATOS
# TIPO ENTERO
Write-Host ""
Write-Host "Especificar variable tipo entero" -ForegroundColor Blue -BackgroundColor Yellow
[int]$varEntero = 8
Write-Host "El valor de la variable es: " $varEntero
$varEntero = "1234" # Se realiza una conversion
Write-Host "El valor de la variable es: " $varEntero
# Si intento asignar un valor string a la variable, tendremos un error
# Para evitar errores usamos la sentencia try/catch
try
{
    $varEntero = "Hola" # No se puede realizar la conversion
    Write-Host "El valor de la variable es: " $varEntero
}catch{}

Write-Host ""
Write-Host "Especificar variable tipo String" -ForegroundColor Blue -BackgroundColor Yellow
# TIPO STRING
[string]$varString = "Hola"
Write-Host "El valor de la variable es: " $varString
$varString = 10 # Se convierte a string
Write-Host "El valor de la variable es: " $varString " y es de tipo: "$varString.GetType().Name 
$varString += 20 # El signo + CONCATENA los strings
Write-Host "El valor de la variable concatenada es: " $varString " y es de tipo: "$varString.GetType().Name


#VARIABLES TIPO DATE
Write-Host ""
Write-Host "Variable tipo date" -ForegroundColor Blue -BackgroundColor Yellow
[datetime] $fecha = "12/26/2021" # Este string se convierte en un objeto de tipo DateTime
Write-Host "El valor de la variable es" $fecha "y es de tipo" $fecha.GetType().Name

# LISTAR VARIABLES
# Cualquiera de las siguientes expresiones lista las variables
#Get-Variable
Write-Host ""
Write-Host "Todas las variables del script" -ForegroundColor Blue -BackgroundColor Yellow
Get-ChildItem Variable:


Write-Host ""
Write-Host ""
Write-Host "FIN" -ForegroundColor Yellow -BackgroundColor Blue