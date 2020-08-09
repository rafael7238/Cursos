from math import trunc

nome="Rafael"
idade=27
peso=120
altura=1.83
maiorDeIdade=idade>18
imc = peso/(altura**2)

print(f"Nome: {nome}, Idade: {idade}, Altura: {altura}, É maior de Idade: {maiorDeIdade}, IMC: {imc+0.005}")
print(f"Nome: {nome}, Idade: {idade}, Altura: {altura}, É maior de Idade: {maiorDeIdade}, IMC: {imc+0.005:.2f}") #Arredondar valor
print(f"Nome: {nome}, Idade: {idade}, Altura: {altura}, É maior de Idade: {maiorDeIdade}, IMC: {trunc(imc)}") #Truncar valor