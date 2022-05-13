# TwitterClone


## Overview

* This app is intended to be a working replica of Twitter


### Requirements

* iOS 8.0+ / Mac OS X 10.11+ / tvOS 9.0+
* Xcode 9.0+
* Swift 4.0+


## Install

* [Firebase](https://firebase.google.com/docs) 
* [SDWebImage](https://github.com/SDWebImage/SDWebImage)
 
## Features

* This replica of Twitter is built programmatically usin MVVM architecture with backend in Firebase. It is still under development and being built and branched by features. Sections listed below are complete.

* Main User interface: 
  * File setup for programmatic project building 
  * Set up navigation bars and controllers
  * Add cutom action button, custom twitter color and action handler for button 

* Login/Sigup UI:
  * Configure view for login using container view
  * Refactor container view for view reusability
  * Setup registration view with refactored container view
  * Configure profile image selection 

* Firebase setup:
  * Add Firebase dependancy to app (see installation)
  * Test user authentication
  * Uploading user data
  * Uploading user profile image 
  * Refactor Api code into a service class
  * Keep user logged in/keeping a user logged in
  * UI update after logging in

* Getting user data from Firebase:
  * Create model to fetch user info from Firebase
  * SDWebImage dependancy injection and passing to main feed controller
  * Loading user profile image 

* Sending Tweets:
  * Configure upload tweet controller and UI setup
  * Configure TextView 
  * Upload tweet to Firebase

* Loading Tweets in feed:
  * Fetch tweets from firebase and Tweet object creation
  * Set up collection view for main feed controller
  * Configure tweet cell with action buttons
  * Populate feed with tweets from Firebase
  * Add timestamp


* User Profile:
  * Adding profile controller segue to main tab controller 
  * Setup Profile collection view UI, header UI, filter bar
  * Create profile header view model and profile filter data model 
  * Fetch current user tweets from Firebase
  * Populate header with user data

* Following, Unfollowing & Searching:
  * Configure search page UI
  * Populate search with firebase users
  * Configure follow and unfollow user
  * Check with firebase to confirm if user is followed


* Replying to Tweets:
  * Configure tweet display controller
  * Configure tweet header UI
  * Confifure action button
  * Populate tweet header
  * Dynamic cell sizing
  * Configure replies
  * Upload replies to firebase 
  * Fetch and display replies


* Custom Action Sheet:
  * Configure custom window and tableview for action sheet 
  * Animating tableview / fade view


