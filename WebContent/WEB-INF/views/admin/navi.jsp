		<div class="row-fluid">
			<div class="navbar navbar-inverse navbar-fixed-top">
				<div class="navbar-inner">
					<div class="container">

						<ul class="nav">
							<li class="active"><a class="brand" href="new">Siirtoapu.fi</a></li>
							
							<c:choose>
								<c:when test="${pageIdentifier == 'orders'}">
									<li class="active"><a href="new">Tilaukset</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="new">Tilaukset</a></li>
								</c:otherwise>
							</c:choose>
							
							<c:choose>
								<c:when test="${pageIdentifier == 'users'}">
									<li class="active"><a href="users">Käyttäjät</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="users">Käyttäjät</a></li>
								</c:otherwise>
							</c:choose>
							
							<c:choose>
								<c:when test="${pageIdentifier == 'register'}">
									<li class="active"><a href="registerNewUser">Rekisteröinti</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="registerNewUser">Rekisteröinti</a></li>
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
							
							<%--
							<li><a href="new">Etusivu</a></li>
							<li><a href="users">Käyttäjät</a></li>
							<li><a href="registerNewUser">Rekisteröinti</a></li>
							<li><a href="profile">Profiili</a></li>
							--%>
						</ul>

						<form class="navbar-form pull-right">
							<a href="../j_spring_security_logout" class="btn">Kirjaudu
								ulos</a>
						</form>
					</div>
				</div>
			</div>
		</div>