import mysql.connector

# definir lista
listaPessoas = []

# preencher lista
listaPessoas.append({"localidade":"Ovar", "id_localidade": 1})
listaPessoas.append({"localidade":"Aveiro", "id_localidade": 2})
listaPessoas.append({"localidade":"Guimarães", "id_localidade": 3})
listaPessoas.append({"localidade":"Viana do Castelo", "id_localidade": 3})
listaPessoasValues = []

# gravar no mysql
conn = mysql.connector.connect(host = "localhost", user = "root", passwd = "",database = "cesae2")
cursorObject = conn.cursor()

for pessoa in listaPessoas:
       pessoa = list(pessoa.values()) # ou tuple
       listaPessoasValues.append(pessoa)

print(listaPessoasValues)

sql = "INSERT INTO pessoa (nome, id_localidade) VALUES (%s, %s)"       
cursorObject.executemany(sql, listaPessoasValues)
conn.commit()
conn.close()
