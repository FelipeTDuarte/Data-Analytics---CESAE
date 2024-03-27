import mysql.connector
    
dataBase = mysql.connector.connect(host = "localhost", user = "root", passwd = "",database = "cesae" ) 
cursorObject = dataBase.cursor()
    
print("Fazer um join e devolver o nome da pessoa e sua localidade:")
query = "SELECT marca, modelo FROM modelo, marca WHERE modelo.id_marca=marca.id_marca and marca.id_marca=2"
cursorObject.execute(query)
myresult = cursorObject.fetchall()
for x in myresult:
    print(x)
  
# disconnecting from server
dataBase.close()