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

-- ========== Creando una tabla desde T-SQL ==========
-- Recordar que para establecer una PRIMARY KEY se establece luego de definir las
-- columnas, ademas recordar que si la PRIMARY KEY ser� IDENTITY, se debe definir
-- al momento de establecer el tipo de dato de la columna PRIMARY KEY siguiendo
-- la siguiente estructura "pkColumna INT IDENTITY (1,1) donde el primer valor es
-- el seed (n�mero en el que inicia al contar el identity) y el segundo valor es
-- el increment (la cantidad de n�meros que incrementar� por cada registro)

-- ========== Primary key compuesta ==========
-- En algunas tablas pueden tener como caracteristica que una primary key sea 
-- compuesta por varias columnas, ello no significa que tenga varias primary keys,
-- ya que las primary key son unicas, lo que significa es que la primary key esta 
-- formada por varios campos y no unicamente por un unico campo

-- ===== �Porqu� en una tabla de relaci�n no se establece la propiedad IDENTITY? =====
-- Principalmente es debido a que en una tabla de relaci�n lo que se realiza es
-- registrar datos que ya existen en otras tablas, no estamos creando registros nuevos, 
-- sino que son datos que est�n relacionados a otras tablas y tienen que existir en su
-- respectiva tabla

-- ========== Definiendo tipos de datos de usuario ==========
-- Cuando existen muchas tablas donde se almacena el mismo dato (y su respectivo tipo)
-- existe la posibilidad de que alguna de las tablas registremos incorrectamente el
-- tipo de dato lo cual ocasionar� incidencia al momento de establecer la relaci�n
-- entre tablas, para solucionar ello lo que se puede realizar es "crear" un tipo
-- de dato que estar� vinculado al tipo de dato correspondiente a la columna, por 
-- ejemplo, si en varias tablas tenemos el dato "idPaciente" que es un INT, para
-- evitar que en otra tabla se confunda con un TINYINT o BIGINT lo que se realiza
-- es crear un tipo de dato (tambien llamado TYPES) con el tipo de dato INT y con
-- un identificador relacionado a idPaciente para su f�cil identificaci�n, esto ayudar�
-- a reducir el margen de error al especificar el tipo de dato en cada tabla, adem�s
-- tambi�n ayuda en que si es necesario modificar el tipo de dato ya no se tendr�a
-- que modificar tabla por tabla sino que modificamos el tipo de dato en el TYPE y
-- el cambio se aplicar� autom�ticamente a todas las tablas donde se este usando 
-- dicho TYPE (algo similar a modificar el master page de un header/footer)
-- C�digo para crear un TYPE: CREATE TYPE (nombre) FROM INT NOT NULL
-- Los TYPES se pueden localizar en la ruta: 
-- BD -> Programmability -> Types -> User-Defined Data Types