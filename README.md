# Apex App Library Management Oracle

![Oracle](https://img.shields.io/badge/Oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white)
![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E)

This is a web application created in Apex which serves as an interface for managing a library, with each book saved in an Oracle database.

## Setup

- Create a free Apex account and workspace: https://apex.oracle.com/en/learn/getting-started/
- Create a new app in the Apex interface
- In the SQL Workshop tab, add the SQL scripts (sql_scripts/DB_CREATION_AND_INSERTS.sql) and run to set up database.
- In the App Builder tab, select your application, create a new page using the "Create Page" button and open it.
- In the left panel containing the page structure, right-click on Breadcrumb and create a Sub Region called "Shelves".
- Selecting your new region, in the right panel called "Region", go to the Source section and paste the HTML component (html_component/static_component_library.html).
- Then, select your page from the left panel (it should be called something like Page 2: [Your Page Name]), and in the right panel called "Page", go to the JavaScript section and paste the Javascript component into the Function and Global Variable Declaration box (js_component/functionality_component_library.js).
- Then, go to the CSS section and paste the CSS component in the Inline box (css_component/component_style_library.css).
- Afterwards, in the left panel, click on the third tab, right-click on the Ajax Callback drop-down section and select "Create Process".
- Look at the Apex Callbacks (apex_callbacks) folder in our project repo. Create a new process for each file, named EXACTLY the same as the file, save for the extension. On the right panel, in the Source section, paste the PL/SQL code from each file to its corresponding process.
- Save and run, and you should have a working application.

## Functionality

- The interface generates a card for each book in the database, displaying a set of 20 books per page in a 4 x 5 grid. You can select which page to view from a drop-down selector at the top of the application.
- The book cards are styled differently depending on whether or not they are available or already borrowed (the light color means they're unavailable, the darker one means they're available).
- Upon clicking on a book card, below the grid of books, you will see a display bearing information about the selected book.
- At the bottom of the page, you will find buttons to reserve/return a certain book, as well as a field to leave a review. When a book is selected, these buttons will become active, and depending on its availability status you can either mark it as borrowed or available.
- Below the field for adding a review, you can find the Review filter. Selecting "See All Reviews" will open a window allowing you to view every review.

## Future Updates

- Improved UI
- New Functionalities (for example, new review filters)

## Acknowledgements

- Made in collaboration with [trismegistus34](https://github.com/trismegistus34) & [mariazorila4](https://github.com/mariazorila4).
