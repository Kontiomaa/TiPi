#4.10.2013
CREATE TABLE orderStatus(
	os_id INT NOT NULL AUTO_INCREMENT,
	orderStatus VARCHAR(100) NOT NULL,
	PRIMARY KEY (os_id)
);

CREATE TABLE orders(
	orders_id INT NOT NULL AUTO_INCREMENT,
	carMake VARCHAR(100) NOT NULL, #or brand?
	carModel VARCHAR(100) NOT NULL,
	carRegister VARCHAR(100) NOT NULL,
	carColor VARCHAR(100),
	collectionDate date NOT NULL,
	collectionTime time,
	#collectionTimeIsNow boolean NOT NULL default 1, not needed?!
	collectionAddress VARCHAR(100) NOT NULL,
	collectionPostalCode VARCHAR(100) NOT NULL,
	collectionCity VARCHAR(100) NOT NULL,
	destinationDate date NOT NULL,
	destinationTime time NOT NULL,
	destinationAddress VARCHAR(100) NOT NULL,
	destinationPostalCode VARCHAR(100) NOT NULL,
	destinationCity VARCHAR(100) NOT NULL,
	clientFname VARCHAR(100) NOT NULL,
	clientLname VARCHAR(100) NOT NULL,
	clientPhoneNo VARCHAR(100) NOT NULL,
	clientCompany VARCHAR(100),
	additionalInformation TEXT,
	nextDestinationCollectionDate date,
	nextDestinationCollectionTime time,
	nextDestinationDate date,
	nextDestinationTime time,
	nextDestinationAddress VARCHAR(100),
	nextDestinationPostalCode VARCHAR(100),
	nextDestinationCity VARCHAR(100),
	nextAdditionalInformation TEXT,
	lastTimeEdited timestamp NOT NULL,
	orderStatus INT NOT NULL,
	PRIMARY KEY (orders_id),
	FOREIGN KEY (orderStatus) REFERENCES orderStatus(os_id)
);

CREATE TABLE companies(
	company_id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(100) NOT NULL,
	address VARCHAR(100) NOT NULL,
	postalCode VARCHAR(100) NOT NULL,
	city VARCHAR(100) NOT NULL,
	PRIMARY KEY (company_id)
);

CREATE TABLE registeredUsers(
	user_id INT NOT NULL AUTO_INCREMENT,
	fName VARCHAR(100) NOT NULL,
	lName VARCHAR(100) NOT NULL,
	phoneNo VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL,
	username VARCHAR(100) NOT NULL,
	password VARCHAR(100) NOT NULL,
	isActive BOOLEAN NOT NULL default 1,
	company INT NOT NULL,
	PRIMARY KEY (user_id),
	FOREIGN KEY (company) REFERENCES companies(company_id)
);

CREATE TABLE userRoles(
	userRole_id INT NOT NULL AUTO_INCREMENT,
	userRoleName VARCHAR(100) NOT NULL,
	PRIMARY KEY (userRole_id)
);

CREATE TABLE usersAndCompanysOrders(
	uco_id INT NOT NULL AUTO_INCREMENT,
	user_id INT NOT NULL,
	company_id INT NOT NULL,
	orders_id INT NOT NULL,
	PRIMARY KEY (uco_id),
	FOREIGN KEY (user_id) REFERENCES registeredUsers(user_id),
	FOREIGN KEY (company_id) REFERENCES companies (company_id),
	FOREIGN KEY (orders_id) REFERENCES orders(orders_id)
);

CREATE TABLE ordersCurrentStatus(
	ocs_id INT NOT NULL AUTO_INCREMENT,
	orders_id INT NOT NULL,
	os_id INT NOT NULL,
	PRIMARY KEY (ocs_id),
	FOREIGN KEY (orders_id) REFERENCES orders(orders_id),
	FOREIGN KEY (os_id) REFERENCES orderStatus(os_id)
);

CREATE TABLE userHasRole(
	uhr_id INT NOT NULL AUTO_INCREMENT,
	user_id INT NOT NULL,
	userRole_id INT NOT NULL,
	PRIMARY KEY (uhr_id),
	FOREIGN KEY (user_id) REFERENCES registeredUsers(user_id),
	FOREIGN KEY (userRole_id) REFERENCES userRoles(userRole_id)
);