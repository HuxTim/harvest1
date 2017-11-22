# README

# Harvest
<table>
<tr>
<td>
Harvest is a customer engagement platform for local farmers markets and their customers. Harvest makes it easy for users to learn about farmers markets, the vendors themselves, and their products. It is meant to provide users with a convenient way to interact with a world of fresh fruit and vegetables. Whether you are new to the farmers market scene or an experienced veteran, our app will have something for you to enhance your farmers market experience. You can make sure your local vendors will have their usual goods or you can do research on a completely new farmers market. Planning your trip becomes easy with our application. 
</td>
</tr>
<tr>
<td>
All of the information you could want is coherently laid out for you. With less than 5 clicks you can find the location and hours of operation of a farmers market along with the vendors and products that will be present. You will never show up to a farmers market and be disappointed to find that the product you are looking for is not there. Finding new products to enjoy and organizing which ones to buy will be a breeze. Harvest takes any stress out of the farmers market experience.
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
 Sign Up | Log In |
-----    | ------- |
![](https://github.com/HuxTim/harvest1/blob/master/images/signup.png)  | ![](https://github.com/HuxTim/harvest1/blob/master/images/login.png) |

 

### Market Home Page

Head  | Store | Review |
---|---|---|
![MarketPage Head](https://github.com/HuxTim/harvest1/blob/master/images/MarketPage.png) |![MarketPage Store](https://github.com/HuxTim/harvest1/blob/master/images/MarketStore.png) |![MarketReview Store](https://github.com/HuxTim/harvest1/blob/master/images/MarketReview.png) |

### Store Home Page
Head  | Products | Review |
---|---|---|
![MarketPage Head](https://github.com/HuxTim/harvest1/blob/master/images/StorePage.png) |![MarketPage Store](https://github.com/HuxTim/harvest1/blob/master/images/StoreProduct.png) |![MarketReview Store](https://github.com/HuxTim/harvest1/blob/master/images/StoreReview.png) |

### Update Store Information
![](https://github.com/HuxTim/harvest1/blob/master/images/UpdateStoreInformation.png)

### Product Detail Page
![](https://github.com/HuxTim/harvest1/blob/master/images/ProductDetail.png) 

### Manage Product
 Add Product Information | Update Product Information |
------    | ------- |
![](https://github.com/HuxTim/harvest1/blob/master/images/AddProduct.png) | ![](https://github.com/HuxTim/harvest1/blob/master/images/UploadProductImage.png) |

### Search Result
![](https://github.com/HuxTim/harvest1/blob/master/images/ProductsPage.png)

### Shopping Schedule
![](https://github.com/HuxTim/harvest1/blob/master/images/ShoppingSchedule.png)

### Personal Profile Page
![](https://github.com/HuxTim/harvest1/blob/master/images/Reviews.png)

### Update User Information
![](https://github.com/HuxTim/harvest1/blob/master/images/UpdateInformation.png)

### Nearby Markets
![](https://github.com/HuxTim/harvest1/blob/master/images/NeabyMarket.png)

### Email Template
![](https://github.com/HuxTim/harvest1/blob/master/images/Email.png)


## DataBase Schema

- After coming up with several example user stories, we set upon building the models for our different users, their relationships and functionalities. The database is broken down into all those entities. We use a standard schema, so all tables have IDs and based off their relationships, they have foreign keys. Figure 2 shows the database schema.

- After creating an account, a new tuple is created in the Users table. The only geographical data we ask for is zip code, which is enough for finding local farmers markets. The only points where we ask for specific geographic data is within the Markets table. Store location can be implied through the market they conduct business at. This is modeled through a Store-Markets table. That table is linked to the Requests table, which is used for linking a vendor's request for his store to appear on the market's store directory.

- Users request to become vendors through their profile page. From there, they can start their own store. At the time of creation, vendors must enter their open and close time, which must exist within the limits of the hours of any markets they sell things at. Market owners then must go to their own profiles to accept any requests to join their market page. Because of the limited amounts of farmers markets in the United States, entry for a farmers market to our site's database must be manually done.

- Different user functionalities are all contained within the site's database model. Reviews for stores and markets are separated into two tables, both have fields containing the review, the user, and the entity. Separating the two was a design choice to improve retrieval speeds and to ease coding as a singular table holding both reviews would need an additional field for differentiating the two. Subscriptions and the Shopping list is simply a table holding the IDs of the respective entities. 
In the case of our image storage, the database models interfaces with the ruby gem, paperclip. The table's field is then configured for the gem's validations and support image resizing.

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


## Built with
- [AWS](https://aws.amazon.com/cn/) - DAmazon Web Services offers reliable, scalable, and inexpensive cloud computing services. Free to join, pay only for what you use.
- [dropzone.js](https://http://www.dropzonejs.com/) - DropzoneJS is an open source library that provides drag’n’drop file uploads with image previews
- [PaperClip](https://github.com/thoughtbot/paperclip) - 
- [Google Maps](https://enterprise.google.com/maps/products/mapsapi.html) - The best of Google's Powerful Mapping for your business
- [bcrypt](https://rubygems.org/gems/bcrypt/versions/3.1.11) - bcrypt() is a sophisticated and secure hash algorithm designed by The OpenBSD project for hashing passwords. The bcrypt Ruby gem provides a simple wrapper for safely handling passwords.
- [Bootstrap](http://getbootstrap.com/) - Build responsive, mobile-first projects on the web with the world's most popular front-end component library.
- [Sunspot_solr](https://rubygems.org/gems/sunspot_solr/versions/2.2.6) - Solr provides a bundled Solr distribution for use with Sunspot. Typical deployment environments will require more configuration, but this distribution is well suited to development and testing.
- [Fast-stemmer](https://github.com/romanbsd/fast-stemmer) - Fast-stemmer is simply a wrapping around multithreaded Porter stemming algorithm. 
- [Byebug](https://rubygems.org/gems/byebug) - Byebug is a Ruby debugger. It's implemented using the TracePoint C API for execution control and the Debug Inspector C API for call stack navigation. The core component provides support that front-ends can build on. It provides breakpoint handling and bindings for stack frames among other things and it comes with an easy to use command line interface.

## To-Do
- Improve search algorithm 
- Make a more robust search algorithm for more complex searches. Attain faster search speeds by indexing products against markets for better distance related searches.
- Expand Functionality
- Possibly create an algorithm that suggest products, vendors, or markets based on location, preference, and shopping list.

## Team

[![Huiming Jia](https://avatars1.githubusercontent.com/u/22848271?s=460&v=4)](https://github.com/HuimingJia)  | [![Tim Hu](https://avatars3.githubusercontent.com/u/10839338?s=460&v=4)](https://github.com/HuxTim)|[![Yanique](https://avatars3.githubusercontent.com/u/19601821?s=460&v=4)](https://github.com/Y-Seac)|[![Beraa](https://avatars2.githubusercontent.com/u/19803893?s=460&v=4)](https://github.com/bibas28)
---|---|---|---
[Huiming Jia](https://github.com/HuimingJia) |[Tim Hu](https://github.com/HuxTim) |[Yanique](https://github.com/Y-Seac) |[Beraa](https://github.com/bibas28)

