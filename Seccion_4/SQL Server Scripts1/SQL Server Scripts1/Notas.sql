-- ========== Archivos MDF y LDF ==========
-- �Qu� son archivos MDF?
	--El archivo MDF es el principal archivo de una base de datos en SQL SERVER. 
	-- Contiene las tablas, �ndices, procedimientos almacenados y otros objetos 
	-- de la base de datos.

-- �Qu� son los archivos LDF?
	--El archivo LDF es el archivo de registro de transacciones de una base 
	--de datos en SQL Server. Registra todas las transacciones y cambios 
	--realizados en la base de datos, lo que permite la recuperaci�n y la
	--restauraci�n de la misma en caso de fallos o p�rdida de datos.

-- ========== Establecer una DB por Default ==========
-- Podemos editar cual ser� la DB default para un usuario ingresando a la
-- carpeta "Security" -> "Logins" y haciendo doble click en el usuario
-- cambiamos donde dice "Default Database" y seleccionamos la que deseemos

-- ========== Definiendo la tabla de Pacientes ==========
-- Una buena practica para definir los nombres de los campos es utilizar el
-- formato de tipo camelCase (que consiste en palabras separadas con may�sculas, 
-- salvo la primera letra que debe  ir en min�scula).

-- Por buena pr�ctica tambien se aconseja que el nombre de la tabla respecto
-- a una entidad (Paciente por ejemplo) debe escribirse en singular y no en plural

-- ========== Modificando una tabla existente ==========
-- S� realizamos modificaciones a las propiedades de una columna y un mensaje de
-- advertencia nos impide proceder con dicha configuraci�n podemos ingresar en el
-- apartado "Tools" -> "Options" -> "Designers" ->  y desactivamos el check de la
-- opci�n "Prevent saving changes that require table re-creation", tener en cuenta
-- que esto podr�a generar perdida de datos dependiendo de la modificaci�n que se
-- realice, en teor�a modificar el nombre de una columna o la longitud del tipo de
-- dato no deber�a generar incidencia pero si cambiamos el tipo de dato por ejemplo
-- de varchar (texto) a int (n�merico) podr�a generar un conflicto, por lo cual se
-- recomienda que este tipo de modificaciones se realicen en un entorno de desarrollo
-- adem�s de contar con respaldos de la DB y adicionalmente realizar dichas gestiones
-- desde T-SQL, para que en caso de generar una incidencia poder revertir la operaci�n

