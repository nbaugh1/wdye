# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project

    -Using Rails v 5.2.3

- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 

    - User has many Visits, has many Restaurants through Visits. Restaurant has many Visits and many Users through Visits.

- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)

    -Visits belong to Users and Restaurants

- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)

    -User.restaurants through Visits, Restaurant.users through Visits

- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)

    - User.restaurants through Visits, Restaurant.users through Visits

- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)

    -Restaurant.name is user submitted

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)

    -various validations included for login (usernames, passwords), visit creation (date and description presence), restaurant creation (uniqness), etc


- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)


- [x] Include signup (how e.g. Devise)

    - bcrypt secure passwords

- [x] Include login (how e.g. Devise)

    - bcrypt secure passwords

- [x] Include logout (how e.g. Devise)

    - REST delete route

- [x] Include third party signup/login (how e.g. Devise/OmniAuth)

    - Google OAuth

- [x] Include nested resource show or index (URL e.g. users/2/recipes)
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
    
    - Errors displayed on sign up page for validation errors

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate