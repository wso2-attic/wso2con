// Populate the speakers page

$('#venue').live('pageshow', function (event) {
    if (testmode) {
        console.log("pageshow #venue");
    }

    if(user != null){
        $("#venue-settings").show();
    }else{
    	$("#venue-settings").hide();
    }
    /*var currentSession = 0;
    var currentDay;
    if (testdateoffset > 0) {
        var now = new Date(agenda.sessions[0].start.valueOf() + testdateoffset * 1000 * 60 * 60);
    } else {
        now = new Date();
    }

    var count = 0;*/
    var template = "<ul data-role='listview'>";
    template += "<li><a href='#map' data-transition='fade'>";
	template += "<h3 class='ui-li-heading'> Venue Map</h3>";
	template += "</a></li>";
    for(var p in venue.venueinfo){
    	var caption = venue.venueinfo[p];
    	template += "<li><a href='#venueinfo?id="+caption.id+"' data-transition='fade'>";
    	template += "<h3 class='ui-li-heading'>" + caption.caption +"</h3>";
    	template += "</a></li>";
    }

    template += "</ul>";

    $("#venuedetails").html(template).trigger("create");
});

