		<%@include file="header.jsp"%>
		<title>Siirtoapu.fi -- Valmiit tilaukset</title>
	</head>
	<body>
		<div class="container">

			<%@include file="navi.jsp"%>
			<div class="row-fluid" id="area">
				<div class="row-fluid">
					<div class="span12">
						<ul class="nav nav-tabs">
    						<li><a href="new">Uudet</a></li>
							<li><a href="accepted">Kuitatut</a></li>
							<li><a href="collected">Haetut</a></li>
							<li><a href="taken">Viedyt</a></li>
							<li><a href="returned">Palautetut</a></li>
							<li class="active"><a href="completed">Valmiit</a></li>
    					</ul>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span10 offset1">
					</div>
				</div>
			</div>
		</div>
	</body>
</html>