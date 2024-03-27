import mysql.connector
    
listaProduto = []
listaTalao = []
listaTalaoProduto = []

def produtoPrecoSuperior(val):
    print(f"\nProdutos cujo preço é superior a {val}€:\n")
    for val in listaProduto:
        if val['preco']>3:
            print(val)

def produtoPrecoComIVA():
    print("\nPreço dos produtos com IVA:\n")
    for val in listaProduto:
        precoComIva = val['preco'] + val['preco']*(val['taxa_iva']/100)
        print(f"{val['nome']} : {precoComIva :.2f}€")

def getProduto(id_produto):
    for val in listaProduto:
        if val['id_produto']==id_produto:
            return val['nome'], val['preco'], val['taxa_iva']

def imprimirTalaoCompra(id_talao):
    print("\nTalão de compra:\n")
    data = ''
    total = 0
    #buscar a data do talão
    for val in listaTalao:
        if val['id_talao']==id_talao:
            data = str(val['data'])
    
    # buscar os produtos comprados
    for val in listaTalaoProduto:
        if val['id_talao']==id_talao:
            id_produto = val['id_produto']
            nome, preco, taxa_iva = getProduto(id_produto)
            precoComIva = (preco + preco*(taxa_iva/100))*val['quantidade']
            total += precoComIva
            print(f"{nome} {preco} X {val['quantidade']} IVA: {taxa_iva} Valor: {precoComIva :.2f}€")
    
    print(f"Total da compra: {total :.2f}€")
dataBase = mysql.connector.connect(host = "localhost", user = "root", passwd = "",database = "cesaeex7" ) 
cursorObject = dataBase.cursor()
    
# preencher listaProduto
query = "SELECT id_produto, nome, preco, taxa_iva from produto"
cursorObject.execute(query)
myresult = cursorObject.fetchall()
for val in myresult:
    dict = {'id_produto': val[0], 'nome': val[1], 'preco': val[2], 'taxa_iva': val[3]}
    listaProduto.append(dict)

# preencher listaTalao
query = "SELECT id_talao, data from talao"
cursorObject.execute(query)
myresult = cursorObject.fetchall()
for val in myresult:
    dict = {'id_talao': val[0], 'data': str(val[1])}
    listaTalao.append(dict)

# preencher listaTalaoProduto
query = "SELECT id_talao_produto, id_talao, id_produto, quantidade from talao_produto"
cursorObject.execute(query)
myresult = cursorObject.fetchall()
for val in myresult:
    dict = {'id_talao_produto': val[0], 'id_talao': val[1], 'id_produto': val[2], 'quantidade': val[3]}
    listaTalaoProduto.append(dict)    

produtoPrecoSuperior(3)
produtoPrecoComIVA()
imprimirTalaoCompra(1)

# disconnecting from server
dataBase.close()