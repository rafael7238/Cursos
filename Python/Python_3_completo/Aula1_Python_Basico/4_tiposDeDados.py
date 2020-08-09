"""
str- string
int - Inteiro
float - Real/Ponto Flutuante
bool - bolleano

"""
print(type('Rafael'))
print(type(2))
print(type(4.85))
print(type(True))

print(bool('')) #CAST
print(bool('Rafael')) #CAST
print(str('10'),type(str('10'))) #CAST
print(int('10'),type(int('10'))) #CAST

if type('Rafael')==bool:
    print("teste")