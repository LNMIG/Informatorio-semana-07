from mysqlConnector import connectMysqlDB, run_query

# Seleccionar la Base de Datos a usar: BLOG
querySelectDB = "USE blog"
is_connected = connectMysqlDB(querySelectDB)

# Seleccionar todos los registros de la Tabla Usuarios cuyos nombres comiencen con A
query = "SELECT nombre, apellido, email FROM usuario WHERE nombre LIKE 'A%' ORDER BY nombre ASC" 
result = run_query(is_connected, query)
for each in result:
  # print(*each)
  print(f'Nombre completo: {each[0]} {each[1]}, email: {each[2]}')














# Insertar datos
# dato = raw_input("Dato: ")
# query = "INSERT INTO b (b2) VALUES ('%s')" % dato
# run_query(query)

# Seleccionar solo registros coincidentes
# criterio = raw_input("Ingrese criterio de búsqueda: ") 
# query = "SELECT b1, b2 FROM b WHERE b2 = '%s'" % criterio 
# result = run_query(query)
# print(result)

# Eliminar registros
# criterio = raw_input("Ingrese criterio p7 eliminar coincidencias: ") 
# query = "DELETE FROM b WHERE b2 = '%s'" % criterio 
# run_query(query)

# Actualizar datos
# b1 = raw_input("ID: ") 
# b2 = raw_input("Nuevo valor: ") 
# query = "UPDATE b SET b2='%s' WHERE b1 = %i" % (b2, int(b1)) 
# run_query(query)