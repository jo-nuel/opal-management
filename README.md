# Project Name: OPAL CARD MANAGEMENT SOFTWARE 

## 41026 Advanced Software Development - Spring 2024

## Group 5:
- Jerry Fu
- Louis Daniel Effendi
- Brandon Maverick Winarto
- Jonathan Immanuel
- Fatin Adas

# RUNNING THE RPROJECT
- Download or clone the project, make sure to be logged into github. Use `git clone https://github.com/jo-nuel/opal-management.git` or download it as .zip/.tar.gz and extract it into your directory. 

- Install JDK 8, Maven, MySQL installed. 
  For MySQL, the root account has user: `root` & pass: `useruser`. You can keep every other setting as default. Alternatively, if you set your root account up in another method, modify the DB user and password variables to match those you used. 

``` java
// Found in DB.java
protected String URL = "jdbc:mysql://localhost:3306/ocms";// replace this string with your jdbc:derby local host url # should be default
protected String db = "ocms";// name of the database 
protected String dbuser = "root";// db root user # default
protected String dbpass = "useruser"; // db root password # hopefully you set it as useruser, if not, adjust
```

# Important Notes: 
- you can use `programNameExample -version` to check if you have something installed, Java, Maven, MySQL, Git, etc etc.
- Whenever you make a change to the code/project/website and would like to see it, make sure you [run these commands](#mvn-commands). 
- Everything inside of `~/target` is entirely temporary, this gets cleansed every single time `mvn clean package` is ran. Always adjust from `~/src`
- staff key for staff registration is : staff

## mvn commands
In the terminal run:
- `mvn clean package` # Rebuilds/recompiles the website
- `mvn jetty:run` # Runs the server/Starts the website

## DATABASE NOTES
Make sure you have MySQL downloaded and setup with a root account. To setup the database we're all using, run the following commands in either Workbench or the terminal.

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

### SQL QUERY FOR CARD LINKING AND SAVED TRIP

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
  `tripID` int NOT NULL AUTO_INCREMENT,
  `tripName` varchar(100) DEFAULT NULL,
  `startLocation` varchar(255) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `userID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`tripID`),
  KEY `fk_user_savedtrip` (`userID`),
  CONSTRAINT `fk_user_savedtrip` FOREIGN KEY (`userID`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
