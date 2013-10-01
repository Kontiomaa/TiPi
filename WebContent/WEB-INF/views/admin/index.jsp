		<%@include file="header.jsp"%>
		<title>Siirtoapu.fi -- Etusivu</title>
	</head>
	<body>
		<div class="container">

			<%@include file="navi.jsp"%>
			<div class="row-fluid" id="area">
				<div class="row-fluid">
					<div class="span12">
						<div class="navbar navbar-inverse">
				 			<div class="navbar-inner">
								<a class="brand" href="#">Tilaukset</a>
								<ul class="nav"><!-- Should I use a canvas to stay on the same page but alter the info between the links' contents below? || an example: http://www.my-html-codes.com/javascript-tabs-html-5-css3 -->
									<li class="active"><a href="orderProgression/newOrders.jsp">Uudet</a></li>
									<li><a href="#">Kuitatut</a></li>
									<li><a href="#">Haetut</a></li>
									<li><a href="#">Viedyt</a></li>
									<li><a href="#">Palautetut</a></li>
									<li><a href="orderProgression/completedOrders.jsp">Valmiit</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span10 offset1">
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris. Maecenas congue ligula ac quam viverra nec consectetur ante hendrerit. Donec et mollis dolor. Praesent et diam eget libero egestas mattis sit amet vitae augue. Nam tincidunt congue enim, ut porta lorem lacinia consectetur. Donec ut libero sed arcu vehicula ultricies a non tortor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean ut gravida lorem. Ut turpis felis, pulvinar a semper sed, adipiscing id dolor. Pellentesque auctor nisi id magna consequat sagittis. Curabitur dapibus enim sit amet elit pharetra tincidunt feugiat nisl imperdiet. Ut convallis libero in urna ultrices accumsan. Donec sed odio eros. Donec viverra mi quis quam pulvinar at malesuada arcu rhoncus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In rutrum accumsan ultricies. Mauris vitae nisi at sem facilisis semper ac in est.</p>
					</div>
				</div>
			</div>
		</div>
		<script src="tabs.js"></script>
	</body>
</html>