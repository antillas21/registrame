$(document).ready( function(){
  //alert("Esta es una alerta");
	$.ajax({
			url: "/states.xml",
			dataType: "xml",
			success: function( xmlResponse ) {
				var data = $( "state", xmlResponse ).map(function() {
					return {
						value: $( "name", this ).text(),
						id: $( "id", this ).text()
					};
				}).get();
				$( "#company_state_name" ).autocomplete({
					source: data,
					minLength: 0,
					select: function( event, ui ) {

					}
				});
			}
		});

  $.ajax({
			url: "/countries.xml",
			dataType: "xml",
			success: function( xmlResponse ) {
				var data = $( "country", xmlResponse ).map(function() {
					return {
						value: $( "name", this ).text(),
						id: $( "id", this ).text()
					};
				}).get();
				$( "#company_country_name" ).autocomplete({
					source: data,
					minLength: 0,
					select: function( event, ui ) {

					}
				});
			}
		});
  
	$.ajax({
		url: "/companies.xml",
		dataType: "xml",
		success: function( xmlResponse ) {
			var data = $( "company", xmlResponse ).map(function() {
				return {
					value: $( "name", this ).text(),
					id: $( "id", this ).text()
				};
			}).get();
			$( "#person_company_name" ).autocomplete({
				source: data,
				minLength: 0,
				select: function( event, ui ) {

				}
			});
		}
	});

});

$(document).ready(function(){
	$('input:submit').button();
	$('#errorExplanation').addClass('error');
	$('.datatable').dataTable({
		"bJQueryUI": true,
		"sPaginationType": "full_numbers",
		"oLanguage": {
					"sProcessing":   "Procesando...",
					"sLengthMenu":   "Mostrar _MENU_ registros",
					"sZeroRecords":  "No se encontraron resultados",
					"sInfo":         "Mostrando desde _START_ hasta _END_ de _TOTAL_ registros",
					"sInfoEmpty":    "Mostrando desde 0 hasta 0 de 0 registros",
					"sInfoFiltered": "(filtrado de _MAX_ registros en total)",
					"sInfoPostFix":  "",
					"sSearch":       "Buscar:",
					"sUrl":          "",
					"oPaginate": {
						"sFirst":    "Primero",
						"sPrevious": "Anterior",
						"sNext":     "Siguiente",
						"sLast":     "Último"
					}
				}
	});
});
