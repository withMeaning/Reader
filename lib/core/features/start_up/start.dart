// this is the main entry point for the app

// it serves three functions:

// 0. It shows a splash screen while the app is setting up
// 1. it checks if the user is already logged in (cookie from previous session)
//    a. if not, it redirects to the login page
//    b. if yes, it starts loading the app, see 2.
// 2. it checks if there is internet connection
//    a. if not, it shows the first message from offline storage
//    b. if yes, it calls the backend /now api route, to get the first item
//        displays it, and calls "sync db" in the background

