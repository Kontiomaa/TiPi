
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
											<th class="sorter-false"></th>
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
	<script type="text/javascript"
		src="../resources/jquery-dataTables/jquery.dataTables.min.js"></script>
	<script type="text/javascript">
		/* API method to get paging information */
		$.fn.dataTableExt.oApi.fnPagingInfo = function ( oSettings )
		{
			return {
				"iStart":         oSettings._iDisplayStart,
				"iEnd":           oSettings.fnDisplayEnd(),
				"iLength":        oSettings._iDisplayLength,
				"iTotal":         oSettings.fnRecordsTotal(),
				"iFilteredTotal": oSettings.fnRecordsDisplay(),
				"iPage":          Math.ceil( oSettings._iDisplayStart / oSettings._iDisplayLength ),
				"iTotalPages":    Math.ceil( oSettings.fnRecordsDisplay() / oSettings._iDisplayLength )
			};
		}

		/* Bootstrap style pagination control */
		$.extend( $.fn.dataTableExt.oPagination, {
			"bootstrap": {
				"fnInit": function( oSettings, nPaging, fnDraw ) {
					var oLang = oSettings.oLanguage.oPaginate;
					var fnClickHandler = function ( e ) {
						e.preventDefault();
						if ( oSettings.oApi._fnPageChange(oSettings, e.data.action) ) {
							fnDraw( oSettings );
						}
					};

					$(nPaging).addClass('pagination').append(
						'<ul>'+
						'<li class="prev disabled"><a href="#">&larr; '+oLang.sPrevious+'</a></li>'+
						'<li class="next disabled"><a href="#">'+oLang.sNext+' &rarr; </a></li>'+
						'</ul>'
					);
					var els = $('a', nPaging);
					$(els[0]).bind( 'click.DT', { action: "previous" }, fnClickHandler );
					$(els[1]).bind( 'click.DT', { action: "next" }, fnClickHandler );
				},

				"fnUpdate": function ( oSettings, fnDraw ) {
					var iListLength = 5;
					var oPaging = oSettings.oInstance.fnPagingInfo();
					var an = oSettings.aanFeatures.p;
					var i, j, sClass, iStart, iEnd, iHalf=Math.floor(iListLength/2);

					if ( oPaging.iTotalPages < iListLength) {
						iStart = 1;
						iEnd = oPaging.iTotalPages;
					}
					else if ( oPaging.iPage <= iHalf ) {
						iStart = 1;
						iEnd = iListLength;
					} else if ( oPaging.iPage >= (oPaging.iTotalPages-iHalf) ) {
						iStart = oPaging.iTotalPages - iListLength + 1;
						iEnd = oPaging.iTotalPages;
					} else {
						iStart = oPaging.iPage - iHalf + 1;
						iEnd = iStart + iListLength - 1;
					}

					for ( i=0, iLen=an.length ; i<iLen ; i++ ) {
						// Remove the middle elements
						$('li:gt(0)', an[i]).filter(':not(:last)').remove();

						// Add the new list items and their event handlers
						for ( j=iStart ; j<=iEnd ; j++ ) {
							sClass = (j==oPaging.iPage+1) ? 'class="active"' : '';
							$('<li '+sClass+'><a href="#">'+j+'</a></li>')
								.insertBefore( $('li:last', an[i])[0] )
								.bind('click', function (e) {
									e.preventDefault();
									oSettings._iDisplayStart = (parseInt($('a', this).text(),10)-1) * oPaging.iLength;
									fnDraw( oSettings );
								} );
						}

						// Add / remove disabled classes from the static elements
						if ( oPaging.iPage === 0 ) {
							$('li:first', an[i]).addClass('disabled');
						} else {
							$('li:first', an[i]).removeClass('disabled');
						}

						if ( oPaging.iPage === oPaging.iTotalPages-1 || oPaging.iTotalPages === 0 ) {
							$('li:last', an[i]).addClass('disabled');
						} else {
							$('li:last', an[i]).removeClass('disabled');
						}
					}
				}
			}
		} );

		/* Table initialisation */
		$(document).ready(function() {
			$('#myTable').dataTable( {
				"bSort": false,
				"bInfo": false,
				"sDom": "<'row'<'span5 offset1'l><'span5 offset1'f>r>t<'row'<'span5'i><'span5'p>>",
				"sPaginationType": "bootstrap",
				"oLanguage": {
					"sLengthMenu": "_MENU_ ",
					"sSearch": "Hae",
					"sZeroRecords": "Tuloksia ei löytynyt", 
					"oPaginate": {
					"sNext": "Seuraava",
					"sPrevious": "Edellinen",
					}
				}
			} );
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
		} );
	</script>
</body>
</html>