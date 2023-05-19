# TFG


## EXPLICACIÓN

Al no estar usando un servidor real, las imágenes se guardan en el ordenador local de quien lo ejecute, entonces necesitamos hacer varios pasos.
Estas imágenes tienen un límite de subida de 10 MB, pero se puede modificar a gusto del usuario.


## REQUISITOS

### 1. SOBRE EL IDE
Es un proyecto Spring Boot, por lo que si se está usando Eclipse, hay que instalarse desde Eclipse Marketplace el Spring Tools 4.
En nuestro caso hemos usado  `Spring Tools 4 (aka Spring Tool Suite 4) 4.18.1.RELEASE` .

### 2. SOBRE LA BASE DE DATOS
Hay que tener XAMPP o algo similar ejecutándose antes de ejecutar el programa. No hay que crear la base de datos previamente, sino que se crea automáticamente en la primera ejecución del programa.
Por defecto se ejecuta en el `puerto 8080`.

### 3. EJECUCIÓN INICIAL
Hay que hacer un `Maven Install` para compilar el proyecto, que se puede hacer desde la terminal de Eclipse con `mvn install` si tenemos Maven instalado en el ordenador, o
podemos hacerlo haciendo click derecho en la carpeta  principal del proyecto, y darle a `Run as > Maven install`.

Si hay algún problema, se puede hacer un `mvn clean install` en la terminal o simplemente borrar la carpeta `target`.

Una vez compilado el proyecto, damos a `Run as > Spring Boot App` para iniciar la aplicación. No es necesario tener Tomcat, ya que Spring Boot lo trae embebido.



## QUE HACER PARA QUE FUNCIONE TODO CORRECTAMENTE AL EJECUTARSE?

Si no se hacen estos pasos, el resto de la aplicación seguirá funcionando igualmente, pero no se podrá hacer ningún tipo de CRUD con las imágenes.

### 1. CREAR CARPETA

Se crea una carpeta en el lugar preferido del ordenador, que será donde se guarden las imágenes del proyecto, y será necesaria para mostrarlas y hacer el CRUD correspondiente.

### 2. MODIFICAR ARCHIVOS

Se necesita hacer cambios en 2 sitios:

#### 2.2 EN EL ARCHIVO `application.properties`

El archivo con el símbolo de la hoja de Spring Boot, que está en `Java Resources > src > main > resources > application.properties`, necesita ser modificado. Debes colocar la ruta a esa carpeta que se ha creado.

Por ejemplo, tenemos esto ahora:
`spring.web.resources.static-locations=classpath:/static/,file:/Users/cristianfuertesantas/Pictures/ImagenesInsertadasDesdeBd/`

Entonces, todo lo que hay después de `file:`, es la ruta de la carpeta, y es lo único hay que cambiar.

Es decir, esto NO se cambia: `spring.web.resources.static-locations=classpath:/static/,file:`

Y esto SÍ se cambia, con la ruta de la carpeta creada: `/Users/cristianfuertesantas/Pictures/ImagenesInsertadasDesdeBd/`

#### 2.3 EN EL ARCHIVO `GestorImagenes.java `

El archivo está en el paquete `com.tfg.imf.modelo` 

Hay que cambiar esta línea con la ruta de la carpeta creada: `private final String directorioImagenes = "/Users/cristianfuertesantas/Pictures/ImagenesInsertadasDesdeBd/";`

Es decir, el valor de esa varible debe ser la ruta a la carpeta. Debe ser la misma ruta que se puso en el paso anterior.

## EXTRA

### 1. TAMAÑO DE LAS IMÁGENES
En el archivo `application.properties` se pueden cambiar el tamaño máximo permitido para la subida de imágenes:

`spring.servlet.multipart.max-file-size=10MB `
`spring.servlet.multipart.max-request-size=10MB`

### 2. PUERTO DE EJECUCIÓN
En ese mismo archivo también se puede cambiar el puerto de ejecución:

`server.port= 8080`



