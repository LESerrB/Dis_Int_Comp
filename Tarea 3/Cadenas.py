i = 0
j = 0
k = 0
l = 0

msj = ""
lista = []
lista2 = []

cdn = input("Ingrese Texto: ")

while i < len(cdn):		
	ltr = cdn[i]					# AGREGA LOS CARACTERES EN UNA LISTA PARA TRATARLOS INDIVIDUALMENTE
	c = str(int(bin(ord(ltr))[2:]))	# CONVIERTE CARACTER EN ASCII
	lista.append(c)
	
	while k < len(c):				# OBTIENE BIT DE PARIDAD
		if c[k] == "1":
			l += 1
		k += 1

	bp = l%2
	lista2.append(str(bp))

	i += 1

while j < len(lista):
	#BIT DE INICIO + BITS DE CARACTER + BIT DE PARIDAD + BITS DE PARO
 	msj += '0 ' + lista[j] + ' ' + lista2[j] + ' 11 '
 	j += 1

print(msj)
input("Presione Enter para finalizar")