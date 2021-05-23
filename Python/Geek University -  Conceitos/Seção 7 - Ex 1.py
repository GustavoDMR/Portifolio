"""'

Exercicios da seção 7 do curso pt1

Operações com vetores

"""


# exercicio 1


vetor = [1, 0, 5, -1, -5, 9]
print('O vetor atual é: ', vetor, end='\n')

total = vetor[0] + vetor[1] + vetor[4]  # soma de vetores

print('A soma das posições 0, 1 e 4 do vetor atual é: ', total, end='\n')

novo_vetor = [int(input('Digite um valor para o novo vetor: ')) for i in range(0, 5)]  # for simplificado

print('O novo vetor é:', *novo_vetor, sep=' ')  # exibindo vetor desempacotado
