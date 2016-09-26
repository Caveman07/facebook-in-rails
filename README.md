# UZLS Social network 
This is final project done as part of the Odin Project ruby-on-rails course.
![screenshot](screenshots/homepage.png?raw=true "Optional Title")


#Functionality: 
  * Devise gem User registration, email confirmation, password change/forget, Login/Logout, Omniauth Login/Signup with    Facebook
  * Creating posts
  * Friends posts feed  
  * Posting comments to posts
  * Liking Posts
  * Adding/confirming/deleting friends
  * Listing all users of the network
  * Uploading profile pictures (AWS cloud)
  * Semantic UI

# Ruby version
  ruby 2.3.1p112

# Rails version
  Rails 5.0.0.1

# Database 
  Postgres

# UI 
  ![screenshot](screenshots/userpage.png?raw=true "Optional Title")
  
# Deployed on Heroku 
  You can access at: https://shielded-sea-67638.herokuapp.com
# To do:
  The app experiences Error R14 (Memory quota exceeded) problems on Heroku causing frequent app crashes. 
  With the default 1X dyno, the memory limit is set at 512 MB of RAM and the app exceeds this limit on average by 10-30%.
  The easiest solution is to increase dyno size to 1024 MB. However, the problem might be caused by memory leak which I  could't detect yet.
  
  
