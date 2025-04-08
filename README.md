Before and even during the process of working on this app, I spent quite some time thinking about how to get trending repositories from GitHub. GitHub doesn’t actually provide endpoint to get trending projects, so I had to pick between some approaches — all of them with their own pros and cons.

Here’s a quick overview of the options I was thinking about:
1. Scraping
   I think it might be the only way to get the exact data which was required, but I think there are more cons then pros of using it.
   - There are no guarantess GitHub page won't be changed tomorrow and my app would work.
   - It could violate GitHub's Terms and Policies

2. Use unofficial API
   Many of them are outdated or not actively maintained. They rely on scraping behind the scenes — so we’re back to the same problems as option 1.
   
3. Use official search API
   Use offcial search API filter and sort repositories based on amount of stars and created date. Even though it’s not perfect representation of “Trending” it gets the job done and I spent time for being focus on the app itself. So I chose this approach
   (Fun fact: I originally used an unofficial API, but switched midway for exactly these reasons.)

   
