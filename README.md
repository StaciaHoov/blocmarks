URL Bookmarking App
A social website bookmarking app with email integration.
It allows users to email, manage and share bookmarked URLs.


Users can:
Sign up and confirm their account. Can reset password and also
email an URL to Blocmarks and have it saved in the Blocmarks database.
categorized blocmarks by topic
send an email to app and create a new bookmark under the designated topic
send email to app with URL and create a new topic
create topics and bookmarks from the app interface


As a user, I want to be able to view an index of all the bookmarks I've saved, organized by topic.
As a user, I want to be able to view an index of all bookmarks submitted by all users, organized by topic.
As a user, I want to be able "like" another user's bookmark, so that it will appear on my personal bookmark index.
As a user, I want to be able to "unlike" another user's bookmark, so that it will not appear on my personal bookmark index.
As a user, I want to be able to delete a bookmark that I submitted from my personal index. ~~ * All bookmarks should be ordered by the date they were submitted, in descending order. ~~
As a user, I want to be able to click on a hashtag topic and then display a view with the entire collection of only related bookmarks.
As a user, I want to see a list of bookmarks on my personal index that I've added to Blocmarks, in addition to bookmarks that I've liked from other users.

Devise for user authentication to allow users to sign-up. App sends email for account confirmation.
Mail gun to congigure app to receive an email containing a bookmark URL (parse and convert incoming emails into bookmark objects that belong to a topic)
Pundit for creating policies for user authorization