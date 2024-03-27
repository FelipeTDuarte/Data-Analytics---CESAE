import mysql.connector

#definir lista
listaLocalidades = []

conn = mysql.connector.connect(host = "localhost", user = "root", passwd = "",database = "cesae2")
cursorObject = conn.cursor()

print("Buscar os dados da tabela Localidade:")
query = "SELECT id_localidade, localidade from localidade order by localidade"
cursorObject.execute(query)
myResult = cursorObject.fetchall()

for val in myResult:
    dict = {'id_localidade': val[0], 'localidade': val[1]}
    listaLocalidades.append(dict)

print(listaLocalidades)
conn.close()