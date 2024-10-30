# Project Name: OPAL CARD MANAGEMENT SOFTWARE 

## 41026 Advanced Software Development - Spring 2024

## Group 5:
- 24821466 Jerry Fu
- 14545317 Louis Daniel Effendi 
- 14545331 Brandon Maverick Winarto 
- 14487692 Jonathan Immanuel 
- 24506800 Fatin Adas 

# IMPORTANT
For the user [go here!](#Users-Manual)

For the engineers [go here!](#Engineers-Manual)

---

# Users Manual

Welcome to the Opal Card Management System! This platform allows you to efficiently manage your Opal card, trip planning, travel history, FAQs, contact us for support, and much more. Follow the steps below to start using the system.

### System Requirements:
- A modern web browser (Firefox, Brave, Florp, Arc, Chrome)
- Internet connection

We offer our current features:
- [Account Management](#accounts)
- [Managing Your Opal Card](#managing-your-opal-card)
- [Event Management](#events)
- [Contacting Support](#contacting-support)
- [FAQ](#faq)


## Accounts 
```(Fatin - F101)```
### Login:
1. On the homepage, click Login.
2. Enter your email and password.
3. Click Submit to log in.

### Or Register:
1. On the homepage, click Register if you are a new user.
2. Fill out the required fields, such as name, email, and password.
3. Submit your details to log in with your new account.

### You're set!
From here, you can start using our management system. 

## Managing your opal card 
```(Jonathan - F102)```
Once logged in to the system, you are directed to your card page. 
In the page you are able to link your cards, edit, or remove them. 
Make sure to enter the correct credentials when attempting the functionalities above.

## Events 
```(Fatin - F109)```

- For admin can manage and add events
- For user once logged in and access the events page from navbar can see and filter through events.

## Contacting Support 
```(Jerry - F110)```

You can contact us! 

We're phone is `+61 2 8806 0230`, you can also email us at `international@uts.edu.au`, or finally, you can simply walk right in at `15 Broadway Ultimo, NSW 2007`.

Alternatively, send us a message with your name, email and message and we'll respond as soon as possible!

## FAQ 
```(Jerry - F110)```

Our FAQ has multilingual support for English (EN), 中文 (ZH) and Tiếng Việt (VN). More, soon to be added! 

---

## Saved Trips
```(Jonathan - F102)```
Saved trips are essentially the ability to make a shortcut to your most frequent trip planners.
You can access your saved trips through the navigation bar. Once in the page, you can add a saved trip and edit or remove them.
You are also able to label your saved trips which helps organize your saved trips.

# Engineers Manual

## Repo Structure:
Our repo follows the Model View Controller (MVC) structure. to ensure separation between data, user interface, and business logic.
- **Model**: Contains classes responsible for interacting with the database (`src/main/java/uts/isd/dao` folder). Handles database interactions, executing queries, and managing data through DAO classes.

```Example: DBManager.java, ContactDAO.java, OpalCardDAO.java.```

- **View**: Consists of JSP files that define the UI and pages presented to the user (`src/main/webapp` folder). Contains JSP files for user-facing pages and CSS for styling.

```Example: main.jsp, login.jsp, faq.jsp, contact.jsp.```

- **Controller**: Contains servlets that handle requests and control the flow between the Model and View (`src/main/java/uts/controller` folder). Servlet classes handle requests, coordinate between the Model and View.

```Example: LoginServlet.java, ContactServlet.java, AdminListUsersServlet.java.```

##  RUNNING THE PROJECT

### Pre-requisites
- Install JDK 22, Maven, MySQL installed. 
  For MySQL, the root account has user: `root` & pass: `useruser`. You can keep every other setting as default. Alternatively, if you set your root account up in another method, modify the DB user and password variables to match those you used. 

```java
// Found in DB.java
protected String URL = "jdbc:mysql://localhost:3306/ocms";// replace this string with your jdbc:derby local host url # should be default
protected String db = "ocms";// name of the database 
protected String dbuser = "root";// db root user # default
protected String dbpass = "useruser"; // db root password # hopefully you set it as useruser, if not, adjust
```

### Initialising
- Download or clone the project, make sure to be logged into github. Use `git clone https://github.com/jo-nuel/opal-management.git` or download it as .zip/.tar.gz and extract it into your directory.
- Open up MySQL, log into your root account, preferably `root` with `useruser`. Insert the MySQL statements found [here.](#database-setup)
- Open the project in your chosen IDE. [Run these commands](#mvn-commands) to start.  

### Misc Notes: 
- you can use `programNameExample -version` to check if you have something installed, Java, Maven, MySQL, Git, etc etc.
- Whenever you make a change to the code/project/website and would like to see it, make sure you [run these commands again](#mvn-commands). 
- Everything inside of `~/target` is entirely temporary, this gets cleansed every single time `mvn clean package` is ran. Always adjust from `~/src`
- The staff key for staff registration is : `staff`

### `mvn` commands
TO SEE CHANGES: In the terminal run these commands every time:
- `mvn clean package` # Rebuilds/recompiles the website
- `mvn jetty:run` # Runs the server/Starts the website

## DATABASE SETUP
If you initialise a new database and use it, please add it here. Make sure you have MySQL downloaded and setup with a root account. To setup the database we're all using, run the following commands in either Workbench or the terminal.

- Create the ocms database:
```sql
CREATE DATABASE ocms;
```

- Use the ocms database:
```sql
USE ocms;
```

- Create the events table:
```sql
CREATE TABLE events (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(100),
    description TEXT,
    event_date DATE,  
    location VARCHAR(255), 
    PRIMARY KEY (id)
);

```

- Create the users table:
```sql
CREATE TABLE users (
    id VARCHAR(10) NOT NULL,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100),
    status VARCHAR(50),
    role VARCHAR(50),
    PRIMARY KEY (id)
);
```

- Create the access table (based on your database structure):
```sql
CREATE TABLE access (
    email VARCHAR(100),
    action VARCHAR(255),
    date DATE,
    time TIME,
    PRIMARY KEY (email, date, time),
    FOREIGN KEY (email) REFERENCES users(email)
);
```

### CARD LINKING AND SAVED TRIP

- Create table:
```sql
CREATE TABLE `opalcard` (
  `cardID` int NOT NULL AUTO_INCREMENT,
  `cardNumber` varchar(20) NOT NULL,
  `cardName` varchar(100) DEFAULT NULL,
  `balance` double NOT NULL,
  `cardStatus` enum('ACTIVE','DISABLED') DEFAULT 'ACTIVE',
  `userID` varchar(10) DEFAULT NULL,
  `cardSecurityCode` varchar(10) NOT NULL,
  PRIMARY KEY (`cardID`),
  KEY `fk_user_opalcard` (`userID`),
  CONSTRAINT `fk_user_opalcard` FOREIGN KEY (`userID`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
```

- Create table:
```sql
CREATE TABLE `savedtrip` (
  `savedTripID` int NOT NULL AUTO_INCREMENT,
  `savedTripName` varchar(100) NOT NULL,
  `startLocation` varchar(255) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `userID` varchar(10) NOT NULL,
  `label` varchar(100),
  PRIMARY KEY (`savedTripID`),
  KEY `userID` (`userID`),
  CONSTRAINT `savedtrip_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
```

### MESSAGE SUBMISSION, THE CONTACT US

- Create table:
```sql
CREATE TABLE contact_submissions (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    message TEXT NOT NULL,
    submission_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);
```
### TRIP PLANNING AND FARES

- Create table:
```sql
CREATE TABLE `Routes` (
  `routeID` INT NOT NULL AUTO_INCREMENT,
  `startLocation` VARCHAR(255) NOT NULL,
  `destination` VARCHAR(255) NOT NULL,
  `cost` DOUBLE NOT NULL,
  `travelTime` INT NOT NULL,
  PRIMARY KEY (`routeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
```

- Create table:
```sql
CREATE TABLE `Trips` (
  `tripID` INT NOT NULL AUTO_INCREMENT,
  `tripName` VARCHAR(100) DEFAULT NULL,
  `userID` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`tripID`),
  KEY `fk_user_trip` (`userID`),
  CONSTRAINT `fk_user_trip` FOREIGN KEY (`userID`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
```
-- ocms.lost_stolen_cards definition

### Lost and stolen and alerts and notifications
CREATE TABLE `lost_stolen_cards` (
  `reportID` int NOT NULL AUTO_INCREMENT,
  `cardID` int DEFAULT NULL,
  `userID` varchar(255) DEFAULT NULL,
  `reportType` varchar(10) DEFAULT NULL,
  `reportDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`reportID`),
  KEY `cardID` (`cardID`),
  KEY `userID` (`userID`),
  CONSTRAINT `lost_stolen_cards_ibfk_1` FOREIGN KEY (`cardID`) REFERENCES `opalcard` (`cardID`),
  CONSTRAINT `lost_stolen_cards_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
