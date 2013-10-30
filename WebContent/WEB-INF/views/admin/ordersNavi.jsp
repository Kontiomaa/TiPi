
<div class="row-fluid">
	<div class="span12">
		<ul class="nav nav-tabs">
			<c:choose>
				<c:when test="${orderPage == 'new'}">
					<li class="active"><a href="new">Uudet</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="new">Uudet</a></li>
				</c:otherwise>
			</c:choose>

			<c:choose>
				<c:when test="${orderPage == 'accepted'}">
					<li class="active"><a href="accepted">Kuitatut</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="accepted">Kuitatut</a></li>
				</c:otherwise>
			</c:choose>

			<c:choose>
				<c:when test="${orderPage == 'taken'}">
					<li class="active"><a href="taken">Toimitetut</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="taken">Toimitetut</a></li>
				</c:otherwise>
			</c:choose>

			<c:choose>
				<c:when test="${orderPage == 'completed'}">
					<li class="active"><a href="completed">Valmiit</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="completed">Valmiit</a></li>
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