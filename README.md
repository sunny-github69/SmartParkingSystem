# SmartParkingSystem
To run this project on your local machine, you will need Apache Tomcat 9 and MYSQL Workbench.
 
 Here are the steps you need to follow:

      👉First, set up the database. 
      👉Create a new schema in your preferred database management system (such as MYSQL) and name it "vpms_db".
      👉Import the "Dump.sql" file into the newly created schema.This file contains the necessary tables and data for the project.

   Download and install Apache Tomcat 9.
      
      Set up the server by following the installation instructions provided with the Apache Tomcat package.

   Next, open your Eclipse IDE 
          
          👉 navigate to "Import" -> "General" -> "Existing Project from Workspace".
          👉 Choose the root directory location of the VPMS folder.
          👉Select the project and import it into your Eclipse workspace.
          👉After importing the project, go to the directory: "src/main/webapp/WEB-INF/lib".
          👉Replace the existing "javax.servletjsp.jstl.jar" file with the one I have provided.


Once you have completed all the setup steps mentioned above, you can run the application by using the "Run as Server" option in Eclipse.
     
