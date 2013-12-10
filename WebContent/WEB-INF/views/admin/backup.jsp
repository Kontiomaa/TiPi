<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
	<head>
<title>Varmuuskopio</title>
</head>
<body>
<p><c:out value="${status}" /> <c:out value="${thisdate}" /></p>
<c:forEach items="${orders}" var="order">
<table>
<tr>
<td>Auto</td>
<td><c:out value="${order.carBrand}" /></td>
<td><c:out value="${order.carModel}" /></td>
<td><c:out value="${order.carRegister}" /></td>
<td><c:out value="${order.carColor}" /></td>
<td></td>
</tr>
<tr>
<tr>
<td>Nouto</td>
<td><c:out value="${order.collectionDate}" /></td>
<td><c:out value="${order.collectionTime}" /></td>
<td><c:out value="${order.collectionAddress}" /></td>
<td><c:out value="${order.collectionPostalCode}" /></td>
<td><c:out value="${order.collectionCity}" /></td>
</tr>
<tr>
<td>Toimitus</td>
<td><c:out value="${order.destinationDate}" /></td>
<td><c:out value="${order.destinationTime}" /></td>
<td><c:out value="${order.destinationAddress}" /></td>
<td><c:out value="${order.destinationPostalCode}" /></td>
<td><c:out value="${order.destinationCity}" /></td>
</tr>
<tr>
<td>Asiakas</td>
<td><c:out value="${order.clientFname}" /></td>
<td><c:out value="${order.clientLname}" /></td>
<td><c:out value="${order.clientPhoneNo}" /></td>
<td><c:out value="${order.clientCompany}" /></td>
<td></td>
</tr>
<tr>
<td>Lisätietoa</td>
<td colspan="4"><c:out value="${order.additionalInformation}" /></td>
</tr>
<tr>
<td>P.ajat</td>
<td><c:out value="${order.nextDestinationCollectionDate}" /></td>
<td><c:out value="${order.nextDestinationCollectionTime}" /></td>
<td><c:out value="${order.nextDestinationDate}" /></td>
<td><c:out value="${order.nextDestinationTime}" /></td>
<td></td>
</tr>
<tr>
<td>P.osoite</td>
<td><c:out value="${order.nextDestinationAddress}" /></td>
<td><c:out value="${order.nextDestinationPostalCode}" /></td>
<td><c:out value="${order.nextDestinationCity}" /></td>
<td></td>
<td></td>
</tr>
<tr>
<td>P.lisätietoa</td>
<td colspan="4"><c:out value="${order.nextAdditionalInformation}" /></td>
</tr>
<tr>
<td>Tilaaja</td>
<td><c:out value="${order.userProfile.fName}" /></td>
<td><c:out value="${order.userProfile.phoneNo}" /></td>
<td><c:out value="${order.userProfile.lName}" /></td>
<td><c:out value="${order.userProfile.company.name}" /></td>
<td><c:out value="${order.lastTimeEdited}" /></td>
</tr>
</table>
<br>
</c:forEach>
</body>
</html>