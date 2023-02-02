#IMPORT


import dash
import dash_core_components as dcc
import dash_html_components as html
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import ipywidgets
import geocoder
import geopy
import folium
import sqlite3
import mysql.connector
import os
import plotly.graph_objects as geocoder
import plotly.graph_objs as go
import matplotlib.pyplot as plt
import plotly.express as px
import plotly.graph_objects as go
from plotly.subplots import make_subplots

#FROM

from folium import plugins 
from vega_datasets import data as vds
from dash.dependencies import Input, Output
from plotly.subplots import make_subplots



# Conectar con la base de datos
conexion=mysql.connector.connect(user='root',
                                 password='root11235813*',
                                 host='localhost',
                                 database='dump_desafio_usuarios_3',
                                 port='3306',
                                )
print(conexion)
crsr = conexion.cursor()

#Funcion SQL(QUERY)
def sql_query(query):
    
    # ejecuto la query
    crsr.execute(query)
    
    # almaceno los datos de la query
    ans = crsr.fetchall()
    
    # obtengo los nombres de las columnas de la tabla
    names = [description[0] for description in crsr.description]
    return pd.DataFrame(ans,columns = names)


#QUERY
query = '''
SELECT * 
FROM users
'''

df = sql_query(query)

df_location_users=pd.DataFrame(df.groupby(by=['location'])['id'].count().sort_values(ascending=False)).reset_index()
df_location_users

df_location_health_issues=pd.DataFrame(df.groupby(by=['health_issues'])['id'].count().sort_values(ascending=False)).reset_index()
df_location_health_issues


#SUBPLOT
fig_bar = go.Figure(data=[go.Bar(x = df_location_users['location'],
                y = df_location_users['id'],
                name = 'Usuarios Activos',
                marker = dict(color = 'rgba(255, 0, 0, 0.6)',
                line = dict(color='rgb(20,20,20)', width = 2)),
                text = df_location_users['location'])])


fig_pie=go.Figure(data=[go.Pie(labels=df_location_health_issues['health_issues'], values=df_location_health_issues['id'])])



fig_bar.update_layout(title='Usuarios por municipio', 
                      height=800, 
                      showlegend=False)

fig_pie.update_layout(title='Principales temas de salud', 
                      height=800,
                      showlegend=True)



app = dash.Dash(__name__)
app.layout = html.Div([
    # html, css
    html.Img(src='./assets/logoCR.png',
             width=500),
    html.H1('Dashboard', style={'color': 'red', 'fontSize': 40}),


    
    # chart
    html.P('Informacion de la sección Usuarios'),
    dcc.Graph(figure=fig_bar),

    dcc.Graph(id='Figura_inicial',
              figure=fig_pie)
              

     
],className='banner')


if __name__ == '__main__': 
    app.run_server(debug=True,port=5050)