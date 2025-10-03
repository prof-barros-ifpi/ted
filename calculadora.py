print("=================================================================")
print("=========== Projeto Calculadora Simples com Python ==============")
print("=================================================================")

while (True):
    v1 = int(input('Digite o primeiro valor: '))
	
	v2 = int(input('Digite o primeiro valor: '))	
	
	op = int(input('''Qual operação você quer executar ? 
               Escolha a opção:
                1 - soma
				2 - subtração
				3 - multiplicação
				4 - divisão
				5 - potencia
				6 - radiciação
				7 - sair
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
			v2=int(input('[Re]Digite o valor de v2: ')) 

		else:
			resultado = v1 / v2
			print(f"Divisão = {resultado}")

	elif op ==5:
    	resultado = 
		print()
	
	elif op ==6:
		resultado =
		print()


	else:
		print('Opção inválida. Encerrando o programa.')