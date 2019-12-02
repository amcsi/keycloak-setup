# Keycloak example

Based on this blog article: https://scalac.io/user-authentication-keycloak-1/

## Requirements for keycloak server

Java 8 JDK is needed

## Steps

### Server

1. Run it
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
    1. I suggest you add some Email, and First/Last names as well. These will appear in the demo frontend app after logging in.
    1. Click Save.
    1. Go to the Credentials tab.
    1. Enter a password and confirm it. Make it e.g. "pass".
    1. Turn Temporary off (that would force the user to change their password otherwise).
    1. Click "Set Password", then confirm the dialog.
1. Create a client for frontend access
    1. Go to Clients on the left.
    1. Click Create on the right.
    1. Enter a key for the client e.g. `my-react-client`
    1. Enter the root URL of your frontend. In this example: `http://localhost:3000/`.
    1. Click Save. You should be taken to the client detailed edit page.
    1. The defaults should be frontend-ready. Go to the Installation tab, select "Keycloak OIDC JSON" from the dropdown.
    1. Click Download.
    1. Move the downloaded `keycloak.json` file to `public/` in this project. This will let keycloak know which realm and which client your frontend intends to use.

### Web app

1. Run `npm start` to start the React App and go visit the site.
1. Go visit it.
1. Click on "secured component" to see a page that requires you to be logged in.
1. See that you are redirected to the keycloak login page. Login with your test user (username: "test", password: "pass").
1. See that you are in the `/secured` path and you see your user's details. Congrats!

You can refresh the page, and you'll still be logged in. No state is persisted on your webapp; instead, on each page load you get redirected to the auth server, then redirected back right away with your token.
