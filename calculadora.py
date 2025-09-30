v1 = int(input('Digite o valor 1: '))
v2 = int(input('Digite o valor 2: '))
op = int(input('''Digite a operação:
1 - soma
2 - subtração
3 - multiplicação
4 - divisão
'''))

if op == 1:
    resultado = v1 + v2
    print(f"Soma = {resultado}")

elif op == 2:
    resultado = v1 - v2
    print(f"Subtração = {resultado}")

elif op == 3:
    resultado = v1 * v2
    print(f"Multiplicação = {resultado}")

elif op == 4:
    if v2 == 0:
        print('Operação não permitida. Denominador não pode ser igual a zero.')
    else:
        resultado = v1 / v2
        print(f"Divisão = {resultado}")

else:
    print('Opção inválida. Encerrando o programa.')