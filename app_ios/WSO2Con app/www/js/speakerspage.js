// Populate the speakers page
$('#speakers').live('pageshow', function (event) {
    if (testmode) {
        console.log("pageshow #speakers");
    }
    
    if(user != null){
        $("#speakers-settings").show();
	}else{
		$("#speakers-settings").hide();
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
    var profiles_sorted = profiles.profiles.sort(function(a, b){
        if(a.firstname < b.firstname) return -1;
        if(a.firstname > b.firstname) return 1;
        return 0;
    });
    
    for(var p in profiles_sorted){
    	var speaker = profiles_sorted[p];
    	template += "<li><a href='#profile?id="+speaker.id+"' data-transition='fade'>";
    	if(speaker.image=="" || speaker.image==null){
    		template += "<img src='style/images/profile_placeholder.png' /><h3 class='ui-li-heading'>" + speaker.firstname +" "+ speaker.lastname + "</h3>";
    	}else{
    		template += "<img src='"+speaker.image+"' /><h3 class='ui-li-heading'>" + speaker.firstname +" "+ speaker.lastname + "</h3>";
    	}
    	if(speaker.title!=null || speaker.organisation!=null){
    	template += "<p class='ui-li-desc speaker'>"+speaker.title+", "+speaker.organisation+"</p>";
    	}
    	template += "</a></li>";
    }

    template += "</ul>";

    $("#speakerdetails").html(template).trigger("create");
});