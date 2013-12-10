<%@include file="header.jsp"%>
<title>Siirtoapu.fi -- Salasana palautettu</title>
</head>
<body>
	<div class="container">

		<%@include file="navi.jsp"%>
		<div class="row-fluid" id="area">
			<div class="span10 offset1">
						<legend>
							Salasana vaihdettu
						</legend>
						<p>Vaihdoit salasanan käyttäjälle: <b><c:out value="${email}" default="-----" /></b></p>
						<p>Uusi salasana on: <b><c:out value="${newPassword}" default="-----" /></b></p>
			</div>
		</div>
	</div>
</body>
</html>