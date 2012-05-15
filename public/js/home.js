$(function() {
	setup_datepicker()
	setup_timedefault()
	$("#marathon_create").click(create_marathon_plan)
	$("#half_marathon_create").click(create_half_marathon_plan)
	$("#get_started").click( function(){ $("#datepicker").focus() })
});
function setup_datepicker()
{
	$("#datepicker").datepicker({ defaultDate: + (7 * 16) }); //default to 16 weeks
	var date = $("#datepicker").datepicker("getDate");
	$("#datepicker").datepicker("setDate", date);
}
function setup_timedefault()
{
	var index = Math.floor($("#minute").children().size()/2)
	$('#minute :nth-child(' + index + ')').attr('selected', 'selected')
}
function create_marathon_plan()
{
	create_plan("marathon")
}
function create_half_marathon_plan()
{
	create_plan("halfmarathon")
}

function create_plan(base_url)
{
	var minutes = $("#minute").val();
	var seconds = $("#second").val();
	var date = $("#datepicker").datepicker("getDate");
	if(date === null)
	{
		$("#datepicker").focus();
		return; //
	}
	var year = date.getFullYear();
	var month = date.getMonth() + 1;//http://www.w3schools.com/jsref/jsref_getmonth.asp
	var day = date.getDate();
	var href = "./" + base_url + "/" + day + "-" + month + "-" + year + "/fivekmtime/" + minutes + "m" + seconds + "s";
	document.location.href=href;
}