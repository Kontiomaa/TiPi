
<%@include file="header.jsp"%>
<title>Siirtoapu.fi -- Laskutetut tilaukset</title>
</head>
<body>
	<div class="container">

		<%@include file="navi.jsp"%>
		<div class="row-fluid" id="area">
			<%@include file="ordersNavi.jsp"%>
			<div class="row-fluid">
				<div class="span10 offset1">

					<fieldset>
						<legend>Laskutetut tilaukset</legend>
						<div class="row-fluid">
							<div class="span12">

								<table id="myTable" class="table table-striped">
									<thead>
										<tr>
											<th>Yritys</th>
											<th>Nouto</th>
											<th>Toimitus</th>
											<th>Palautus</th>
											<th>Valmis</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${orders}" var="order">
											<tr>
												<td><c:out value="${order.userProfile.company.name}" /></td>
												<td><c:out value="${order.collectionCity}" />, <c:out
														value="${order.collectionAddress}" />
													<div style="float: right; text-align: right">
														<i class="icon-arrow-right"></i>
													</div></td>
												<c:choose>
													<c:when test="${order.hasNewDestination}">
														<td><c:out value="${order.destinationCity}" />
															<div style="float: right; text-align: right">
																<i class="icon-arrow-right"></i>
															</div>, <c:out value="${order.destinationAddress}" /></td>
														<td><c:out value="${order.nextDestinationCity}" />,
															<c:out value="${order.nextDestinationAddress}" /></td>
														<td><c:out value="${order.nextDestinationDate}" />,
															<c:out value="${order.nextDestinationTime}" /></td>
													</c:when>
													<c:otherwise>
														<td><c:out value="${order.destinationCity}" />, <c:out
																value="${order.destinationAddress}" /></td>
														<td></td>
														<td><c:out value="${order.destinationDate}" />, <c:out
																value="${order.destinationTime}" /></td>
													</c:otherwise>
												</c:choose>
												<form action="orderInformation" method="post" class="span4">
													<td><input type="hidden" name="orderID" id="orderID"
														value="${order.orders_id}" />
														<button class="btn btn-primary" type="submit"
															value="submit">Avaa</button></td>
												</form>
												<td></td>
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
					sortList : [ [ 4, 1 ] ],
					dateFormat : "ddmmyyyy",
					headers : {
						4 : {
							sorter : "shortDate"
						}
					}
				});
			});
		});
	</script>
</body>
</html>