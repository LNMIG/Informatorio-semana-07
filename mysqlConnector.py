import mysql.connector

def connectMysqlDB(query=''):
    conn = mysql.connector.connect(                     # Conectar a la base de datos 
                                  host = 'localhost',
                                  user = 'root',
                                  password = 'L1975L'
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