# Acme Browser

## Product Overview
Hello, this project is from the Acme mobile Browser assignment I did for Neeva. My approach to this design was pretty straight-forward. 
I opened the Chrome mobile app on my phone and copied what I liked while leaving out things I didn’t think were relevant to the assignment or things I was unable to implement 
in time. Though I’ve included many features, one that I couldn’t crack no matter the time I spent on it was tabbing. I went through many refactors to get this feature to 
work to no avail. However, for what I did implement I tried to keep it as close to a user experience I would want to see in an app. Any time there was a minor error 
in touch recognition, or a unintuitive button placement I was sure to iterate and work to create the best UX my skills would allow. There are many things I would have 
liked to have changed and/or implemented but my skills and time were limited and this is only my 2nd ever mobile app and first IOS app.
## UI
The UI for this app is fairly simple. In the top right you’ll see a button that’s a bookmark icon. It will bookmark the current page. To the left of this is the url bar with a refresh button on the right. It’s placed near the url entry to make the user immediately aware of it after completing any url entry. I also included a globe icon at the far left. This was mainly for balancing the appearance of the UI a bit since I felt the bookmark bar and refresh button stole the spotlight a bit from the rest of the nav bar. At the bottom are some forward and back buttons for moving between visited pages. To the far right of that is the bookmark icon which triggers a sheet to appear with a list of bookmarks. This sheet will list clickable rows that load the page the bookmark references then automatically closes the sheet. There is also swipe-to-delete implemented for this list. If I could change something about the UI for this bookmark list, it’s that I would have also added an x button to the right of the rows just in case swipe-to-delete isn’t intuitive to every user. But overall, I am happy with the outcome. You can also close this sheet by swiping down, as indicated by a down arrow at the top of the sheet.

 <img src="https://user-images.githubusercontent.com/30948274/124339203-c571e180-db7a-11eb-9fc6-4fba01700be6.png" width="250">


## Additional visual features:
 - Color theme changes between light and dark depending on the system theme
Neeva.com is set as the homepage of the app
## Functionality:
 - Back and forward navigation
 - Refresh pages 
# Advanced Feature:
 - Bookmarking implemented with CoreData with UI to allow for displaying and deleting them
## Bonus Feature:
 - If a query is entered with only “www.” in the beginning “https://” is automatically appended
 - If a user entered something not beginning with “http” or “www.” the app will instead load a search result from Google of the entered text. Essentially, if it can’t load a site it runs a query similar to Chrome’s mobile app. 
  
## Things I want to change
 - I wish I was able to figure out tabbing (I still want to crack this in my free time)
 - I would have liked to check for a internet connection periodically to have a custom error display when there’s no signal
 - I wish I had the time and experience to write tests
 - I would like to have added a visual indicator for whether a website is already bookmarked or not
##Notes:
This app was completely written using Swift and SwiftUI (Also technically UIKit because of WebKit, but it’s wrapped so it works with SwiftUI). I have no experience with UIKit. I had once made a search algo visualizer using Flutter so I was also just more drawn to learn SwiftUI rather than UIKit for this project as the react-style coding is similar between the two. 
##Running the app:
Included in this submission is a zip file that contains the .xcodeproj file and folder with the app code saved in it. This should be all that’s needed to run the app if using Xcode if “Open an existing project” is selected.

