import requests
from bs4 import BeautifulSoup

url = "https://en.wikipedia.org/wiki/List_of_countries_by_population_(United_Nations)"
data = requests.get(url).text
soup = BeautifulSoup(data, 'html.parser')

title = soup.title.text
print(title)

# buscar a tabela
tabela = soup.find('table', class_='wikitable')
# buscar todas as linhas
data_rows = tabela.find_all('tr')

rowsList = []
# percorrer as linhas
for row in data_rows:
    # descobrir as colunas
    value = row.find_all('td')
    # percorrer as colunas
    tdList = [elem.text.strip() for elem in value]
    # Ignora as colunas vazias
    if len(tdList) == 0:
        continue
    rowsList.append(tdList)

# declarar uma lista para guardar os países
listaPaises = []

# vamos filtrar a listagem e criar dicionário para adicionar à lista listaPaisesFiltrada
for pais in rowsList:
    dict = {'Pais': pais[0], 'Regiao': pais[1], 'Pop2018': pais[3], 'Pop2019': pais[4]}
    listaPaises.append(dict)

print(listaPaises)