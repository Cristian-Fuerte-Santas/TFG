# Final Degree Project (TFG) - Web Application Developtment

This project was originally developed in Spanish as my final project for the Higher Technician Diploma in Web Application Development. Variable names, comments and some file names remain in Spanish to preserve the original project.

## EXPLANATION

Since a real server is not being used, images are saved on the local computer of the person running the application; therefore, several steps are required.
These images have a 10 MB upload limit, though this can be modified according to the user's preference.


## REQUIREMENTS

### 1. IDE
This is a Spring Boot project; if using Eclipse, you must install "Spring Tools 4" from the Eclipse Marketplace.
In our case, we used `Spring Tools 4 (aka Spring Tool Suite 4) 4.18.1.RELEASE`.

### 2. DATABASE
You must have XAMPP (or similar software) running before launching the program. There is no need to create the database beforehand; it is created automatically the first time the program runs.
By default, it runs on `port 8080`.

### 3. INITIAL EXECUTION
You need to perform a `Maven Install` to compile the project. This can be done via the Eclipse terminal using `mvn install` (if Maven is installed on your computer) or
by right-clicking the main project folder and selecting `Run as > Maven install`.

If any issues arise, you can run `mvn clean install` in the terminal or simply delete the `target` folder.

Once the project is compiled, select `Run as > Spring Boot App` to start the application. Tomcat is not required, as Spring Boot includes an embedded version.



## WHAT MUST BE DONE FOR EVERYTHING TO WORK CORRECTLY?

If these steps are not followed, the rest of the application will still function, but you will be unable to perform CRUD operations involving images.

### 1. CREATE FOLDER

Create a folder at a location of your choice on your computer; this is where project images will be stored, and it is necessary for displaying them and performing the corresponding CRUD operations. ### 2. MODIFYING FILES

Changes need to be made in two places:

#### 2.2 IN THE `application.properties` FILE

The file marked with the Spring Boot leaf icon—located at `Java Resources > src > main > resources > application.properties`—needs to be modified. You must enter the path to the folder that was created.

For example, we currently have this:
`spring.web.resources.static-locations=classpath:/static/,file:/Users/cristianfuertesantas/Pictures/ImagenesInsertadasDesdeBd/`

So, everything following `file:` is the folder path, and that is the only part that needs changing.

In other words, this part does NOT change: `spring.web.resources.static-locations=classpath:/static/,file:`

And this part *does* change to the path of the created folder: `/Users/cristianfuertesantas/Pictures/ImagenesInsertadasDesdeBd/`

#### 2.3 IN THE `GestorImagenes.java` FILE

This file is located in the `com.tfg.imf.modelo` package.

You need to update this line with the path to the created folder: `private final String directorioImagenes = "/Users/cristianfuertesantas/Pictures/ImagenesInsertadasDesdeBd/";`

In other words, the value of that variable must be the folder path. It must be the same path used in the previous step.

## EXTRA

### 1. IMAGE SIZE
In the `application.properties` file, you can change the maximum allowed size for image uploads:

`spring.servlet.multipart.max-file-size=10MB `
`spring.servlet.multipart.max-request-size=10MB`

### 2. EXECUTION PORT
In that same file, you can also change the execution port:

`server.port= 8080`
