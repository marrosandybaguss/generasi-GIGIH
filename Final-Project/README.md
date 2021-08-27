# Final Project of Intermediate Phase #GenerasiGIGIH Backend Learning Path

Build Social Media API Aplication

# Implemented scope
1. Post a text that might contain hashtag(s).
    - Maximum limit of a text is 1000 characters
    - A hashtag is a text that is followed by # symbol, for instance: #generasigigih
2. See all posts that contain a certain hashtag.
    - A user can only filter by one hashtag at a time
3. See the list of trending hashtags.
    - Trending hashtags are the top 5 most posted hashtags in the past 24 hours
    - A post containing multiple instances of a hashtag only counts as 1 occurrence for trending hashtags calculation
4. Comment on a post
    - A comment can contain hashtag(s)
    - A hashtag occurrence in a comment is counted in trending hashtags calculation

# Prerequisite
1. Install [Ruby 3.0](https://www.ruby-lang.org/en/downloads/)
2. Install MYSQL
    - Follow [this](https://dev.mysql.com/doc/refman/8.0/en/windows-installation.html) installation process for windows.
    - Follow [this](https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-20-04) installation process for ubuntu.
    - Follow [this](https://dev.mysql.com/doc/refman/8.0/en/macos-installation.html) installation process for ubuntu.
3. Install [Bundler](https://bundler.io/)
    - Install the needed gem
    ```
    gem install sinatra
    gem install mysql2
    gem install dotenv
    gem install rspec
    gem install simplecov
    ```

# Run The Application

1. Create MYSQL Database
   - Login to mysql using the username and password. Copy and paste <a href="documentations/query.sql">query.sql</a> contents to mysql.
   - or import <a href="documentations/query.sql">query.sql</a> with terminal.
   ```
   mysql -u USERNAME -p social_media < query.sql
   ```
    USERNAME is your mysql username.
2. Create .env file
    ```
    export DB_HOST=(host you use, commonly 'localhost')
    export DB_USERNAME=(write your mysql username)
    export DB_PASSWORD=(write your mysql password)
    export DB_NAME='social_media'
    ```
3. Run ruby main.rb.
   - To use the application, see this API Documentation (#api-documentation).

# Test Suite
1. Run `rspec -fd spec` to run all the test specs.
2. Go to <a href="coverage/index.html">SimpleCov</a>, to see detailed test suite.

# API Documentation

- To Posting
   ``` 
   /post 
   ```
   use HTTP POST with ```post``` params in request body. ```post``` param is text you want to post.
- See Posts that contain certain hashtag
   ``` 
   /posts/yourhashtag 
   ```
   use HTTP GET. You will get, id of post, post text, and date post was created.
- Comment a Post
   ``` 
   /comment 
   ```
   use HTTP POST with ```post_id``` and ```comment``` params in request body. ```post_id``` param is id of post which you want to add comment. ```comment``` param is text you want to comment on a post.
- See Trending hastagh
   ``` 
   /trending 
   ```
   use HTTP GET. You will get, hastagh and the position its trending.


