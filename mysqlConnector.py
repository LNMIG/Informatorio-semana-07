from os import getenv
import mysql.connector
from dotenv import load_dotenv

load_dotenv()

host = getenv('DB_HOST')
user = getenv('DB_USER')
password = getenv('DB_PASS')

def connectMysqlDB(query=''):
    conn = mysql.connector.connect(                   # Conectar a la base de datos 
              host = host,
              user = user,
              password = password
            )
    cursor = conn.cursor()                            # Crear un cursor
    cursor.execute(query)
    return conn, cursor

def run_query(connectionData, query=''):
    conn = connectionData[0]
    cursor = connectionData[1]

    cursor.execute(query)                            # Ejecutar una consulta 

    if query.upper().startswith('SELECT'): 
        data = cursor.fetchall()   # Traer los resultados de un select 
    else: 
        conn.commit()              # Hacer efectiva la escritura de datos 
        data = None 
    
    cursor.close()                 # Cerrar el cursor 
    conn.close()                   # Cerrar la conexión 

    return data