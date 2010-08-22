var $j = jQuery.noConflict();

$j(document).ready(function() {
	$j('input:submit, .as_button').button();
	//alert("Nueva alerta");
	$j('select, input:checkbox, input:radio, input:file').uniform();
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
	
	$j('#errorExplanation').addClass('ui-state-error ui-corner-all');
	$j('#flash_notice').addClass('ui-state-highlight ui-corner-all').fadeOut(3000);
});