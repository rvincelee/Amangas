# Amangas E-Commerce Platform
Amangas is a user-friendly e-commerce web platform developed with Ruby on Rails as a final project from college. 

This project was developed by To Phuc and Vince Lee. 

## Key Features:
* **User Authentication:** Users can create an account and track their orders. If an account is made after purchasing, orders can be linked to the account.

* **Browsing Manga:** Users can browse through the list of available manga sold by the store and filter the search by categories or key words.

* **Shopping Cart:** Using sessions, users can add items to their cart to purchase items in bulk or to purchase at a later time.

* **Secure Payments:** Integration with Stripe for secure and reliable payment processing.

## Setup
Ruby Version 3.1.2

Rails Version 7.0.8

After cloning the repository onto your local machine, navigate to the Amangas folder and migrate the database with the command:

```
rails db:migrate
```

Followed by seeding the database with the command:

```
rails db:seed
```

Tailwind CSS configuration files will also need to be installed. You can do so by using the command:

```
rails tailwindcss:install
```

Enjoy Amangas!

## Preview

**Home Page**

![MicrosoftTeams-image (4)](https://github.com/rvincelee/Amangas/assets/128162169/36ea7649-9741-475b-8f18-9c0b8cf1d872)

**Manga Details**

![MicrosoftTeams-image (5)](https://github.com/rvincelee/Amangas/assets/128162169/411cfff6-6f6c-4eb7-ae2d-677161e26bf0)

**My Cart**

![MicrosoftTeams-image (6)](https://github.com/rvincelee/Amangas/assets/128162169/beacf3d4-4876-43ca-93d1-144243662db3)
