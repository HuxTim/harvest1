---
layout: default
---

## Welcome to another page

## [](#header-2)Engineering Problems

Our project involved many different problems challeng-
ing enough where there still exists room for optimiza-
tion. For this section, we explain different algorithms
while also discussing how they could be improved.


## [](#header-3) Building a Shopping List

The Shopping List algorithm currently has the user
input the date and time range for when they are inter-
ested in going shopping. It uses a string to timedate
hash for doing so. From there, it queries to find all the
products at all the open markets for that time. Then it
builds a hash for each market to match with each item
on the shopping list. One advantage of seeding test
data is you know the nature of the data. For this basic
version of the algorithm, it uses string matching as test
stores have a limited amount of products to pick. Then
it outputs the products, sorted by store. This algorithm
could be improved by allowing the user to have the
option to have a more open ended search function, for
instance ’granny smith apples’ produces would produce
all apples. Some NLP could also be added.


## [](#header-3)Producing Accurate Search Results

Initially one of the problems that we faced in imple-
menting the search was figuring out how to search
across many different models at once, at first it seemed
like it would be simple however it proved to be more
complex because it was hard to both accesses the model
fields from the same view and to organize the results in
a logical manner. So to solve this we created a search
controller and from this search controller we called
the search function on each model separately and com-
bined the results in the specific format that we wanted.
Another challenge that we faced was finding a way to
prioritize the search results based on both relevancy
and other attributes such as popularity. We mostly
solved this by configuring the sunspot gem however in
the future we plan to further optimize this.

## [](#header-3)Emailing Product Recommendation

Email recommendations were difficult as the business
logic first had to be thought out. We decided that
users who subscribed to any vendors would receive an
email if any of the users whom they subscribed to had
products marked as a special later than the date for
which the user received the last email. Subscriptions
are manually done through the terminal, in a batch
with all users in the Subscriptions table. Timing would
be too hard to automate for something we felt was easy
for an admin to do. If the user falls into the above group,
then they will receive an email digest including listings
for 3 stores, with each showing at most 2 products that
are specials. If the user does not have 3 subscriptions,
then specials will be generated to fill out the template.
This algorithm could be improved by attaching more
relevant random recommendations to the user.

## [](#header-3)Authentication between Stores and Markets

Setting out to build the business logic between a store
and a market was harder than expected. At first, we
did consider the behavior and allowed for all stores to
enter all markets. This would present an issue though
if the site were deployed as markets could be flooded
with fake data. So we went about looking for a solu-
tion to authenticate a store. We thought about giving
markets the power to send email invitations to join the
market. This process would have been a complicated
as there would need to be some means of encrypting
the URL and having the email be generated at the click
of the button. This was before we did any research into
the Mailer documentation so instead we decided to
implement this by creating two new tables, one to hold
valid relationships between stores and markets, and
another to hold requests to join. We moved some of
the data the store table originally had into these tables
as they held the one-to-many data. From there, on
the front end we made the store creation form include
all the available markets and then on the user profile
a listing for all market requests for any market users.
This solution was easier to implement and prevented
the case we were worried about
