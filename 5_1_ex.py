import mysql.connector

conn = mysql.connector.connect(host = "localhost", user = "root", passwd = "",database = "cesae2")
cursorObject = conn.cursor()

print("Buscar os dados da tabela Localidade:")
query = "SELECT id_localidade, localidade from localidade order by localidade"
cursorObject.execute(query)
myResult = cursorObject.fetchall()

print(type(myResult))

for val in myResult:
    print(type(val))
    #print(val)
    print(val[0], val[1])

conn.close()