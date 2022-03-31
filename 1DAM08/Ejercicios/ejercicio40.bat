@echo off
cd C:\Users\Public\Desktop\WINDOWS\1DAM08\ejercicios
mkdir ut4_0 results
cd  C:\Users\Public\Desktop\WINDOWS\1DAM08\ejercicios\ut4_0
mkdir vehiculos, barcos
cd C:\Users\Public\Desktop\WINDOWS\1DAM08\ejercicios\ut4_0\vehiculos
mkdir 2ruedas 4ruedas
mkdir 2ruedas\bici moto
mkdir 4ruedas\coche furgoneta
cd ..
mkdir barcos\lancha veleros yates

echo "tarea hacida pulgar arriba"
tree /A C:\Users\Public\Desktop\WINDOWS\1DAM08
tree /A C:\Users\Public\Desktop\WINDOWS\1DAM08 > C:\Users\Public\Desktop\WINDOWS\1DAM08\ejercicios\results\ut40.txt