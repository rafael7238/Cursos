"""
:.(NUMERO)f - Quantidade de Casas Decimais(float)
:(CARACTERE)(> ou < ou ^) (Quantidade) (TIPO -s, d ou f)
    > Esquerda
    < Direita
    ^ Centro
"""
num_1=10
num_2=3
div=num_1/num_2
print(div)
print('{:.2f}'.format(div))
print(f"{div:.2f}")


nome = "Rafael"
print(f"{nome:s}")

numero1=1
print(f"{numero1:0^10}")