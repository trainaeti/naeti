	$(document).ready(function(){
		$(".zebra tr:nth-child(odd) td").css("background","#f4f5f4");
		$('.text').blur(function() {
			if (trim($(this).val()) == "") {
				var val = $(this).attr("dtext");
				$(this).val(val);
			}
		});
		$('.text').focus(function() {
			old_val = $(this).attr("dtext");
			if (old_val == $(this).val()) $(this).val('');	
		});
	});
	
	$(function() {
		$("#tabs").tabs();
	});
	function trim(stringToTrim) {
		return stringToTrim.replace(/^\s+|\s+$/g,"");
	}
