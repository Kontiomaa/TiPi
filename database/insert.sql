#4.10.2013
#OrderStatus
INSERT INTO orderStatus (orderStatus)
VALUES ('Saapunut/Kuittaamaton');

INSERT INTO orderStatus (orderStatus)
VALUES ('Kuitattu');

INSERT INTO orderStatus (orderStatus)
VALUES ('Haettu');

INSERT INTO orderStatus (orderStatus)
VALUES ('Viety');

INSERT INTO orderStatus (orderStatus)
VALUES ('Palautettu/Valmis');

#Roles
INSERT INTO userRoles (userRoleName)
VALUES ('ROLE_USER');

INSERT INTO userRoles (userRoleName)
VALUES ('ROLE_ADMIN');

#TestUser with crypted passwords!
INSERT INTO companies (name, address, postalCode, city)
VALUES ('Testi firma', 'testiosoite', '02100', 'Helsinki');

INSERT INTO registeredUsers (fName, lName, phoneNo, email, userName, password, company)
VALUES ('Matti', 'Meikäläinen', '0400123123', 'matti.meikalainen@email.com', 'meikmat', '1185ba3bd01b7200e33bb8cedc7a8e90cc41420efae9be79996f19db4d1f0e2c3f240e802bdf48d9', 1);

INSERT INTO userHasRole (user_id, userRole_id)
VALUES (1,1);

#TestAdmin
INSERT INTO companies (name, address, postalCode, city)
VALUES ('testii firma', 'testiosoitee', '01000', 'Helsinki');

INSERT INTO registeredUsers (fName, lName, phoneNo, email, userName, password, company)
VALUES ('Timo', 'Tomera', '0400456456', 'timo.tomera@email.com', 'tometi', '809a334c5a25b85a525d554b8d24b887922d04dcb38e92f0e6ddfb28e049b667d01e2dfba742cf36', 2);

INSERT INTO userHasRole (user_id, userRole_id)
VALUES (2,2);