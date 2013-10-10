$("#sponsor").live("pagebeforeshow", function (event, data) {
    if (testmode) { console.log("pagebeforeshow #sponsor"); }
    // isloate the sponsorId code
    var sponsorId = $.mobile.pageData.id;
    
    // find the corresponding sponsor profile
    var sponsor;
    for (var s in sponsors) {
        if (sponsors[s].id == sponsorId) {
            sponsor = sponsors[s];
            break;
        }
    }
    
    if (sponsor) {
        var $page = $("#sponsor");

        // Get the header for the page.
        var $header = $page.children( ":jqmData(role=header)" );
        $header.find( "h1" ).html( sponsor.name );

        // Get the content area element for the page.
        var markup = sponsor.description;
        
        $("#sponsordetails").html( markup );
        
        if (sponsor.contacts.length > 0) {
            markup = "";
            for (var c in sponsor.contacts) {
                var profileId = sponsor.contacts[c];
                for (var p in profiles.profiles) {
                    if (profiles.profiles[p].id == profileId) {
                        profile = profiles.profiles[p];
                        break;
                    }
                }
                markup += "<a href='#profile?id=" + profile.id + "' data-role='button'><i class='icon-coffee'> </i> Meet 1-1 with " + profile.firstname + " " + profile.lastname + "</a>";
            }
            $("#sponsormeeting").html(markup).trigger("create").show();
        } else {
            $("#sponsormeeting").hide();
        
        }
    }
});
