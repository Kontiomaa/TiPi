
<%@include file="header.jsp"%>
<title>Siirtoapu.fi -- Uudet tilaukset</title>
</head>
<body>
	<div class="container">

		<%@include file="navi.jsp"%>
		<div class="row-fluid" id="area">
		<%@include file="ordersNavi.jsp"%>
			<div class="row-fluid">
				<div class="span10 offset1">

					<fieldset>
						<legend>Noudetaan tilaukset</legend>
						<div class="row-fluid">
							<div class="span12">

								<table id="myTable" class="table table-striped">
									<thead>
										<tr>
											<th>Yritys</th>
											<th>Mist‰</th>
											<th></th>
											<th>Mihin</th>
											<th>Luontip‰iv‰m‰‰r‰</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${orders}" var="order">
											<tr>
												<td><c:out value="${order.userProfile.company.name}" /></td>
												<td><c:out value="${order.collectionCity}" />, <c:out
														value="${order.collectionAddress}" /></td>
												<td><i class="icon-arrow-right"></i></td>
												<td><c:out value="${order.destinationCity}" />, <c:out
														value="${order.destinationAddress}" /></td>
												<td><c:out value="${order.destinationDate}" /> <c:out
														value="${order.destinationTime}" /></td>
												<form action="orderInformation" method="post" class="span4">
													<td><input type="hidden" name="orderID" id="orderID"
														value="${order.orders_id}" />
														<button class="btn btn-primary" type="submit"
															value="submit">Avaa</button></td>
												</form>
												<form action="changeOrderStatus" method="post" class="span4">
													<td><input type="hidden" name="statusOfOrder" id="statusOfOrder"
														value="${order.statusOfOrder}" />
														<input type="hidden" name="orderID" id="orderID"
														value="${order.orders_id}" />
														<input type="hidden" name="hasNewDestination" id="hasNewDestination"
														value="${order.hasNewDestination}" />
													<button class="btn btn-success">Viety</button>
												</td>
												</form>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</fieldset>

				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<script type="text/javascript"
		src="../resources/jquery-tablesorter/jquery.tablesorter.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$(function() {
				$("table#myTable").tablesorter({
					sortList : [ [ 1, 0 ] ]
				});
			});
		});
	</script>
</body>
</html>