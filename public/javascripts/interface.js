var $j = jQuery.noConflict();

$j(document).ready(function() {
	$j('input:submit, .as_button').button();
	//alert("Nueva alerta");
	$j('.data').dataTable({
		//"sPaginationType": "full_numbers",
		"iDisplayLength": 10,
		"bLengthChange": false,
		"bJQueryUI": true,
		"oLanguage": {
			"sInfo": "Mostrando _START_ a _END_ de _TOTAL_ registros",
			"sInfoEmpty": "Showing 0 a 0 de 0 registros",
			"sInfoFiltered": "(filtrados de _MAX_ registros totales)",
			"sSearch": "Buscar: "
		}
	});
	
	$j.ajax({
				url: "../../states.xml",
				dataType: "xml",
				success: function(xmlResponse) {
					var data = $j("state", xmlResponse).map(function() {
						return {
							value: $j("name", this).text(),
							id: $j("id", this).text()
						};
					}).get();
					$j("#company_state_id").autocomplete({
						source: data,
						minLength: 2
					});
			}
	});
	
	$j('#errorExplanation').addClass('ui-state-error ui-corner-all');
	$j('#flash_notice').addClass('ui-state-highlight ui-corner-all').fadeOut(3000);
});