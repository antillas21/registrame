var $j = jQuery.noConflict();
TableToolsInit.sSwfPath = "/media/swf/ZeroClipboard.swf";
var asInitVals = new Array();

$j(document).ready(function() {
	$j('input:submit, .as_button').button();
	//alert("Nueva alerta");
	$j('select, input:checkbox, input:radio, input:file').uniform();
	
	$j('.data').dataTable({
		//"sPaginationType": "full_numbers",
		"iDisplayLength": 10,
		"bLengthChange": false,
		"bJQueryUI": true,
		"sScrollX": 900,
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
	
	
	var oTable = $j('#results').dataTable({
		"sScrollX": "100%",
		"sDom": 'T<"clear">lfrtip',
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
	$j("tfoot input").keyup( function () {
		/* Filter on the column (the index) of this element */
		oTable.fnFilter( this.value, $j("tfoot input").index(this) );
	} );
		
	/*
	 * Support functions to provide a little bit of 'user friendlyness' to the textboxes in 
	 * the footer
	 */
	$j("tfoot input").each( function (i) {
		asInitVals[i] = this.value;
	} );
	
	$j("tfoot input").focus( function () {
		if ( this.className == "search_init" )
		{
			this.className = "";
			this.value = "";
		}
	} );
	
	$j("tfoot input").blur( function (i) {
		if ( this.value == "" )
		{
			this.className = "search_init";
			this.value = asInitVals[$j("tfoot input").index(this)];
		}
	} );
	
	$j('#errorExplanation').addClass('ui-state-error ui-corner-all');
	$j('#flash_notice').addClass('ui-state-highlight ui-corner-all');
	
	$j("ul.dropdown li").hover(function(){
	   $j(this).addClass("hover");
	   $j('> .dir',this).addClass("open");
	   $j('ul:first',this).css('visibility', 'visible');
	 },function(){
	   $j(this).removeClass("hover");
	   $j('.open',this).removeClass("open");
	   $j('ul:first',this).css('visibility', 'hidden');
	});
	
	$j('#users').dataTable({
		"bJQueryUI": true,
		"bProcessing": true,
		"bServerSide": true,
		"sAjaxSource": "datatable",
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
	
	$j('#companies').dataTable({
		"bJQueryUI": true,
		"bProcessing": true,
		"bServerSide": true,
		"sAjaxSource": "companytable",
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


