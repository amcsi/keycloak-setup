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

### Changing the theme

It's possible to change the theme, but you'll need to deal with using ftl templating syntax (Java FreeType). Vscode has a plugin for it. 

1. Go inside the keycloak folder. Substeps are assumed to be relative to that folder.
    1. Edit `standalone/configuration/standalone.xml` and set these values for development to make sure there's no caching:
    ```
        <staticMaxAge>-1</staticMaxAge>
        <cacheThemes>false</cacheThemes>
        <cacheTemplates>false</cacheTemplates>
    ```
    3. Restart (❗) the keycloak server for the standalone.xml changes to take effect.
    1. copy `themes/keycloak` to e.g. `themes/example`. That's the theme you will need to edit.
    1. In `http://localhost:8080` in your realm, go to themes and change your login theme to `example`. You may need to refresh the page for it to appear.
    1. Save.
    1. Logout and go to the secured page for the login prompt again, or just go to http://localhost:3000/ in a private tab.
    1. The login should look the same as before.
    1. In your theme directory, make some example changes:
        1. Make a CSS change
            1. In `login/resources/css/login.css`, locate `.card-pf {` and change the background color from #fff to #aaa (gray).
            1. Copy `../base/login/template.ftl` (neighboring theme folder ❗) to `login/template.ftl`, and edit that file. `base` is the parent theme, and to make an override, you copy the file you want to override over.
        1. Make an HTML change
            1. Open `login/template.ftl`
            1. Locate `<h1 id="kc-page-title"><#nested "header"></h1>` and delete it. This is the title within the login box.
        1. Make a text copy change
            1. Copy to `login/messages/messages_en.properties` over from its base folder.
            1. Change `doLogIn=Log In` to `doLogIn=Submit`.
        1. Save the file changes.
    1. Before refreshing the login page, expect in the white login for for:
        * The box should change to gray from white
        * The title above the form fields should disappear
        * The text for the Log In button on the bottom should change to Submit.
    1. Refresh to see your changes. 
        
    
    
