# Backend Notification when multiple users working parallel

Required Minimum Shopware Version 5.2

# Installation

## Git Version
* Checkout Plugin in `/custom/plugins/ShyimBackendNotification`
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
* Article

# Images
![Message](http://i.imgur.com/AYBnn9Q.png)
