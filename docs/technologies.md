---
layout: default
---

## Welcome to another page

## [](#header-2)Technologies

Gems are the standard file type for sharing ruby li-
braries to other users. Having these libraries available
drastically improved our ability to implement certain
features of our website and the overall quality of our
project. Without them, our website would not perform
as well as it does. This space is for us to share with you
what technologies were used in which functionalities,
what they did, why we chose them, and the results of
our decisions

## [](#header-3)Search

Our foremost goal was to provide our users an efficient
manner to access the information of a farmers market.
Thus it was natural for our application to implement
a search function. For our application, we decided
the search function had to be able to search through
multiple models at once, while also having the ability
to sort the results based on both the keyword and
the model type. We felt this would improve overall
usability.

Search needed to be able to go through the Products,
Markets, and Stores models. This was because users
were not only looking for specific products, but also
open markets or specific vendors they remembered.
Having a search function allowed us to customize the
overall indexing experience because we had complete
control over how our many different products were
displayed and the means for which they could be sorted.
We wanted our users to be able to view sub-categories
or sort the products based on a certain criteria which
requires a more advanced search functionality.


## [](#header-4)Ransack

To help implement the search function we decided to
use the Ransack gem. Ransack provides a straight-
forward search form for a simple and advanced search
and implements a sort functionality without develop-
ing an overly complex SQL query. It “wraps” selected Ac-
tiveRecord models, providing methods that allow you
to build up any search condition against that model.

## [](#header-4)Sunspot Gem

Since ransack only provides basic text matching for
its search algorithm, we had to incorporate a more
sophisticated search technique such as some natural
language processing and full-text search capabilities.
In order to do this we decided to use the Sunspot Gem.
Sunspot is a Ruby library for expressive, powerful in-
teraction with the Solr search engine. Sunspot is built
on top of the RSolr library, which provides a low-level
interface for Solr interaction, meaning we only had to
interface the model with the gem and run Sunspot pro-
vides a simple and expressive DSL, backed by powerful
features for indexing and searching objects.

## [](#header-3)Email

Halfway through the project, we considered some sort
of follow functionality, similar to Twitter or Yelp. Af-
ter discussing the subject with Brian Del Vecchio, we
talked about specials regular grocery stores advertised
through weekly ads.

Most farmers markets don’t have extensive market-
ing budgets and so we saw an opportunity to provide
value for the markets by giving another avenue for com-
municating with customers. Most normal people find
frequent unsolicited email or mailed advertisements
to be annoying and so we felt that subscribing to a
vendor would then also give the consumer the power
to choose who to receive information about.

## [](#header-4)Rails Action Mailer

Action Mailer is built into the Ruby on Rails Framework.
It is a module that connects views and controller func-
tionality for sending emails. After setting up the email
server through inside the development environments,
a mailer object is generated through the terminal, simi-
lar to generating a controller or model. The mailer acts
similar to a controller, in that you can access the fields
in the models to be input towards the email, which is
also just a view. Because of its closeness to the rest of
the MVC model, using this was not difficult.


## [](#header-3)Image storage

Providing users an opportunity to share their experi-
ence with other users, we felt was part of the Harvest
experience. After looking at other ecommerce sites
or customer engagement platforms, we saw that the
social aspect of most apps encouraged usage. Reviews
help to allow users to share information about markets
and stores in words, but pictures are worth a thousand
words. In order to implement image uploading, image
storage must first be made. This process is also critical
in allowing for stores and markets to build their profile
page to be customized to their wishes. Here we discuss
the libraries for image storage and below we will go
into detail on the javascript library used for the image
upload functionality.

## [](#header-4)paperclip

paperclip offers image storage solutions. Once added
to the gem list and installed, by running a command
through the terminal, a new table can be made con-
figured with the fields necessary for paperclip to be
configured for resizing images. It standardizes all im-
ages for small, medium, and large screens.


## [](#header-4)Amazon Web Services

Cloud image storage can be achieved using Amazon
AWS. Because Heroku does not offer storage services
for the back-end and we do not want to use our own
machines to host images, we went to Amazon for stor-
ing our data. In order to implement this, we had to
create an AWS account and then generate a bucket for
storage which our development environment variables
were configured with using our AWS access key. Modi-
fying paperclip so that storage passed through Amazon
was as simple as changing the target directory.

## [](#header-3)Location Services

Location services were not something we initially con-
sidered beyond the geographic-related fields in the
market databases. After meeting with Pito, he told us
that adding a map showing the location for our markets
would be trivial. He was right. Below are the gems we
used to implement a interactive map for the market
profile.

## [](#header-4) Geocoder Ruby Gem

Geocoder is an app to turn an address into a longitude-
latitude pair. To implement it, after placing it in the
gemlist, executing the coordinates method with the
address as the parameter will be return the longitude
and latitude.


## [](#header-4) Google Maps API

Implementing Google Maps API was pretty much as
simple as above. To put it in the profile view, we simply
insert the JavaScript and input the coordinates into
various methods. Quite straightforward. Currently,
There are many map packages for web development.
We chose Google Maps simply because it was the first
to come to mind.


## [](#header-3)JQuery

jQuery is a JavaScript library that makes event handling
and Ajax more simple to implement. It wraps many
common multi-line Javascript commands into a single
line of code. We use JQuery to implement the below
two additional JavaScript libraries on top of the Ajax
on our site.


## [](#header-4)Dropzone

Dropzone is the JavaScript library we used for image
upload. Dropzone has many benefits. It does more
than such support uploading, which it does through
drag and drop, but it also allows for multithreading and
a graphic for showing upload progress. Dropzone helps
turn something that is usually tedious into something
pretty and natural feeling for the user’s experience.


## [](#header-3)Moment

Moment is another Javascript library. It’s purpose is to
enhance form entry for dates and times. Because we
have fields for several databases that are time-related,
Moment has many points where it can be used. We
implemented it in our app to tie the entry form for
the time to a button on the store and market creation
pages.
