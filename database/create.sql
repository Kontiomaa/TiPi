#23.10.2013
#Latest isActive -> userIsActive

CREATE TABLE userRoles(
	userRole_id INT NOT NULL AUTO_INCREMENT,
	userRoleName VARCHAR(100) NOT NULL,
	PRIMARY KEY (userRole_id)
);

CREATE TABLE orderStatus(
	status_id INT NOT NULL AUTO_INCREMENT,
	orderStatus VARCHAR(100) NOT NULL,
	PRIMARY KEY (status_id)
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
	password VARCHAR(100) NOT NULL,
	userIsActive BOOLEAN NOT NULL default 1,
	myRole INT NOT NULL,
	myCompany INT NOT NULL,
	PRIMARY KEY (user_id),
	FOREIGN KEY (myRole) REFERENCES userRoles(userRole_id),
	FOREIGN KEY (myCompany) REFERENCES companies(company_id)
);

CREATE TABLE orders(
	orders_id INT NOT NULL AUTO_INCREMENT,
	carBrand VARCHAR(100) NOT NULL,
	carModel VARCHAR(100) NOT NULL,
	carRegister VARCHAR(100) NOT NULL,
	carColor VARCHAR(100),
	collectionDate date NOT NULL,
	collectionTime time NOT NULL,
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
	companyMadeOrder INT NOT NULL,
	userMadeOrder INT NOT NULL,
	statusOfOrder INT NOT NULL default 1,
	lastTimeEdited timestamp NOT NULL,
	hasNewDestination boolean NOT NULL default 0,
	#if 1, read nextDestination -data.
	nextDestinationCollectionDate date,
	nextDestinationCollectionTime time,
	nextDestinationDate date,
	nextDestinationTime time,
	nextDestinationAddress VARCHAR(100),
	nextDestinationPostalCode VARCHAR(100),
	nextDestinationCity VARCHAR(100),
	nextAdditionalInformation TEXT,
	PRIMARY KEY (orders_id),
	FOREIGN KEY (companyMadeOrder) REFERENCES companies(company_id),
	FOREIGN KEY (userMadeOrder) REFERENCES registeredUsers(user_id),
	FOREIGN KEY (statusOfOrder) REFERENCES orderStatus(status_id)
);