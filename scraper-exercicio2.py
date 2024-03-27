#!/usr/bin/env python
# coding: utf-8

# In[1]:


import requests
from bs4 import BeautifulSoup


# In[2]:


url = "https://www.imdb.com/chart/top/?ref_=nv_mv_250"
data = requests.get(url).text


# In[3]:


soup = BeautifulSoup(data, 'html.parser')


# In[4]:


# imprimir o titulo da página
print(soup.title.string)


# In[5]:


# vamos agora filtrar todos os tr
listTR = soup.find_all('tr')
len(listTR)


# In[6]:


def remove_tags(html):
    # parse html content
    soup = BeautifulSoup(html, "html.parser")
    for data in soup(['style', 'script']):
        # Remove tags
        data.decompose()
    # return data by retrieving the tag content
    return ' '.join(soup.stripped_strings)


# In[14]:


# declarar uma lista para guardar os filmes
listaFilmes = []


# In[20]:


for row in listTR[1:]: # ignorar a primeira linha que é cabeçalho
    if row:
        titulo = row.find('td', class_='titleColumn').getText()
        titulo = titulo[16:] # remover os primeiros 
        year = titulo[-6:-2]
        year = int(year.replace(" ", ""))
        #remover o ano da string
        titulo = titulo[:len(titulo)-8]

        rating = float(row.find('td', class_='ratingColumn imdbRating').getText())
        
        filme = {"Titulo": titulo, "Ano": year, "Idade": 22, "Rating": rating}
        listaFilmes.append(filme)        
        


# In[23]:


def listaFilmesAno(ano):
    for filme in listaFilmes:
        if filme['Ano']==ano:
            print(filme)


# In[28]:


listaFilmesAno(2008)


# In[29]:


def listaFilmesRating(interv1, interv2):
    total = 0
    for filme in listaFilmes:
        if interv1<=filme['Rating']<=interv2:
            print(filme)
            total += 1
    
    if total==0:
        print("Não foram encontrados filmes neste intervalo de rating")
    elif total==1:
        print("Foi encontrado 1 filme neste intervalo de rating")
    else:
        print(f"Foram encontrados {total} filmes neste intervalo de rating")


# In[32]:


listaFilmesRating(7.5, 8)


# In[ ]:





# In[ ]:




