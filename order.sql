-- Create a new normalized table in 1NF
CREATE TABLE OrderDetails_1NF AS
SELECT OrderID, CustomerName, 'Laptop' AS Product 
FROM ProductDetail WHERE Products LIKE '%Laptop%'
UNION ALL
SELECT OrderID, CustomerName, 'Mouse' AS Product 
FROM ProductDetail WHERE Products LIKE '%Mouse%'
UNION ALL
SELECT OrderID, CustomerName, 'Tablet' AS Product 
FROM ProductDetail WHERE Products LIKE '%Tablet%'
UNION ALL
SELECT OrderID, CustomerName, 'Keyboard' AS Product 
FROM ProductDetail WHERE Products LIKE '%Keyboard%'
UNION ALL
SELECT OrderID, CustomerName, 'Phone' AS Product 
FROM ProductDetail WHERE Products LIKE '%Phone%';

-- Alternative approach using a proper database schema:
-- First create tables properly
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

CREATE TABLE OrderProducts (
    OrderID INT,
    Product VARCHAR(50),
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Then insert the normalized data
INSERT INTO Orders (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName FROM ProductDetail;

INSERT INTO OrderProducts (OrderID, Product)
SELECT OrderID, 'Laptop' FROM ProductDetail WHERE Products LIKE '%Laptop%'
UNION ALL
SELECT OrderID, 'Mouse' FROM ProductDetail WHERE Products LIKE '%Mouse%'
UNION ALL
SELECT OrderID, 'Tablet' FROM ProductDetail WHERE Products LIKE '%Tablet%'
UNION ALL
SELECT OrderID, 'Keyboard' FROM ProductDetail WHERE Products LIKE '%Keyboard%'
UNION ALL
SELECT OrderID, 'Phone' FROM ProductDetail WHERE Products LIKE '%Phone%';