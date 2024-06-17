CREATE TABLE InsuranceCom (
	name VARCHAR(200) PRIMARY KEY,
	phone INT
);

CREATE TABLE Person (
	ssn INT PRIMARY KEY,
	name VARCHAR(200)
);

CREATE TABLE Driver (
	driverID INT,
	driverSSN INT PRIMARY KEY,
	FOREIGN KEY(driverSSN) REFERENCES Person(ssn)
);

CREATE TABLE NonProfessionalDriver (
	driverSSN INT PRIMARY KEY,
	FOREIGN KEY(driverSSN) REFERENCES Driver(driverSSN)
);

CREATE TABLE ProfessionalDriver (
	driverSSN INT PRIMARY KEY,
	medicalHistory VARCHAR(200),
	FOREIGN KEY(driverSSN) REFERENCES Driver(driverSSN)
);

CREATE TABLE Vehicle (
	licensePlate VARCHAR(10) PRIMARY KEY,
	year INT,
	insuranceName VARCHAR(200),
	ownerSSN INT,
	maxLiability FLOAT,
	FOREIGN KEY(insuranceName) REFERENCES InsuranceCom(name),
	FOREIGN KEY(ownerSSN) REFERENCES Person(ssn)
);

CREATE TABLE Car (
	licensePlate VARCHAR(10) PRIMARY KEY,
	make VARCHAR(200),
	FOREIGN KEY(licensePlate) REFERENCES Vehicle(licensePlate)
);

CREATE TABLE CarDriver (
	licensePlate VARCHAR(10),
	driverSSN INT,
	PRIMARY KEY (licensePlate, driverSSN),
	FOREIGN KEY(driverSSN) REFERENCES NonProfessionalDriver(driverSSN),
	FOREIGN KEY(licensePlate) REFERENCES Car(licensePlate)
);


CREATE TABLE Truck (
	licensePlate VARCHAR(10) PRIMARY KEY,
	driverSSN INT,
	capacity INT,
	FOREIGN KEY(driverSSN) REFERENCES ProfessionalDriver(driverSSN),
	FOREIGN KEY(licensePlate) REFERENCES Vehicle(licensePlate)
);

-- b/ The "insures" relationship is represented by by the columns insuranceName and maxLiability in the Vehicle relation.
-- It is my representation because one vehicle cannot have more than one insurance, therefore we can ensure its uniqueness in the vehicle relation.

-- c/ The "drives" relationship is represented as a many-to-many relationship, meaning that one driver can have multiple cars and one car can be used by multiple drivers
-- The "operates" relationship is represented as a many-to-one relationship, meaning that one truck can only be driven by one driver. 
-- Therefore in my schema, I have created a relation called "CarDriver" to represent this multi-to-multi relationship, while information on truck drivers can be referenced directly using the driver ID without explicitly create another table. 
