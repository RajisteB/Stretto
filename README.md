# Stretto
[Homepage ScreenShot](https://github.com/Cityslick/Stretto/blob/master/app/assets/images/stretto-home.png)

Stretto is a music festival "finder" app that allows users to find local or national
music festivals and follow their own favorites!

## User Stories

[Login ScreenShot](https://github.com/Cityslick/Stretto/blob/master/app/assets/images/Log-Screen.png)

As a Stretto user, I should be able to 

- Find local/national festivals
- Get info on those festivals (additional performers, artist recommendations)
- Be able to buy tickets through SeatGeek
- "Favorite" the festivals that I want to keep track of
- Delete festivals that I've tracked
- Sign in/out with email and password


## Planning & Steps


### WireFrame


### 1. Setup
- [x] create file and init git repo
- [x] init Rails app
- [x] install/setup Devise for auth
- [x] config routes, controller and views for initial test
- [x] confirm server and view is working
- [x] config user auth routes and views
- [x] test user auth

### 2. API's & Routing
- [x] config festivals routes 
- [x] test SeatGeek API via Postman
- [x] gem install HTTP Party
- [x] config HTTP party via controller
- [x] test JSON responses and views
- [x] config & test single concert route and views
- [x] config views to display correct api data
- [x] gem install wikipedia-client
- [x] config and test relevant views
- [x] config and test google maps api
- [x] display google maps via lat-lon of event venue


### 3. Database
- [x] add table for user favorites
- [x] add table for festivals saved
- [x] rails db:migrate
- [x] rails db:seed
- [x] rails c to test migrations/seeds

### 4. CRUD Functionality
- [x] create user route to user/favorites page
- [x] config save and delete functionality
- [x] test and confirm user favorites get added to db
- [x] test and confirm user favorites displayed on user page


### 5. Styling
- [x] install MDL - Material Design Lite
- [x] create navbar
- [x] create navbar w/ tabs for index page
- [x] style cards for each individual event
- [x] layout cards via flexbox grid
- [x] style other pages (home, single, favorites, user)
- [x] deploy to Heroku


## Technologies Used

- Ruby on Rails
- HTTPary gem
- Wikipedia API (gem)
- SeatGeek API
- Google Material Design Lite Front-End Framework

Code Snippet:
...Code for Index method with multiple API calls being parsed into JSON

```
def index
        @seatgeek = Rails.application.secrets.seat_geek_api_key || ENV['SEAT_GEEK_API_KEY']
        response = HTTParty.get("https://api.seatgeek.com/2/events?sort=score.desc&q=music+festival&per_page=52&client_id=#{@seatgeek}") 
        recent = HTTParty.get("https://api.seatgeek.com/2/events?sort=datetime_utc.asc&q=music+festival&per_page=52&client_id=#{@seatgeek}") 
        near = HTTParty.get("https://api.seatgeek.com/2/events?sort=datetime_utc.asc&q=music+festival&per_page=52&geoip=true&client_id=#{@seatgeek}")
        newly_announced = HTTParty.get("https://api.seatgeek.com/2/events?sort=announce_date.desc&q=music+festival&per_page=25&client_id=#{@seatgeek}")  
        @res = JSON.parse response.to_s, symbolize_names: true
        @recent = JSON.parse recent.to_s, symbolize_names: true
        @near = JSON.parse near.to_s, symbolize_names: true
        @newly = JSON.parse newly_announced.to_s, symbolize_names: true
    end
```

