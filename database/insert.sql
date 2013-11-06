#30.10.13 12:17
#tested.

#Roles
INSERT INTO userRoles (userRoleName)
VALUES ('ROLE_USER');

INSERT INTO userRoles (userRoleName)
VALUES ('ROLE_ADMIN');

#OrderStatus
INSERT INTO orderStatus (orderStatus)
VALUES ('Odottaa hyväksyntää');

INSERT INTO orderStatus (orderStatus)
VALUES ('Hyväksytty');

INSERT INTO orderStatus (orderStatus)
VALUES ('Odottaa palautusta');

INSERT INTO orderStatus (orderStatus)
VALUES ('Valmis');

INSERT INTO orderStatus (orderStatus)
VALUES ('Laskutettu');

#TestCompanies
INSERT INTO companies (name, address, postalCode, city)
VALUES ('Testi firma', 'testiosoite', '02100', 'Helsinki');

INSERT INTO companies (name, address, postalCode, city)
VALUES ('testii firma', 'testiosoitee', '01000', 'Helsinki');

INSERT INTO registeredUsers (fName, lName, phoneNo, email, password, myRole, myCompany)
VALUES ('Matti', 'Meikäläinen', '0400123123', 'matti.meikalainen@email.com', 'b8e4f2849d72a1ed34599ebffcedd0babf0ea84aa3f815ca498a7f50f14ee327a0577d8ef7336fb4', 1, 1);

INSERT INTO registeredUsers (fName, lName, phoneNo, email, password, myRole, myCompany)
VALUES ('Timo', 'Tomera', '0400456456', 'timo.tomera@email.com', '6cc7ef452efe0fef758c3fe2d0d8f23dc4d0a8fb26eff1a64598a02d8c1117a106b8507b65c206ba', 2, 2);

#TestOrder
INSERT INTO orders (carBrand, carModel, carRegister, carColor, collectionDate, collectionTimeFrom, collectionTimeTo, collectionAddress, 
collectionPostalCode, collectionCity, destinationDate, destinationTime, destinationAddress, destinationPostalCode,
destinationCity, clientFname, clientLname, clientPhoneNo, clientCompany, additionalInformation, companyMadeOrder,
userMadeOrder, statusOfOrder, nextDestinationCollectionDate, nextDestinationCollectionTimeFrom, nextDestinationCollectionTimeTo, nextDestinationDate,
nextDestinationTime, nextDestinationAddress, nextDestinationPostalCode, nextDestinationCity, nextAdditionalInformation)
VALUES ('mersu', 'A200', 'ABC-123', 'Sininen', '2013-10-30', '12:00:00', '13:00:00', 'Viistokuja 5a23', '01020', 'Vantaa', '2013-10-23',
'17:45:00', 'Tietyö 2b', '21234', 'Lohja', 'Jaska', 'Jokainen', '0400142423','TheBIGcompany', 'Tässä on lisätietoa tästä tilauksesta',
1, 1, 2, '2013-11-03', '02:45:00', '03:30:00', '2013-11-04','22:45:00', 'Tietäys 1g', '50234', 'Lappi', 'Tässä on lisätietoa tästä palautuksesta');

INSERT INTO orders (carBrand, carModel, carRegister, carColor, collectionDate, collectionTimeFrom, collectionTimeTo, collectionAddress, collectionPostalCode,
collectionCity, destinationDate, destinationTime, destinationAddress, destinationPostalCode, destinationCity, clientFname, clientLname, clientPhoneNo,
clientCompany, additionalInformation, companyMadeOrder, userMadeOrder, statusOfOrder) 
VALUES ('Audi','A5','NYH-534','Keltainen','2013-10-30','12:15:00', '15:45:00','Noutokuja','02353','Espoo','2013-10-23',
'17:45:00','Toimituskuja','24352','Vantaa','Mikko','Mallikas','0402584234','Company','Lisätiedot',1,1,1);