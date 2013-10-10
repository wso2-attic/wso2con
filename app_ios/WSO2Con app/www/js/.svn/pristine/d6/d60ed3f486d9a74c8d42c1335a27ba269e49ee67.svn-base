$("#search").live("pagebeforeshow", function (event, data) {
    if (testmode) { console.log("pagebeforeshow #search"); }
    $("#searchterms").trigger("expand");
});

// Search button
$("#searchsubmit").live("click", function() {
    var searchTerms = {
        name : $("#searchname").val() == "" ? "*" : $("#searchname").val(),
        expertise : $("#searchexpertise").val() == "" ? "*" : $("#searchexpertise").val(),
        home : $("#searchhome").val() == "" ? "*" : $("#searchhome").val(),
        organisation : $("#searchorg").val() == "" ? "*" : $("#searchorg").val(),
        interests : $("#searchinterests").val() == "" ? "*" : $("#searchinterests").val(),
        regcode : "*"
    };
    var searchStr = "";
    for (var searchTerm in searchTerms) {
        searchStr += '&' + searchTerm +'=' + searchTerms[searchTerm];
    }

    $("#searchresults").empty()
    $.mobile.loading('show');
    var searchResults = $.ajax({
        type : "PUT",
        url: wso2conAPI + "search?" + searchStr,
        headers : {'Authorization': 'Bearer ' + window.localStorage.getItem("access_token")},
        data : searchTerms,
        dataType : "json",
        success : function(data) {
            // Display the results
            var resultsExist = false;
            var resultsList = $("<ul data-role='list-view'></ul>");
            userCache = data.users;
            for (var r in userCache) {
                var profile = userCache[r];
                if (profile.accepting) {
                    resultsExist = true;
                    resultsList.append($("<li><a href='#profile?id=" + profile.id + "' data-transition='slide'>" + profile.firstname + " " + profile.lastname + "</a></li>"));
                }
            }
            $.mobile.loading('hide');
            if (!resultsExist) {
                resultsList.append($("<li>No matching attendees found.</li>"));
            }
            $("#searchresults").append(resultsList);
            $("#searchresults ul").listview();
            $("#searchterms").trigger( "collapse" );
        },
        error : function(data) {
            $.mobile.loading('hide');
            alert("Connection error, please try again later.");
        }
    });
});

