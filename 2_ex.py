listaNotas = [12,16,8,4,15,13,9,2,17,20,14,5]
listaPositivas = [nota for nota in listaNotas if nota>=10]
print(sorted(listaPositivas))