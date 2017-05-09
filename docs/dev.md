---
layout: default
---

## Welcome to another page

## [](#header-2)Development

## [](#header-3)Development Process

Overall, the development process involved more discus-
sion and thinking than programming. For the first few
months, all work on the App was pure brainstorming.
Our group is different in that no one actually suggested
the App. From there we came up with user stories and
features, a basic database schema, and mock ups for
our views.

Once we got past this point, we could start building
our app. Beraa first began with deploying our site to
Heroku. At this stage, we had a home page and a
search bar. From there we began to build our profile
pages for the different entities following our design
mock ups. As we built those pages, we steadily added
Ajax throughout. Credit goes to Ming here mostly.
From its beginning stages, the search bar has steadily
grown from Yanique’s work. It has grown to include
NLP functionality and full text search. Other function-
alities like the shopping list and subscriptions came
later with Tim.

Styling has been a focus throughout development.
We first began with an idea on paper and pen that
did not translate as well as we thought initially. We
had to shelf our idea for the search bar to include
an interactive cow that moo-ed when click behind it.
Things began more minimalistic and reduced as we
tried to only hold and show the most important of
details for each entity.

## [](#header-3)Testing Procedures

While TDD was a focus of the class, we did not prac-
tice it. We started off with some automated testing,
using it for unit testing while validating our models.
Afterwards, most testing was done by reviewing the
business logic through the view and the server. For
instance, when we added the button for subscribing to
a vendor, we pressed the button and then checked the
server output to ensure the correct model interactions
occured. If we were styling, we’d make a change and
refresh the page.

Data seeding was critical for our site. Because our
site is built on the ’data’ of markets, stores, and users,
we had to produce enough data for us to see what the
site appeared like when given real data. By automating
the data seeding we were able to better understand
our views.


## [](#header-3)Deploying onto Heroku

In the beginning, we had some problems deploying to
Heroku. To fix this issue, we had to reformat our data
migrations for postgres and empty the database. This
was troublesome later on as the old data seeding files
did not work right away with postgres.
