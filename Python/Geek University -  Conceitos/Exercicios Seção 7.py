'''

Exercicios da seção 7 do curso pt1

'''



'''

# exercicio 1
total = 0
vetor = [1, 0, 5, -1, -5, 7]


total = vetor [0] + vetor[1] + vetor[5]

print(total)

vetor[4] = 100
print(vetor[4])

print(*vetor, sep= '\n')



# exercicio 2

valores = []

for i in range(0,6):
    print(input('Insira um valor'))
    valores.append(i)
print(valores)



# exercicio 3


numquadrado = set({})
num = set({})

for i in range(0, 4):
    num.add(input('Digite 10 numeros'))

print(num)



xxxxx


# exercicio 4
total = 0
lista = []

for i in range(0,3):
    lista.append(int(input('Digite 3 numeros')))

for z in lista:
    total = lista[1] + lista[2]

print(total)



# exercicio 5
vetor = []
total = 0
for i in range(0,5):
    vetor.append(int(input('Digite um valor')))
    if vetor[i] % 2 == 0:
        total += 1

print(vetor)
print(total)



# exercico 6

vetor1 = []
vetor = [[vetor1.append(input('Digite um numero'))] for i in range(0, 5)]

print(vetor1)
print(max(vetor1))
print(min(vetor1))



# exercicio 7


lista = []
maior = 0
menor = 0
for cont in range(0, 5):
    lista.append(int(input(f'Digite um valor para a posiçao {cont}')))
    if cont == 0:
        maior = menor = lista[cont]
    else:
        if lista[cont] > maior:
            maior = lista[cont]
        if lista[cont] < menor:
            menor = lista[cont]


print(f'Os numeros digitados foram: ', lista)
print(f'O maior valor foi: {maior} nas posições ', end ='')
posMai = [print(f'{i}...') if v == maior else print(end='') for i, v in enumerate(lista)]
print(f'O menor valor foi: {menor} nas posições ', end='')
posMen = [print(f'{i}...') if v == menor else print(end='') for i, v in enumerate(lista)]








# exercicio 8


num = [input(print('Digite um numero')) for i in range(0, 3)]
print(num[::-1])




# exercicio 9
numeros = [int(input(print('Digite apenas numeros pares'))) for i in range(0, 5)]
print(numeros)

pares = [par for par in numeros if par % 2 == 0]
print(pares[::-1])


# exercicio 10

notas = []
total = 0
for i in range(0, 5):
    notas.append(int(input('Digite a nota do aluno ')))

print(notas)
total = sum(notas)
print(total / 5)



# exercicio 11

num = []
numeros = [num.append(float(input("Digite um numero "))) for i in range(0, 6)]
negativos = [n for n in num if n < 0]

positivos = [n for n in num if n > 0]

cont = 0
for i in negativos:
    cont += 1

print('Nessa lista há: ', cont,  'números negativos')
print('A soma dos números positivos da lsita é de', sum(positivos))



# exercicio 12

numeros = []
x = [numeros.append(int(input('Digite um numero'))) for i in range(0,5)]
max = [max(numeros)]
min = [min(numeros)]
media = sum(numeros)

print('O maior indice é ', max)
print('O menor indice é ', min)
print('A media dos numeros é de: ', media / 5)



# exercicio bonus


numerosDict = {0:'zero', 1:'um', 2: 'dois', 'tres': 3, 'quatro': 4, 'cinco': 5, 'seis': 6, 'sete': 7, 'oito': 8, 'nove': 9, 'dez': 10}
xxxxxxx
for valor,chave in numerosDict.items():
    x = int(input('Digite um numero de 0 - 10'))
    if valor == x:
        print(f'Voce digitou o numero {chave}')

    else:
        print('Não encontrei nenhum numero')
        exit(0)
xxxxx



# exercicio 14

lista = []
for i in range(0, 5):
    lista.append(int(input('Digite um numero')))

num = []
for n in lista:
    if n == 0:
        n = lista[n]
    if n == lista[n]:
        num.(lista[n])
    else:
        print('Não encontrei nenhum valor repetido')

print('Esses valores se repetem na lista: ', num)



# exercicio 15

lista = []
repetido = [0]
xxxxxxxxxx
for i in range(0, 5):
    lista.append(int(input("Digite um numero")))
repetido= lista.copy()
for i in repetido:
    for n in lista:
        if repetido[i] == lista[n]:
            lista.pop(lista[n])
xzxxxxxxxxxxxxx
print(lista)



# exercicio 16

lista = []
for i in range(0, 5):
    lista.append(float(input('Digite um numero qualquer')))


cont = int(input('Digite um 1 para ver a lista, 2 para ve-la inversa e 0 para sair'))
while cont != 0:
    if cont == 1:
        print(lista)
    if cont == 2:
        print(lista[::-1])
    if cont != 0 or cont != 2 or cont != 1:
        print('Nenhuma função executada, encerrando')
        exit(0)
    else:
        if cont == 0:
            exit(0)



# exercicio 17

lista = []

for i in range(0, 5):
    lista.append(int(input('Digite um numero inteiro qualquer')))
    if lista[i] < 0:
        lista[i] = 0

print(lista)



# exercicio 18

lista  =[]
Multiplo = int(input('Digite um numero que deseja encontrar multiplos'))
Multiplos = []
for i in range(0,5):
    lista.append(int(input('Digite um numero inteiro qualquer')))
    if Multiplo % lista[i] == 0:
        Multiplos.append(lista[i])

print(Multiplos)

 

# exercicio 19

lista = []
x = []
for i in range(0, 50):
    lista.append((i + 5 * i) % (i + 1))


print(lista)



# exercicio 20

lista = []
impares = []
x = []
c = 0
y = 0

while c < 5:
    x = int(input('Digite um numero inteiro entre 0 e 50'))
    if x < 0 or x > 50:
        print('Numero Invalido, tente novamente')
    else:
        if x > -1 or x < 51:
            c = c + 1
            lista.append(x)
        if x % 2 !=0:
            impares.append(x)
            y = y + 1

print('Os numeros digitados foram: ', lista)
print('Os numeros impares são:', impares)


# exercicio 21
xxxxxxxxxxxxxxxxxx
lista1 = []
lista2 = []
lista3 = []

for i in range(0, 2):
    lista1.append(int(input('Digite 2 numeros para a lista 1')))
    lista2.append(int(input('Digite 2 numeros para a lista 2')))

for i in lista1, lista2:
    x = lista1[i] - lista2[i]
    lista3.append(x)

print(lista3)

'''

# exercicio 22

lista1 = []
lista2 = []
lista3 = []


for i in range(0, 3):
    lista1.append(int(input('Digite um numero para a lista 1')))
    if lista1[i] % 2 == 0:
        lista3.append(lista1[i])
    else:
        i += 1
        lista3.append(lista1[i])


for i in range(0, 3):
    lista2.append(int(input('Digite um numero para a lista 2')))
    if lista2[i] % 2 != 0:
        lista3.append(lista2[i])




print(f'Lista 1: {lista1}')
print(f'Lista 2: {lista2}')
print(f'Lista 3: {lista3}')

'''
lista = []
maior = 0
menor = 0
for cont in range(0, 5):
    lista.append(int(input(f'Digite um valor para a posiçao {cont}')))
    if cont == 0:
        maior = menor = lista[cont]
    else:
        if lista[cont] > maior:
            maior = lista[cont]
        if lista[cont] < menor:
            menor = lista[cont]
'''