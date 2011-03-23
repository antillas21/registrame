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

});

