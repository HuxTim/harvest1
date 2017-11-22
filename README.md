# README

# Harvest
<table>
<tr>
<td>
    Harvest is a customer engagement platform for local farmers markets and their consumers.
    Search through your favorite local markets and products.
    Organize your own shopping list and find where to pick up everything you need.
    Give local farmers a platform to tell their personal stories and engage with the community.
</td>
</tr>
</table>

## Feature
- Add BSE (India) Symbol to the current App.
- Decide comparison models of Stocks. (suggestions are most welcome).
- Another WebApp, capable of comparing at least 10 stocks.

## Demo
Here is a live demo deployed on heroku with fake data :  https://harvest-farmermarket.herokuapp.com/


## Notes
In  order to run the search function on the localhost, one must run the command in the terminal

```
- rake sunspot:solr:start
```
Data is also aleeady seeded. This can be redone with

```
- rake db:seed
```


The site is hosted on harvest-farmermarket.herokuapp.com. The search function is not accessible through there as deploying the solr gem on heroku costs fifteen dollars a month



## Site Snapshot

### Home Page

![](https://github.com/HuxTim/harvest1/blob/master/images/homepage.png)
=======
## Site Snapshot

### Home Page

![](https://github.com/HuxTim/harvest1/blob/master/images/homepage.png)

### Sign Up and Sign In Page Form
 Sign Up       								                           | Sign In
---------------------------------------------------------------------- | -------------
![](https://github.com/HuxTim/harvest1/blob/master/images/signin.png)  | ![](https://github.com/HuxTim/harvest1/blob/master/images/login.png)


### Sign Up and Sign In Page Form
![](https://github.com/HuxTim/harvest1/blob/master/images/signin.png)
![](https://github.com/HuxTim/harvest1/blob/master/images/login.png)
 

### Market Home Page


### Store Home Page

### Product Detail Page

### Shopping Schedule

### Market Home Page


## DataBase Schema
![](https://github.com/HuxTim/harvest1/blob/master/images/DataSchema.png)

## Development
Want to contribute? Great!

To fix a bug or enhance an existing module, follow these steps:

- Fork the repo
- Create a new branch (`git checkout -b improve-feature`)
- Make the appropriate changes in the files
- Add changes to reflect the changes made
- Commit your changes (`git commit -am 'Improve feature'`)
- Push to the branch (`git push origin improve-feature`)
- Create a Pull Request

## Bug / Feature Request

If you find a bug (the website couldn't handle the query and / or gave undesired results), kindly open an issue [here](https://github.com/iharsh234/WebApp/issues/new) by including your search query and the expected result.

If you'd like to request a new function, feel free to do so by opening an issue [here](https://github.com/iharsh234/WebApp/issues/new). Please include sample queries and their corresponding results.


## Built with
- [AWS](https://aws.amazon.com/cn/) - DAmazon Web Services offers reliable, scalable, and inexpensive cloud computing services. Free to join, pay only for what you use.
- [dropzone.js](https://http://www.dropzonejs.com/) - DropzoneJS is an open source library that provides drag’n’drop file uploads with image previews
- [PaperClip] (https://github.com/thoughtbot/paperclip) - 
- [Google Maps](https://enterprise.google.com/maps/products/mapsapi.html) - The best of Google's Powerful Mapping for your business
- [bcrypt] (https://rubygems.org/gems/bcrypt/versions/3.1.11) - bcrypt() is a sophisticated and secure hash algorithm designed by The OpenBSD project for hashing passwords. The bcrypt Ruby gem provides a simple wrapper for safely handling passwords.
- [Bootstrap](http://getbootstrap.com/) - Build responsive, mobile-first projects on the web with the world's most popular front-end component library.
- [Sunspot_solr] (https://rubygems.org/gems/sunspot_solr/versions/2.2.6) - Solr provides a bundled Solr distribution for use with Sunspot. Typical deployment environments will require more configuration, but this distribution is well suited to development and testing.
- [Fast-stemmer] (https://github.com/romanbsd/fast-stemmer) - Fast-stemmer is simply a wrapping around multithreaded Porter stemming algorithm. 
- [Byebug] (https://rubygems.org/gems/byebug) - Byebug is a Ruby debugger. It's implemented using the TracePoint C API for execution control and the Debug Inspector C API for call stack navigation. The core component provides support that front-ends can build on. It provides breakpoint handling and bindings for stack frames among other things and it comes with an easy to use command line interface.

## To-Do

- Improve search algorithm 
- Make a more robust search algorithm for more complex searches. Attain faster search speeds by indexing products against markets for better distance related searches.
- Expand Functionality
- Possibly create an algorithm that suggest products, vendors, or markets based on location, preference, and shopping list.

## Team

[![Huiming Jia](https://avatars1.githubusercontent.com/u/22848271?s=460&v=4)](https://github.com/HuimingJia)  | [![Tim Hu](https://avatars3.githubusercontent.com/u/10839338?s=460&v=4)](https://github.com/HuxTim)|[![Yanique](https://avatars3.githubusercontent.com/u/19601821?s=460&v=4)](https://github.com/Y-Seac)|[![Beraa](https://avatars2.githubusercontent.com/u/19803893?s=460&v=4)](https://github.com/bibas28)
---|---|---|---
[Huiming Jia](https://github.com/HuimingJia) |[Tim Hu](https://github.com/HuxTim) |[Yanique](https://github.com/Y-Seac) |[Beraa](https://github.com/bibas28)

