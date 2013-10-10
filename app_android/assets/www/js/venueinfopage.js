//Populate the Answer page
$("#venueinfo").live("pagebeforeshow", function (event, data) {
    if (testmode) { console.log("pagebeforeshow #venueinfo"); }
    // isloate the topicId 
    var topicId = $.mobile.pageData.id;
    // find the corresponding help topic
    var topic;
    if(user != null){
        $("#venueinfo-settings").show();
    }else{
    	$("#venueinfo-settings").hide();
    }
    
    for (var p in venue.venueinfo) {
        if (venue.venueinfo[p].id == topicId) {
            topic = venue.venueinfo[p];
            break;
        }
    }

    if (topic == null) {
        for (var p in userCache) {
            if (userCache[p].id == topicId) {
                topic = userCache[p];
                break;
            }
        }
    }
    
    if (topic != null) {
        var $page = $("#venueinfo");

        // Get the header for the page.
        var $header = $page.children( ":jqmData(role=header)" );
        $header.find( "h1" ).html( topic.caption );

        $('#venueinfodetails').html(topic.description == "null" ? "" : topic.description);
       
    }
});