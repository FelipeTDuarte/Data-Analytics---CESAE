import mysql.connector

listaAnimais = []

def adicionarAnimal():
    nome = input("Introduza o nome do animal: ")
    raca = input("Introduza a raça do animal: ")
    tipo_animal = input("Introduza o tipo do animal: ")
    idade = input("Introduza a idade do animal: ")
    temp = [nome, raca, tipo_animal, idade]
    return temp

def escreverBD():
    sql = "INSERT INTO animal (nome, raca, tipo_animal, idade) VALUES (%s, %s, %s, %s)"       
    cursorObject.executemany(sql, listaAnimais)
    conn.commit()

# estabelecer ligação
conn = mysql.connector.connect(host = "localhost", user = "root", passwd = "",database = "cesae2")
cursorObject = conn.cursor()
# consultar BD
query = "SELECT id_animal, nome, raca, tipo_animal, idade from animal"
cursorObject.execute(query)
myResult = cursorObject.fetchall()
# inserir na BD
while True:
    op = input("Deseja introduzir um animal? (s/n): ")
    if op.lower()=='s':
        listaAnimais.append(adicionarAnimal())
    elif op.lower()=='n':
        escreverBD()
        break
    else:
        print("Opção inválida!\n")

conn.close()