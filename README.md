## Intro
This repository is just a simple application that is used for my portfolio.

This application will not be sold and and no commercial purpose on it. 

Each third party script on this app has own license. There are some scripts that are free to use and some scripts that need to be purchased if you use it on commercial purpose.

I take all image/data without permission and will be used for my portfolio only.

You can freely take anything on this repo, but i will not be responsible when has a problem in the future.

## Main Description
This is a repo of a application about england football match (aka English/Barclays Premier League).
There are 20 team must be match each other on every week. Team information, schedule, match result and list of players is a data on season 2014-2015.

This application has 3 role, that is anonymous, logged user and administrator.
<b>Anonymous</b> has default functionality such as:
- See table ranking (from week 1 - until now)
- See match schedule
- See match result
- See team information (detail team, map, video and list of players)

<b>Logged user</b> role ase the anonymous role and more, such as:
- Sign on google/facebook
- Post a comment of a match
- Give voting which team will be win (home, away or tie)
- Give rating (with value between 1-5)

And the <b>administrator</b> role is the one who manage all thing above
- CRUD team players.
- Manage team schedule every week.
- Change the team data (detail team, slideshow, map and video)
- Change score
- Change table rank

This application divided on some part.
1. Web client (100% finished)
2. Mobile Client (Android/Ios etc 15% finished)
3. Java server (100% finished)
4. Php server (15% finished)
5. Database structure and some  sample data (100% finished)

### Client (<a href="https://github.com/tekdungtralala/eplweb_client">repo link</a>)

Using angular framework for the javascript and adminLTE as the user interfaces.
The data transaction using rest method and json string for the data.
There are the live demo
<a>client with java server (100% finished)</a> and <a> client with php server (15% finished)</a>.

Sorry for low traffict, because i rent a vps with the minimum cost.

### Java server (<a href="https://github.com/tekdungtralala/eplweb_java_server">repo link</a>)

Using spring, hibernate and mysql. And also maven for the instalation.
example api 

[/api/ranks](http://wiwitadityasaputra.info:8080/api/ranks), [/api/ranks/19](http://wiwitadityasaputra.info:8080/api/ranks/19), [/api/matchday](http://wiwitadityasaputra.info:8080/api/matchday), [/api/matchday/19](http://wiwitadityasaputra.info:8080/api/matchday/19)

### Mobile client (<a href="https://github.com/tekdungtralala/weekendmatch_mobile_client">repo link</a>)

The mobile client it self using ionic framework, so can be used on some mobile platform such as ios, android, etc. connected to the server java (Still 30% completed).

<a href="https://github.com/tekdungtralala/weekendmatch_mobile_client/raw/master/latest_file_instalation/weekend-match.apk">Android latest file instalation</a>, <a>Ios latest file instalation.</a>

### Database (<a href="https://github.com/tekdungtralala/weekendmatch/tree/master/database">repo link</a>)

![Alt text](/Screenshot%20from%202017-11-23%2009-25-31.png?raw=true "Optional Title")

