-- CUSTOMER TABLE
CREATE TABLE customer (
  customerID SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  address VARCHAR(255) NOT NULL,
  phoneNum VARCHAR(20) NOT NULL
);

-- EMPLOYEE TABLE
CREATE TABLE employee (
  employeeID SERIAL PRIMARY KEY
);

-- CATEGORY TABLE
CREATE TABLE category (
  categoryID SERIAL PRIMARY KEY,
  type VARCHAR(50) NOT NULL
);

-- COMPLAINT TABLE
CREATE TABLE complaint (
  complaintID SERIAL PRIMARY KEY,
  complaintDate DATE NOT NULL,
  customerID INT NOT NULL,
  employeeID INT NOT NULL,
  categoryID INT NOT NULL,
  FOREIGN KEY (customerID) REFERENCES customer(customerID),
  FOREIGN KEY (employeeID) REFERENCES employee(employeeID),
  FOREIGN KEY (categoryID) REFERENCES category(categoryID)
);

-- ITEM TABLE
CREATE TABLE item (
  itemID SERIAL PRIMARY KEY,
  description TEXT NOT NULL,
  employeeID INT NOT NULL,
  FOREIGN KEY (employeeID) REFERENCES employee(employeeID)
);

-- REQUEST TABLE
CREATE TABLE request (
  requestID SERIAL PRIMARY KEY,
  requestDate DATE NOT NULL,
  itemID INT NOT NULL,
  customerID INT NOT NULL,
  FOREIGN KEY (itemID) REFERENCES item(itemID),
  FOREIGN KEY (customerID) REFERENCES customer(customerID)
);

-- FEEDBACK TABLE
CREATE TABLE feedback (
  feedbackID SERIAL PRIMARY KEY,
  feedbackDate DATE NOT NULL,
  customerID INT NOT NULL,
  categoryID INT NOT NULL,
  FOREIGN KEY (customerID) REFERENCES customer(customerID),
  FOREIGN KEY (categoryID) REFERENCES category(categoryID)
);
