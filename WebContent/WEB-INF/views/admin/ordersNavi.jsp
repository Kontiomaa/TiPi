
<%
	response.addHeader("Refresh", "300");
%>
<div class="row-fluid">
	<div class="span12">
		<ul class="nav nav-tabs">
			<c:choose>
				<c:when test="${orderPage == 'new'}">
					<li class="active"><a href="new">Uudet <span
							class="badge badge-info"><c:out
									value="${ordersCount.newOrdersCount}" default="" /></span></a></li>
				</c:when>
				<c:otherwise>
					<li><a href="new">Uudet <span class="badge badge-info"><c:out
									value="${ordersCount.newOrdersCount}" default="" /></span></a></li>
				</c:otherwise>
			</c:choose>

			<c:choose>
				<c:when test="${orderPage == 'accepted'}">
					<li class="active"><a href="accepted">Kuitatut <span
							class="badge badge-info"><c:out
									value="${ordersCount.acceptedOrdersCount}" default="" /></span></a></li>
				</c:when>
				<c:otherwise>
					<li><a href="accepted">Kuitatut <span
							class="badge badge-info"><c:out
									value="${ordersCount.acceptedOrdersCount}" default="" /></span></a></li>
				</c:otherwise>
			</c:choose>

			<c:choose>
				<c:when test="${orderPage == 'taken'}">
					<li class="active"><a href="taken">Toimitetut <span
							class="badge badge-info"><c:out
									value="${ordersCount.takenOrdersCount}" default="" /></span></a></li>
				</c:when>
				<c:otherwise>
					<li><a href="taken">Toimitetut <span
							class="badge badge-info"><c:out
									value="${ordersCount.takenOrdersCount}" default="" /></span></a></li>
				</c:otherwise>
			</c:choose>

			<c:choose>
				<c:when test="${orderPage == 'completed'}">
					<li class="active"><a href="completed">Valmiit <span
							class="badge badge-info"><c:out
									value="${ordersCount.completedOrdersCount}" default="" /></span></a></li>
				</c:when>
				<c:otherwise>
					<li><a href="completed">Valmiit <span
							class="badge badge-info"><c:out
									value="${ordersCount.completedOrdersCount}" default="" /></span></a></li>
				</c:otherwise>
			</c:choose>

			<c:choose>
				<c:when test="${orderPage == 'billed'}">
					<li class="active"><a href="billed">Laskutettu</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="billed">Laskutettu</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</div>