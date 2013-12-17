#17.12.13 10:20

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

INSERT INTO orderStatus (orderStatus)
VALUES ('Poistettu');

#TestCompanies
INSERT INTO companies (name, address, postalCode, city)
VALUES ('Testi firma', 'testiosoite', '02100', 'Helsinki');

INSERT INTO companies (name, address, postalCode, city)
VALUES ('testii firma', 'testiosoitee', '01000', 'Helsinki');

#TestUser
INSERT INTO registeredUsers (fName, lName, phoneNo, email, password, myRole, myCompany)
VALUES ('Matti', 'Meikäläinen', '0400123123', 'matti.meikalainen@email.com', 'b8e4f2849d72a1ed34599ebffcedd0babf0ea84aa3f815ca498a7f50f14ee327a0577d8ef7336fb4', 1, 1);

#TestAdmin
INSERT INTO registeredUsers (fName, lName, phoneNo, email, password, myRole, myCompany)
VALUES ('Timo', 'Tomera', '0400456456', 'timo.tomera@email.com', '6cc7ef452efe0fef758c3fe2d0d8f23dc4d0a8fb26eff1a64598a02d8c1117a106b8507b65c206ba', 2, 2);