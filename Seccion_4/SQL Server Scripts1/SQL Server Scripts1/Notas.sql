-- ========== Archivos MDF y LDF ==========
-- ¿Qué son archivos MDF?
	--El archivo MDF es el principal archivo de una base de datos en SQL SERVER. 
	-- Contiene las tablas, índices, procedimientos almacenados y otros objetos 
	-- de la base de datos.

-- ¿Qué son los archivos LDF?
	--El archivo LDF es el archivo de registro de transacciones de una base 
	--de datos en SQL Server. Registra todas las transacciones y cambios 
	--realizados en la base de datos, lo que permite la recuperación y la
	--restauración de la misma en caso de fallos o pérdida de datos.

-- ========== Establecer una DB por Default ==========
-- Podemos editar cual será la DB default para un usuario ingresando a la
-- carpeta "Security" -> "Logins" y haciendo doble click en el usuario
-- cambiamos donde dice "Default Database" y seleccionamos la que deseemos

-- ========== Definiendo la tabla de Pacientes ==========
-- Una buena practica para definir los nombres de los campos es utilizar el
-- formato de tipo camelCase (que consiste en palabras separadas con mayúsculas, 
-- salvo la primera letra que debe  ir en minúscula).

-- Por buena práctica tambien se aconseja que el nombre de la tabla respecto
-- a una entidad (Paciente por ejemplo) debe escribirse en singular y no en plural

-- ========== Modificando una tabla existente ==========
-- Sí realizamos modificaciones a las propiedades de una columna y un mensaje de
-- advertencia nos impide proceder con dicha configuración podemos ingresar en el
-- apartado "Tools" -> "Options" -> "Designers" ->  y desactivamos el check de la
-- opción "Prevent saving changes that require table re-creation", tener en cuenta
-- que esto podría generar perdida de datos dependiendo de la modificación que se
-- realice, en teoría modificar el nombre de una columna o la longitud del tipo de
-- dato no debería generar incidencia pero si cambiamos el tipo de dato por ejemplo
-- de varchar (texto) a int (númerico) podría generar un conflicto, por lo cual se
-- recomienda que este tipo de modificaciones se realicen en un entorno de desarrollo
-- además de contar con respaldos de la DB y adicionalmente realizar dichas gestiones
-- desde T-SQL, para que en caso de generar una incidencia poder revertir la operación

-- ========== Creando una tabla desde T-SQL ==========
-- Recordar que para establecer una PRIMARY KEY se establece luego de definir las
-- columnas, ademas recordar que si la PRIMARY KEY será IDENTITY, se debe definir
-- al momento de establecer el tipo de dato de la columna PRIMARY KEY siguiendo
-- la siguiente estructura "pkColumna INT IDENTITY (1,1) donde el primer valor es
-- el seed (número en el que inicia al contar el identity) y el segundo valor es
-- el increment (la cantidad de números que incrementará por cada registro)

-- ========== Primary key compuesta ==========
-- En algunas tablas pueden tener como caracteristica que una primary key sea 
-- compuesta por varias columnas, ello no significa que tenga varias primary keys,
-- ya que las primary key son unicas, lo que significa es que la primary key esta 
-- formada por varios campos y no unicamente por un unico campo


-- ===== ¿Porqué en una tabla de relación no se establece la propiedad IDENTITY? =====
-- Principalmente es debido a que en una tabla de relación lo que se realiza es
-- registrar datos que ya existen en otras tablas, no estamos creando registros nuevos, 
-- sino que son datos que están relacionados a otras tablas y tienen que existir en su
-- respectiva tabla