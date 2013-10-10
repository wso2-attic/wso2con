function populateSettings() {
    $("#profile_title").html(user.title=="null"?"":user.title);
    $("#profile_organisation").html(user.organisation=="null"?"":user.organisation);
    $("#profile_bio").html(user.bio=="null"?"":user.bio);
    $("#profile_expertise").html(user.expertise=="null"?"":user.expertise);
    $("#profile_home").html(user.home=="null"?"":user.home);
    $("#profile_accept").attr("checked",user.accepting?true:false).checkboxradio("refresh").checkboxradio("disable");
    if (user.accepting) {
        $("#profile_interests").html(user.interests=="null"||user.interests==""?"(none stated)":user.interests);
        $("#profile_interests_line").show();
    } else {
        $("#profile_interests_line").hide();
    }
}

// Prepare the settings page with current user information
$('#settings').live('pageshow', function(event) {
    if (testmode) { console.log("pageshow #settings"); }
    $("#profile_firstname").html(user.firstname);
    $("#profile_lastname").html(user.lastname);
    $("#edit_profile_firstname").html(user.firstname);
    $("#edit_profile_lastname").html(user.lastname);
    populateSettings();
});

// Profile "edit" button handlers - populate the form and switch to form view.
$("#profile_view a").live("click", function(){
    $("#edit_profile_title").val(user.title=="null"?"":user.title);
    $("#edit_profile_organisation").val(user.organisation=="null"?"":user.organisation);
    $("#edit_profile_bio").val(user.bio=="null"?"":user.bio);
    $("#edit_profile_expertise").val(user.expertise=="null"?"":user.expertise);
    $("#edit_profile_home").val(user.home=="null"?"":user.home);
    $("#edit_profile_accept").attr("checked",user.accepting?true:false).checkboxradio("refresh").checkboxradio("enable");
    $("#edit_profile_interests").val(user.interests=="null"?"":user.interests);
    $("#profile_view").hide();
    $("#profile_edit").show();
});

// Profile "save" button
$("#profile_edit a").live("click", function(){
    user.title = $("#edit_profile_title").val();
    user.organisation = $("#edit_profile_organisation").val();
    user.bio = $("#edit_profile_bio").val();
    user.expertise = $("#edit_profile_expertise").val();
    if ($("#edit_profile_accept").attr("checked") == "checked") {
        user.accepting = 1;  //API prefers 1/0 to true/false
    } else {
        user.accepting = 0;
    }
    user.interests = $("#edit_profile_interests").val();
    user.home = $("#edit_profile_home").val();
    $.mobile.loading('show');
    
    $.ajax({
        type : "PUT",
        url : wso2conAPI + "attendee/" + user.id,
        headers : {'Authorization': 'Bearer ' + window.localStorage.getItem("access_token"), 'Content-Type' : 'application/json; charset=UTF-8'},
        data : JSON.stringify(user),
        dataType : "json",
        success : function(data) {
            window.localStorage.setItem("user", JSON.stringify(user));
            populateSettings();
            $.mobile.loading('hide');
            $("#profile_edit").hide();
            $("#profile_view").show();
        },
        error : function(data) {
            $.mobile.loading('hide');
            $("#popup_server_failed").popup("open");
        }
    });
    
});

// Profile "clear" button
$("#logoff a").live("click", function(){
    if (testmode) { console.log("Log off"); }
    user = null;
    agenda = baseagenda;
    profiles = baseprofiles;
    version = baseversion;
    sponsors = basesponsors;
    schedule = new Array();
    
    window.localStorage.removeItem("user");
    window.localStorage.removeItem("agenda");
    window.localStorage.removeItem("profiles");
    window.localStorage.removeItem("version");
    window.localStorage.removeItem("sponsor");
    window.localStorage.removeItem("schedule");
});



