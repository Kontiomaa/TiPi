<%@include file="header.jsp"%>
<title>Siirtoapu.fi -- Tilaukset</title>

	<script type="text/javascript" src="../resources/jquery-tablesorter/jquery.tablesorter.min.js"></script>

</head>
<body>
	<div class="container">
		<%@include file="userNavi.jsp"%>
		<div class="row-fluid" id="area">
			<div class="span10 offset1">

				<h3>Tilaukset</h3>

				<table id="myTable" class="table table-striped">
					<thead>
						<tr>
							<th>Rekisterinro.</th>
							<th>Mistä</th>
							<th></th>
							<th>Mihin</th>
							<th>Viimeksi muokattu</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orders}" var="order">
							<tr>
								<td><c:out value="${order.carRegister}" /></td>
								<td><c:out value="${order.collectionCity}" />, <c:out value="${order.collectionAddress}" /></td>
								<td><i class="icon-arrow-right"></i></td>
								<td><c:out value="${order.destinationCity}" />, <c:out value="${order.destinationAddress}" /></td>
								<td><c:out value="${order.lastTimeEdited}" /></td>
								<td>
									<form method="post" action="getOneOrder" class="buttonForm">
										<input name="orderId" type="hidden" value="${order.orders_id}" />
										<button class="btn btn-primary">Tarkastele</button>
									</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
			</div>
		</div>
	</div>
	
</body>
</html>