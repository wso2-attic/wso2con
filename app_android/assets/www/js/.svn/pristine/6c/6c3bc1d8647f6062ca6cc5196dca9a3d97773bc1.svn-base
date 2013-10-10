$("#profile").live("pagebeforeshow", function (event, data) {
    if (testmode) { console.log("pagebeforeshow #profile"); }
    // isloate the profileId 
    var profileId = $.mobile.pageData.id;
    
    // find the corresponding sponsor profile
    var profile;
    for (var p in profiles.profiles) {
        if (profiles.profiles[p].id == profileId) {
            profile = profiles.profiles[p];
            break;
        }
    }

    if (profile == null) {
        for (var p in userCache) {
            if (userCache[p].id == profileId) {
                profile = userCache[p];
                break;
            }
        }
    }
    
    if (profile != null) {
        var $page = $("#profile");

        // Get the header for the page.
        var $header = $page.children( ":jqmData(role=header)" );
        $header.find( "h1" ).html( profile.firstname + " " + profile.lastname);

        // Get the content area element for the page.
        if(profile.image ){
            var profileImage = '<div id="profile-image"><img class="profile-image" src="' + profile.image + '"/></div>';
        }
        
        $('#bio').html(profile.bio == "null" ? "" : profile.bio);
        $('#bio').prepend(profileImage);
        $('#expertise').html(profile.expertise == "" || profile.expertise == "null" ? "" : "Expertise: " + profile.expertise);
        $('#location').html(profile.home == "" || profile.home == "null"? "" : "Home: " + profile.home);
        $('#interests').html(profile.interests == "null" ? "" : "Interests: " + profile.interests);
        if (profile.accepting) {
            $("#accept").show();
            $("#reject").hide();
        } else {
            $("#reject").html(profile.firstname + " has not enabled meeting requests.").show();
            $("#accept").hide();
        }
        $('#requestmessage').attr("data", profile.id);
    }
});

$('#requestsubmit').live('click', function(event){
    $.mobile.loading('show');
    sendMessage({
        from: user.id,
        to: $("#requestmessage").attr("data"),
        message: $("#requestmessage").val(),
        status: "new"
    });
});





