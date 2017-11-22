# README

# Harvest?
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


## Demo
Here is a live demo deployed on heroku with fake data :  https://harvest-farmermarket.herokuapp.com/


## Site Snapshot

### Home Page

![](https://github.com/HuxTim/harvest1/blob/master/images/homepage.png)

### Sign Up and Sign In Page Form
 Sign Up       								                           | Sign In
---------------------------------------------------------------------- | -------------
![](https://github.com/HuxTim/harvest1/blob/master/images/signin.png)  | ![](https://github.com/HuxTim/harvest1/blob/master/images/login.png)

### Charts
![](https://iharsh234.github.io/WebApp/images/demo/demo_chart1.JPG)
![](https://iharsh234.github.io/WebApp/images/demo/demo_chart2.JPG)
![](https://iharsh234.github.io/WebApp/images/demo/demo_chart3.JPG)


## Mobile support
The WebApp is compatible with devices of all sizes, and consistent improvements are being made.

![](https://iharsh234.github.io/WebApp/images/demo/mobile.png)




## [Usage](https://iharsh234.github.io/WebApp/)

### Development
Want to contribute? Great!

To fix a bug or enhance an existing module, follow these steps:

- Fork the repo
- Create a new branch (`git checkout -b improve-feature`)
- Make the appropriate changes in the files
- Add changes to reflect the changes made
- Commit your changes (`git commit -am 'Improve feature'`)
- Push to the branch (`git push origin improve-feature`)
- Create a Pull Request

### Bug / Feature Request

If you find a bug (the website couldn't handle the query and / or gave undesired results), kindly open an issue [here](https://github.com/iharsh234/WebApp/issues/new) by including your search query and the expected result.

If you'd like to request a new function, feel free to do so by opening an issue [here](https://github.com/iharsh234/WebApp/issues/new). Please include sample queries and their corresponding results.


## Built with

- [jQuery - Ajax](http://www.w3schools.com/jquery/jquery_ref_ajax.asp) - jQuery simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development.
- [Google Chart API](https://developers.google.com/chart/interactive/docs/quick_start) - Free , Rich Gallery , Customizable and Cross-browser compatible.
- [Bootstrap](http://getbootstrap.com/) - Extensive list of components and  Bundled Javascript plugins.


## To-do
- Add BSE (India) Symbol to the current App.
- Decide comparison models of Stocks. (suggestions are most welcome).
- Another WebApp, capable of comparing at least 10 stocks.

## Team

[![Harsh Vijay](https://avatars1.githubusercontent.com/u/12688534?v=3&s=144)](https://github.com/iharsh234)  | [![Quandl.com](https://github.com/iharsh234/WebApp/blob/master/images/quandl.jpg)](https://www.quandl.com/)
---|---
[Harsh Vijay ](https://github.com/iharsh234) |[Quandl](https://www.quandl.com)

## [License](https://github.com/iharsh234/WebApp/blob/master/LICENSE.md)

Some notes:
In  order to run the search function on the localhost, one must run the command in the terminal -
    
    rake sunspot:solr:start
            
Data is also aleeady seeded. This can be redone with
 
    rake db:seed
 
 The site is hosted on harvest-farmermarket.herokuapp.com
 The search function is not accessible through there as deploying the solr gem on heroku costs fifteen dollars a month
