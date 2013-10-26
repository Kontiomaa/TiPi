		<div class="row-fluid">
			<div class="navbar navbar-inverse navbar-fixed-top">
				<div class="navbar-inner">
					<div class="container">

						<ul class="nav">
							<li class="active"><a class="brand" href="orderForm">Siirtoapu.fi</a></li>
							
							<c:choose>
								<c:when test="${pageIdentifier == 'orderForm'}">
									<li class="active"><a href="orderForm">Tilauslomake</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="orderForm">Tilauslomake</a></li>
								</c:otherwise>
							</c:choose>
							
							<c:choose>
								<c:when test="${pageIdentifier == 'orders'}">
									<li class="active"><a href="#">Tilaukset</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="#">Tilaukset</a></li>
								</c:otherwise>
							</c:choose>
							
							<c:choose>
								<c:when test="${pageIdentifier == 'profile'}">
									<li class="active"><a href="profile">Profiili</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="profile">Profiili</a></li>
								</c:otherwise>
							</c:choose>
						
						</ul>

						<form class="navbar-form pull-right">
							<a href="../j_spring_security_logout" class="btn">Kirjaudu
								ulos</a>
						</form>
					</div>
				</div>
			</div>
		</div>
