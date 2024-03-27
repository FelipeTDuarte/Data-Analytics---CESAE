listaPessoas = []

def preencherPessoa():
    bi = int(input("Introduza o seu BI: "))
    nome = input("Introduza o seu nome: ")
    idade = int(input("Introduza a sua idade: "))
    salario = float(input("Introduza o seu salário: "))
    listaTemp = [bi, nome, idade, salario]
    return listaTemp

def printPessoas():
    print("\nListagem de Pessoas:")
    if len(listaPessoas)==0:
        print("Não foram adicionadas pessoas!")
    else:
        for pessoa in listaPessoas:
            print(f"Nome: {pessoa[1]} BI: {pessoa[0]} Idade: {pessoa[2]} Salário: {pessoa[3]}")

def printPessoaSalario(val):
    print(f"\nListagem de Pessoascom salário superior a {val}€")
    if len(listaPessoas)==0:
        print("Não foram adicionadas pessoas!")
    else:
        count = 0
        for pessoa in listaPessoas:
            if pessoa[3]>val:
                print(f"Nome: {pessoa[1]} BI: {pessoa[0]} Idade: {pessoa[2]} Salário: {pessoa[3]}")
                count += 1
        if count==0:
             print(f"Não foram encontradas pessoas cujo salário seja superior a {val}")  

def printPessoasIdade(inicio, fim):
    print(f"\nListagem de pessoas com idade compreendida entre {inicio} e {fim}:")
    if len(listaPessoas)==0:
        print("Não foram adicionadas pessoas!")
    else:    
        count = 0
        for pessoa in listaPessoas:
            if inicio<=pessoa[2]<=fim:
                print(f"Nome: {pessoa[1]} BI: {pessoa[0]} Idade: {pessoa[2]} Salário: {pessoa[3]}")
                count += 1
        else:
            if count==0:
                print(f"Não foram encontradas pessoas cuja idade esteja compreendida entre {inicio} e {fim}") 

while True:
    op = input("Pretende inserir uma nova pessoa? (s/n): ")
    if op.lower()=="s":
        listaPessoas.append(preencherPessoa())
    elif op.lower()=="n":
        printPessoas()
        printPessoaSalario(1000)
        printPessoasIdade(30, 50)
        break
    else:
        print("Opção inválida!!!")