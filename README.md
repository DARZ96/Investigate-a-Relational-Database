# Investigate a Relational Database 

## Summary 
Used SQL to explore a relational database while working with PostgreSQL. 
Worked through the entire data analysis process, starting by posing a question, 
running appropriate SQL queries to answer the question, 
and finishing by visualizing findings. 

## Dataset 
For this project, I queried the **Sakila DVD Rental database**.
The Sakila Database holds information about a company that rents 
movie DVDs. 

The DVD rental database has many objects including:

- 15 tables
- 1 trigger
- 7 views
- 8 functions
- 1 domain
- 13 sequences

![ERD](https://video.udacity-data.com/topher/2018/September/5ba95d23_dvd-rental-erd-2/dvd-rental-erd-2.png)

Tables:
- actor – stores actors data including first name and last name.
- film – stores films data such as title, release year, length, rating, etc.
- film_actor – stores the relationships between films and actors.
- category – stores film’s categories data.
- film_category- stores the relationships between films and categories.
- store – contains the store data including manager staff and address.
- inventory – stores inventory data.
- rental – stores rental data.
- payment – stores customer’s payments.
- staff – stores staff data.
- customer – stores customers data.
- address – stores address data for staff and customers
- city – stores the city names.
- country – stores the country names.

## Questions Posed
- What is the percentage of rentals per category?
- What is the average rental duration per film category?
- How do the two stores compare in rental orders during every month for all the years we have data for?
- What is the evolution of our customer payments on a month to month basis?

## Setting up Local Environment
### **Step 1. Downloading PostgreSQL**

First, you will need to install PostgreSQL on your local machine. 
The instructions below provide detailed description of the steps you
need to take.

**Installing PostgreSQL for Windows:**
http://www.postgresqltutorial.com/install-postgresql/

**Installing PostgreSQL for Mac OS:**
https://www.postgresql.org/download/macosx/

Friendly reminder! Please write down the database superuser
(postgres) password as you will need it to create the Sakila 
database once you have installed the PostgreSQL server. 

### **Step 2. Downloading Sakila database**
Once PostgreSQL server is installed, you will need to download the Movie database from this page: PostgreSQL Sample Database

Scroll down and click on the orange "Download DVD Rental Sample Database" button.

This will download a zipped file, and you will need to extract the dvdrental.tar file.

![Downloading Database](https://video.udacity-data.com/topher/2018/August/5b6e399c_download-sampledatabase/download-sampledatabase.png)

### **Step 3. Loading database**
The next step is to load the DVD Rental database into your PostgreSQL 
server on your machine. We recommend using the PgAdmin tool. You will 
find the instructions to do so on the following link: Load PostgreSQL 
Sample Database.

The instructions are down ⅓ on this page under the header 
“Load the DVD Rental database using pgAdmin tool”.

The screenshot below shows the blue arrow pointing to the header.

![Screenshot](https://video.udacity-data.com/topher/2018/August/5b6e3b90_load-using-pgadmin-tool/load-using-pgadmin-tool.png)

Now follow the instructions all the way through the header titled 
"Verify the loaded sample database."

Once you have followed the instructions through the end of 
"Verify the loaded sample database.", you have now loaded the 
dvdrental sample database into your local PostgreSQL database server.

### **Step 4. Connecting back to the PostgreSQL server:** 
Relaunch PgAdmin III and click on the PostgreSQL server within the 
Object browser. The screenshot below shows the red arrow pointing 
to PostgreSQL server. Click it and enter your superuser (postgres) 
password.

![pgAdmin](https://video.udacity-data.com/topher/2018/August/5b720f4f_clicking-server/clicking-server.png)

### **Step 5. Connecting to the DVD rental database:**
Next click on the plus sign next to Databases to access the DVD 
rental database. The screenshot below shows the red arrow pointing 
to Databases.

![pgAdmin2](https://video.udacity-data.com/topher/2018/August/5b6e3d18_loadinginpostgresql/loadinginpostgresql.png)

### **Step 6. Choose the DVD Rental database:**
Choose the dvdrental database under Databases. The red arrow in 
the screenshot is pointing towards the dvdrental database.

You should now be linked to the DVD rental database.

![pgAdmin3](https://video.udacity-data.com/topher/2018/August/5b73214b_dvdrentaltar/dvdrentaltar.png)

### **Step 7. Running Queries on your dvdrental database:**
Click on the SQL icon with a magnifying glass to start running queries (see the screenshot 
below with the red square on the icon).

![pgAdmin4](https://video.udacity-data.com/topher/2018/May/5b0d9a05_sqlquery-postgresimage/sqlquery-postgresimage.png)

## Credits
Big thanks to Udacity for providing all the necessary materials 
and content for completing this project.


















 
