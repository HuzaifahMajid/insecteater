-- Create the Insects table
CREATE TABLE Insects (
    InsectID INT AUTO_INCREMENT PRIMARY KEY,
    Species VARCHAR(100) NOT NULL,
    CommonName VARCHAR(100) NOT NULL,
    Description TEXT
);

-- Create the NutritionalInfo table
CREATE TABLE NutritionalInfo (
    InsectID INT PRIMARY KEY,
    Protein DECIMAL(5,2),
    Fat DECIMAL(5,2),
    Carbs DECIMAL(5,2),
    Calories INT,
    FOREIGN KEY (InsectID) REFERENCES Insects(InsectID)
);

-- Create the CulinaryUses table
CREATE TABLE CulinaryUses (
    InsectID INT,
    Cuisine VARCHAR(100),
    UseDescription TEXT,
    FOREIGN KEY (InsectID) REFERENCES Insects(InsectID)
);

-- Create the Recipes table
CREATE TABLE Recipes (
    RecipeID INT AUTO_INCREMENT PRIMARY KEY,
    InsectID INT,
    RecipeName VARCHAR(100) NOT NULL,
    Ingredients TEXT,
    Instructions TEXT,
    FOREIGN KEY (InsectID) REFERENCES Insects(InsectID)
);

-- Create the Price table
CREATE TABLE Price (
    InsectID INT PRIMARY KEY,
    MarketPrice DECIMAL(6,2),
    FOREIGN KEY (InsectID) REFERENCES Insects(InsectID)
);

-- Create the Users table
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL
);

-- Create the Orders table
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    InsectID INT,
    Quantity INT,
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (InsectID) REFERENCES Insects(InsectID)
);
