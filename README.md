# Side Starter - Module 2 Side Project Starter Application

This application provides some starter code for a side project based on everything learned in Module 2 (Client-Server Programming in Java).

The overall application consists of several parts:
- a SQL database
- a server with REST APIs for Authentication and Users
- a command line administrative client application

In module 3 we can add a customer facing, Vue single page web application client

Throughout the application, comments at the top of each class and interface explain its purpose.

Before running the application, create the `side` database. Then run the `database/side.sql` script to create the tables with some test users and data.

> Note: The `side.sql` file contains information on the various users and their credentials that are created and available for use when testing.

To run the application, first open the side-starter `server` project and run the `main` method of the `SideProject` class. Once the server is running, you can start the administrative client application.

To run the command line administrative client, open the side-starter `client` project and run the `main` method of the `SideProjectClient` class. You can login with any user account that is in the test data from `side.sql` file — e.g. username: `admin`, password: `password`.

The client allows an admin to view a list of users.  A non-admin client can only log in and log out.  It's up to you to add the functionality for your particular side project.
You can test the endpoints of the server REST API directly using Postman. 