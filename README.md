## Capstone Mail Service

### How to run the system

First, start the Colima by typing "colima start" in command line

Just one step: type **make up_build** to build the application and run docker-compose.yml to load all the dependencies

**For Testing**

Open postman, and try to test the micro-service

- Get, http://localhost:8084, return a welcome message
- Post, http://localhost:8084/send and send a message to an email address.
- Other queries, please see the Postman shared workspace.

**Stop Container**

Type **make down** to stop the system.
