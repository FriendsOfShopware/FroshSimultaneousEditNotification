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

* Create new application on https://console.firebase.google.com/ and put js setup code in the plugin configuration
* set public permission rule for the Database https://firebase.google.com/docs/database/security/quickstart
  * Enter your firebase project, click on the Database (develop section on the left, realtime database) and select the Rules tab.
  Permissions should be public, so set it up like: `{  "rules": {
      ".read": true,
      ".write": true
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