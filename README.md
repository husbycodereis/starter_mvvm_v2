# Technical Challenge - Movies Catalog

## Westerops Implementation

* Login screen
* Home screen
* Search screen
* Detail screen
* Favorites screen
* Watchlist screen
* Profile screen

---------- 

* Login screen

  ![login](https://i.imgur.com/aUOqy3f.png)

  1. A functional Login screen with a fake API => https://reqres.in.
  Use this email and password for succesful login. (email: eve.holt@reqres.in / password: cityslicka)
  2. Email & password controller and validation
  3. Error Snackbar after failed response
  4. Login Snackbar after successful response
  

* Home screen

   ![Home](https://i.imgur.com/hp9LbGX.png)

  1. Dashboard of top movies
  2. Scroll to see more results
  3. 20 results in each scroll. When the end of the list is reached, a new request with next 20 movies is initiated.
  4. Tap to see movie details

* Search screen

   ![Search](https://i.imgur.com/CGvvJIe.png)

  1. Search feature implemented with a throttle helper method. The method adds a delay between each keyboard entry. Once the user completes typing, then the search request with the given query is initiated.
  2. Cancel button to clean search query entry
  3. Tap to see movie details

* Detail screen

   ![Detail](https://i.imgur.com/322QHr6.png)

  1. See movie details, ratings, description
  2. Fetch casts and see the cast list in horizontal scroll view
  2. Add or remove a movie from favorites
  3. Add or remove a movie from watchlist
  4. Get movie favorite & watchlist status from cache

* Favorites screen

   ![Favorites](https://i.imgur.com/ZK2C885.png)

  1. See favorited movies in the list
  2. tap a movie to go to details
  3. slide a movie from right to left to remove the movie from the favorites

* Watchlist screen

   ![Watchlist](https://i.imgur.com/pIYdk5M.png)

  1. Create custom watchlists.
  2. Slide a watchlist to the left and delete it.
  3. Tap on a watchlist to see added movies.
  4. tap a movie to go to details
  5. slide a movie from right to left to remove the movie from the watchlist

* Profile screen
  
  ![Profile](https://i.imgur.com/FpHjwSd.png)![Profile](https://i.imgur.com/Sm2VBD7.png)

  1. See user information
  2. Toggle dark / light theme
  3. Open a webpage in webview
  4. Logout


### Optional WesterOps Implementations(Bonus)
* MVVM design pattern
* ​Offline Cache on login status, favorite and watchlist items
* ​Unit Test of main features (Local Database / Search Service / Login Service / Top Movies / Movie Details)
* Settings page implementation to change theme and / or logout
* Dependency Injection with Get_It package
* Dark / Light Theme and it's caching
* Lottie animations on Theme icons in Settings page

### Technical Details
* Design tool ⇨ Adobe XD
* Authentication ⇨ https://reqres.in (fake API)
* Database ⇨ Sembast & Shared Preferences
* Code architecture ⇨ MVVM
* State management ⇨ MobX & Provider
* HTTP request ⇨ Dio & Vexana
* Dependency Injection ⇨ Get_It

---------- 
## The Movie DB API
The Movie DB ​has a lot of APIs that meet above functionalities. You are expected to discover these APIs.
* API brief: ​https://www.themoviedb.org/documentation/api
* Discover API documentation: ​https://developers.themoviedb.org/3/discover/movie-discover 
* To be able to send a request to this api, you need an API key. You should be register from api link, and get your api key from there.
* For image loading details: ​https://developers.themoviedb.org/3/getting-started/images 
