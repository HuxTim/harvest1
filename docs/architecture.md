---
layout: default
---

## Welcome to another page

## [](#header-2)Architecture

## [](#header-3)Using the Ruby on Rails Framework

Part of the goal in COSI 166b was to build an app
on top of the Ruby on Rails framework. That means
Harvest was built using the model-view-controller, or
MVC, architectural pattern. At the high level, we break
down the app between different user entities, their
relationships, and functionalities. With MVC, each of
these categories and business logic is reduced into their
own data model, often a SQL table representing their
information and relations to other entities, views for
outputting the information in a stylized format, and
a controller, a means for the browser to interact with
the model or view.

Like any other Ruby on Rails app, the website’s re-
sponse path starts with a URL router for the browser
to load to the correct controllers. From there, the con-
troller accesses the database to find the appropriate
information to output to the view. This is called the
active record. In our app, for our data models, we used
the sqlite database engine in our testing and devel-
opment environments, postgreSQL in our production
environments.

Styling is done using Bootstrap and CSS, all of which
is passed through the view to the browser. All HTML
and JavaScript, including AJAX, is included in the view.
The subscription feature of our website also makes
use of Ruby on Rail’s Action Mailer, a built in class for
sending emails.

Finally, our project benefited from getting to use
Ruby as our back-end language. Many of the features
within our app’s functionalities were improved by the
usage of Ruby’s massive amount of gem libraries. We
were able to improve search accuracy and implement
JavaScript more quickly using different gems.

## [](#header-3)Designing our Database Model

After coming up with several example user stories, we
set upon building the models for our different users,
their relationships and functionalities. The database is
broken down into all those entities. We use a standard
schema, so all tables have IDs and based off their rela-
tionships, they have foreign keys. Figure 2 shows the
database schema.

After creating an account, a new tuple is created
in the Users table. The only geographical data we
ask for is zip code, which is enough for finding local
farmers markets. The only points where we ask for
specific geographic data is within the Markets table.
Store location can be implied through the market they
conduct business at. This is modeled through a Store-
Markets table. That table is linked to the Requests
table, which is used for linking a vendor’s request for
his store to appear on the market’s store directory.
Users request to become vendors through their pro-
file page. From there, they can start their own store.
At the time of creation, vendors must enter their open
and close time, which must exist within the limits of
the hours of any markets they sell things at. Market
owners then must go to their own profiles to accept any
requests to join their market page. Because of the lim-
ited amounts of farmers markets in the United States,
entry for a farmers market to our site’s database must
be manually done.

Different user functionalities are all contained within
the site’s database model. Reviews for stores and mar-
kets are separated into two tables, both have fields
containing the review, the user, and the entity. Sepa-
rating the two was a design choice to improve retrieval
speeds and to ease coding as a singular table holding
both reviews would need an additional field for dif-
ferentiating the two. Subscriptions and the Shopping
list is simply a table holding the IDs of the respective
entities. In the case of our image storage, the database
models interfaces with the ruby gem, paperclip. The
table’s field is then configured for the gem’s validations
and support image resizing.
