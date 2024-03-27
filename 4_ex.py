list = [2, 3.75, 0.04, 59.34, 6,7,7.777]
listInteiros = [x for x in list if type(x)==int]
print(listInteiros)

listDiv7 = [x for x in range(1000) if x%7==0]
print(listDiv7)

listInclui3 = [x for x in range(1000) if '3' in str(x)]
print(listInclui3)

list_a = 1, 2, 3, 4
list_b = 2, 3, 4, 5
comuns = [x for x in list_a if x in list_b]
print(comuns)

texto = 'In 1984 there were 13 instances of a protest with over 1000 people attending'
palavras = texto.split()
textNumbers = [x for x in palavras if not x.isalpha()]
print(textNumbers)

texto = 'Num discurso emocionado e emocionante, Olena Zelenska, primeira-dama da Ucrânia, falou não só do terror com que, desde fevereiro, a população ucraniana lida, mas principalmente do que todos nós poderemos fazer para ajudar a garantir a liberdade e recuperação do país.'
palavras = texto.split()
palavrasAte4Chars = [x for x in palavras if len(x)<4]
print(palavrasAte4Chars)