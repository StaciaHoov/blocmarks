
# URL Bookmarking App
A social website bookmarking app with email integration.
It allows users to email, manage and share bookmarked URLs.


## Users can
* Sign up and confirm account    
* Reset password
* Create topics and bookmarks from the app interface
* Categorize bookmarks by topic 
* Email an URL to app and have it saved in the database under the designated topic   


## User stories

As a user, I want to 
* view an index of all the bookmarks I've saved, organized by topic.    
* view an index of all bookmarks submitted by all users, organized by topic.    
* "like" another user's bookmark, so that it will appear on my personal bookmark index.    
* "unlike" another user's bookmark, so that it will not appear on my personal bookmark index.    
* delete a bookmark that I submitted from my personal index.
* click on a hashtag topic and then display a view with the entire collection of only related bookmarks.    
* see a list of bookmarks on my personal index that I've added to app, in addition to bookmarks that I've liked from other users.

## Gems used    
* Devise for user authentication to allow users to sign-up    
* Mailgun to congigure app to receive an email containing a bookmark URL          
* Pundit for creating policies for user authorization    

