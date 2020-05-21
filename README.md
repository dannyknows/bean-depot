# The Bean Depot ☕️

The Bean Depot aims to solve a problem of distance between coffee producers and coffee enthusiasts. This two sided marketplace breaks down the geographical barriers with an online platform created for both the consumer and producer, empowering each to find and share the coffee they love.

Traditionally enthusiasts would be restricted to local coffee bean producers, purchasing through a physical coffee shop or directly. Limiting both parties to their local area. The Bean Depot allows coffee to be bought and sold anywhere there is internet and postal services.

[The Bean Depot](bean-depot.herokuapp.com/) \
 and \
 [it's Github Repo](https://github.com/dannyknows/bean-depot)

## Description of the marketplace

### Purpose

the purpose of the bean depot is bring the producers and consumers of coffee closer together, on a platform built for everyone

### Functionality / features

- registered users have a persistent cart
- users can add and remove products to their cart
- producers can create, edit and delete product listings
- admin users can edit and delete products if necessary
- users can edit their personal information after account has been created

### Sitemap

### Screenshots

![Sceenshot!](/readme_assets/website-screenshot-1.png) ![Sceenshot!](/readme_assets/website-screenshot-2.png) ![Sceenshot!](/readme_assets/website-screenshot-3.png) ![Sceenshot!](/readme_assets/website-screenshot-4.png) ![Sceenshot!](/readme_assets/website-screenshot-5.png)

### Target audience

coffee drinkers in isolation and coffee producers with low sales because of social distancing regulations 😉

### Tech stack (e.g. html, css, deployment platform, etc)

- html
- sass
- js
- heroku
- ruby
- ruby on rails
- aws, s3 bucket
- postgresql

## User stories

### as a Consumer I should be able to

- create an account and purchase coffee beans from any listed producers on the website
- update my personal details ensuring they are up to date
- have a persistent cart saving my items for a future purchase
- before signing up to the bean depot I'm able to view and browse current product listings

### as a producer I should be able to

- create a producers account complete with professional details
- have an account with both my personal details and my companies
- create a listing for my products, options to complete with attributes for my coffee and an image
- delete a product listing in the case of it no longer being available for sale
- update an existing product listing in case of a change in it's attributes or if an error was made
- Access information on sales statistics, to compare to my own records

## Wireframes

![index page!](/readme_assets/wireframe-1.png) ![signup page!](/readme_assets/wireframe-2.png) ![create new product page!](/readme_assets/wireframe-3.png)

## Entity Relationship Diagram

![bean depot entity relationship diagram](/readme_assets/ERD.png)

## Explain the different high-level components (abstractions) in your app

The Bean Depot app has X components, the Controllers

### third party services

#### Ruby Gems used

- devise
- aws-sdk-rails
- aws-sdk-s3
- cancancan
- faker
- stripe
- rubocop-rails

## Describe your projects models in terms of the relationships (active record associations) they have with each other

## Discuss the database relations to be implemented in your application

## Provide your database schema design

```text
Table users {
  id bigint [pk]
  isAdmin boolean
  isProducer boolean
  fname string
  lname string
  email string
  password string
}

Table products {
  id bigint [pk]
  name string
  description string
  price int
  grindtype enum
  isDecaf boolean
  purchases int
  producer int
  origin int
}
Table carts {
  id bigint [pk]
  customerid int
  furfilled boolean
}
Table producers{
  id bigint [pk]
  userid integer
  companyName string
}

Table origins{
  id bitint [pk]
  country string
}
Table cartProducts {
  id int [pk]
  cart_id int
  product_id int
}



Ref: "users"."id" < "producers"."userid"

Ref: "producers"."id" < "products"."producer"

Ref: "origins"."id" < "products"."origin"

Ref: "users"."id" < "carts"."customerid"

Ref: "carts"."id" < "cartProducts"."cart_id"

Ref: "products"."id" < "cartProducts"."product_id"
```

## Describe the way tasks are allocated and tracked in your project

Tasks were divided up into specific catagories each relating to its value in relation to an MVP and them divided into TODO, DOING and DONE
