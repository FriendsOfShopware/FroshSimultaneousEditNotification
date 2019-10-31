# FroshSimultaneousEditNotification

[![Join the chat at https://gitter.im/FriendsOfShopware/Lobby](https://badges.gitter.im/FriendsOfShopware/Lobby.svg)](https://gitter.im/FriendsOfShopware/Lobby)

Backend Notification when multiple users working parallel


## Requirements

- min. Shopware 5.2.0
- A firebase account (Free account is enought)

# Installation

## Git Version

* Checkout Plugin in `/custom/plugins/FroshSimultaneousEditNotification`
* Install the Plugin with the Plugin Manager

# Add firebase credentials

* If you setup Google Cloud Platform the first time, make shure to select the right location like europe-west3 https://firebase.google.com/docs/projects/locations because you can not change it later on!
* Create new application on https://console.firebase.google.com/ and put js setup code in the plugin configuration
    * Add firebase-database.js (line 3) like `<script src="https://www.gstatic.com/firebasejs/7.2.2/firebase-database.js"></script>` after the firebase js code `<script src="https://www.gstatic.com/firebasejs/7.2.2/firebase-app.js"></script>`
    * Take Care of the Version /7.2.2/
    * It should look like: `<!-- The core Firebase JS SDK is always required and must be listed first -->
    <script src="https://www.gstatic.com/firebasejs/7.2.2/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/7.2.2/firebase-database.js"></script>`

* set public permission rule for the Database https://firebase.google.com/docs/database/security/quickstart
  * Enter your firebase project, click on the Database (develop section on the left, realtime database) and select the Rules tab.
  Permissions should be public, so set it up like: `rules_version = '2';
    service cloud.firestore {
    match /databases/{database}/documents {
    match /{document=**} {
            allow read, write;
            }
        }
    }`

# Currently supported backend sections

* Customer
* Order
* Product
* Emotion

# Images
![Message](http://i.imgur.com/AYBnn9Q.png)


## Contributing

Feel free to fork and send pull requests!


## Licence

This project uses the [MIT License](LICENCE.md).
