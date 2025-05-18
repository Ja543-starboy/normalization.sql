-- Create Orders table (contains order-level information)
CREATE TABLE Orders_2NF (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Create OrderItems table (contains product-level information)
CREATE TABLE OrderItems_2NF (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders_2NF(OrderID)
);

-- Populate Orders table
INSERT INTO Orders_2NF (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName FROM OrderDetails;

-- Populate OrderItems table
INSERT INTO OrderItems_2NF (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity FROM OrderDetails;