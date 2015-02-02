# Google+ iOS Demo using Swift and a Bridging Header
Demonstration of how to use a bridging header for Google+ Sign-In (iOS and Swift).

There are two projects: one showing just Google+ Sign-in and the other showing
how to use Google Play Games Services from Swift.

Note that the samples require the Google+ and Google Play Games SDK is
uncompressed into the appropriate folder. Get them from the
[Google Play Games downloads page](https://developers.google.com/games/services/downloads/).

## Quick Setup

1. Get a client ID from https://console.deveopers.google.com for Google+ or from
  https://play.google.com/apps/publish for Google Play Games.
2. For the bundle ID, set it to com.gclassy.swiftsignin.
3. Copy the client ID into the Swift app in the ViewController.
4. Run the app.


## Full Setup

1. Modify the bundle identifier in the project to something more appropriate
  for your domain / aps.
2. Update the Scheme defined in the URL handlers in info.plist to match your
  bundle identifier.
3. Register your application with your bundle identifier on
  https://console.developers.google.com for Google+ or
  https://play.google.com/apps/publish for Google Play Games.
4. Copy the client ID into the Swift app in the ViewController.
5. Run the app and sign-in.


## Troubleshooting
* If your application is failing after sign-in, you most likely have
  misconfigured your URL schemes in info.plist.
* If you are seeing an issue with the client not being configured, make sure
  you have set the bundle identifier correctly in the API console and that
  you have set the client ID correctly in your app.
* If you are getting a crash after the user signs in, you might need to add
 the account you are signin in as to the Plat Games console.
