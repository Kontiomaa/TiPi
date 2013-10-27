<%@include file="header.jsp"%>
<title>Siirtoapu.fi -- Profiili</title>
</head>
<body>
	<div class="container">
		<%@include file="userNavi.jsp"%>
		<div class="row-fluid" id="area">
			<div class="span10 offset1">

				<fieldset>
					<legend>Tehdyt tilaukset</legend>
				<table id="myTable" class="table table-striped">
					<thead>
						<tr>
							<th>Yritys</th>
							<th>Mist‰</th>
							<th></th>
							<th>Mihin</th>
							<th>Luontip‰iv‰m‰‰r‰</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orders}" var="order">
							<tr>
								<td><c:out value="${order.companyMadeOrder}" /></td>
								<td><c:out value="${order.collectionCity}" />, <c:out value="${order.collectionAddress}" /></td>
								<td><i class="icon-arrow-right"></i></td>
								<td><c:out value="${order.destinationCity}" />, <c:out value="${order.destinationAddress}" /></td>
								<td><c:out value="${order.destinationDate}" /> <c:out value="${order.destinationTime}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
					</div>
				</fieldset>
			</div>
		</div>
	</div>
</body>
</html>