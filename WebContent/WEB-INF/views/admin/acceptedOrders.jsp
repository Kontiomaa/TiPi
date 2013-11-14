
<%@include file="header.jsp"%>
<title>Siirtoapu.fi -- Kuitatut tilaukset</title>
</head>
<body>
	<div class="container">

		<%@include file="navi.jsp"%>
		<div class="row-fluid" id="area">
			<%@include file="ordersNavi.jsp"%>
			<div class="row-fluid">
				<div class="span10 offset1">

					<fieldset>
						<legend>Kuitatut tilaukset</legend>
						<div class="row-fluid">
							<div class="span12">

								<table id="myTable" class="table table-striped">
									<thead>
										<tr>
											<th>Yritys</th>
											<th>Mistä</th>
											<th>Mihin</th>
											<th>Noutoaika</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${orders}" var="order">
											<tr>
												<td><c:out value="${order.userProfile.company.name}" /></td>
												<td><c:out value="${order.collectionCity}" />, <c:out
														value="${order.collectionAddress}" /><div style="float:right; text-align:right"><i class="icon-arrow-right"></i></div></td>
												<td><c:out value="${order.destinationCity}" />, <c:out
														value="${order.destinationAddress}" /></td>
												<td><c:out value="${order.collectionDate}" /> <c:out
														value="${order.collectionTime}" /></td>
												<form action="orderInformation" method="post" class="span4">
													<td><input type="hidden" name="orderID" id="orderID"
														value="${order.orders_id}" />
														<button class="btn btn-primary" type="submit"
															value="submit">Avaa</button></td>
												</form>
												<form action="changeOrderStatus" method="post" class="span4">
													<td><input type="hidden" name="statusOfOrder"
														id="statusOfOrder" value="${order.statusOfOrder}" /> <input
														type="hidden" name="orderID" id="orderID"
														value="${order.orders_id}" /> <input type="hidden"
														name="hasNewDestination" id="hasNewDestination"
														value="${order.hasNewDestination}" />
														<button class="btn btn-success">Toimita</button></td>
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
		src="../resources/jquery-tablesorter/jquery.tablesorter.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$(function() {
				$("table#myTable").tablesorter({
					sortList : [ [ 3, 0 ] ],
					dateFormat : "ddmmyyyy",
					headers : {
						3 : {
							sorter : "shortDate"
						}
					}
				});
			});
		});
	</script>
</body>
</html>