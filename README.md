# Keycloak example

Based on this blog article: https://scalac.io/user-authentication-keycloak-1/

## Requirements for keycloak server

Java 8 JDK is needed

## Steps

### Server

1. Run `bin/download-keycloak.sh` to download keycloak.
1. Run `bin/start-keycloak.sh` to run the keycloak server.
    1. Pass `-Djboss.http.port=<port>` as an argument to change the listening port from the default of 8080.
1. Visit `http://localhost:8080`.
1. Create an initial user in the left column.
1. Enter Administration Console and log in with the user you created.
1. You will see you are in the Master realm. Create a new, different realm, because Master is meant for super admins that have access to the panel you see, unlike regular users. You create a new realm by hovering over Master on the top left under the logo, then clicking "Add realm".
1. Give it a name e.g. "Test", then click Create.
1. Let's create a user. Go to Users on the left menu.
1. Click Add User
1. Enter something for Username e.g. test.
1. Click Save.
1. Go to the Credentials tab.
1. Enter a password and confirm it. Make it e.g. "pass".
1. Turn Temporary off (that would force the user to change their password otherwise).
1. Click "Set Password", then confirm the dialog.

### Web app

1. Run `npm start` to start the React App and go visit the site.
1. Go visit it.
1. Click on 

