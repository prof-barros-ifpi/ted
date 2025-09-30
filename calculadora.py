v1 = int(input('Digite o valor 1:'))
v2 = int(input('Digite o valor 2:'))
op = int(input('''Digite a operação: 1 - soma
				 2 - subtracao 
				 3 - multiplicacao 
				 4 - divisao'''))

if op == 1:
	print(v1+v2)
elif op == 2:
	print(v1-v2)
elif op == 3:
	print(v1*v2)
else:
	print(v1/v2)
