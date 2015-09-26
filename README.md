# CoffeeShopFinder_iOS
Solution to automate locating coffee shops with an app

What is it?
-----------
This is a demo application for a solution of "Problem #1: Apps Software engineering requires a lot of caffeine so you
decided to automate locating	coffee with an app. Use the Foursquare API to find the closest coffee shops to your 
location and display them in a list."

Approach
--------
We used "Foursquare API" to fetch nearest Coffee Shops in nearest location of current user. In order to do that 
we used "Core Location" framework to get the current location of user/device and in it's final delegate method we 
called the "Foursquare" service to get the result. To maintain the accuracy we are calling this periodically when
user moved to 100 meters or more. 

Installation
------------
IDE: XCode 6.3
OS: Mac 10.10.3
Language: Swift 1.2
Device: iPhone Only
