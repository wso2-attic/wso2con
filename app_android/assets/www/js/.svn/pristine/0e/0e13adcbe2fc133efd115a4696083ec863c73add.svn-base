$("#session").live("pagebeforeshow", function (event, data) {
    if (testmode) { console.log("pagebeforeshow #session");}
    var sessionId = $.mobile.pageData.id;
    
    var session;
    for (var s in agenda.sessions) {
        if (agenda.sessions[s].id == sessionId) {
            session = agenda.sessions[s];
            break;
        }
    }
    
    if (session) {
        var $page = $("#session");

        // Get the header for the page.
        var $header = $page.children( ":jqmData(role=header)" );
        $header.find( "h1" ).html( session.type + " Details");

        // Get the content area element for the page.
        var $content = $page.children( ":jqmData(role=content)" );
        $content.find("h2").html(session.title);
        $content.find(".speakers").empty();
        for (var p in session.speakerprofile) {
            var profile = session.speakerprofile[p];
            $content.find(".speakers").append($("<span class='speaker'><a href='#profile?id=" + profile.id + "'><i class='icon-bullhorn'></i> " + profile.firstname + " " + profile.lastname + "</a></span>"));
        }
        
        var thisSchedule = findSchedule("session", session.id);

        $("#attending-on").attr("data", session.id);
        if (thisSchedule != null && thisSchedule.attending=="yes") {
            $("#attending-on").hide();
            $("#attending-off").show();
        } else {
            $("#attending-off").hide();
            $("#attending-on").show();
        }
        if(thisSchedule != null && ( thisSchedule.contentrating!=0 || thisSchedule.speakerrating!=0)){
            $("#avg-rating").show();
        }else{
            $("#avg-rating").hide();
        }
        
        $('#attending-off a.contentrating').each(function(index, element) {
            var theme = thisSchedule != null && thisSchedule.contentrating == parseInt($(element).text()) ? "b" : "c";
            $(element)
                .removeClass('ui-btn-up-c ui-btn-up-b ui-btn-hover-c ui-btn-hover-b')
                .addClass('ui-btn-up-' + theme)
                .attr("data-theme", theme);
        });
        $('#attending-off a.speakerrating').each(function(index, element) {
            var theme = thisSchedule != null && thisSchedule.speakerrating == parseInt($(element).text()) ? "b" : "c";
            $(element)
                .removeClass('ui-btn-up-c ui-btn-up-b ui-btn-hover-c ui-btn-hover-b')
                .addClass('ui-btn-up-' + theme)
                .attr("data-theme", theme);
        });
        
        if (thisSchedule == null) {
            $("#sessionfeedback").text("");
            $("#sessionnotes").text("");
        } else {
            $("#sessionfeedback").text(thisSchedule.feedback);
            $("#sessionnotes").text(thisSchedule.notes);
        }
        $("#abstract").html(session.abstract);


        updateAvgRating(session.id);
        $("#room").html("<i class='icon-map-marker'></i> At " + locations[session.location].room + " room");
    }
});


function updateAvgRating(sessionId){
    if (testmode) {
        console.log("loading avg ratings");
    }
    $.ajax({
        type : "GET",
        url : wso2conAPI + sessionId + "/rating" + apiKey,
        headers: {'Authorization': 'Bearer ' + window.localStorage.getItem("access_token")},
        dataType : "json",
        cache: false,
        success : function(data) {
            if (testmode) {
                console.log("avg ratings received");
            }
            var setStarClass = function(div,ratingStr){
                var rate = Math.round(Number(ratingStr));
                div.attr("class","star-"+rate);
                div.html(rate);
            }
            setStarClass($("#content-rating"),data.contentRating);
            setStarClass($("#speaker-rating"),data.speakerRating);
        },
        error : function(data) {
            if (testmode) {
                console.log("avg ratings update failure");
            }
        }
    });

}



// Toggle RSVP button
$('#attending-on a.favorite').live('click', function(event){
    var sessionid = $("#attending-on").attr("data");
    changeSchedule(sessionid, "attending", "yes");
    $("#attending-on").hide();
    $("#attending-off").show();
});
$('#attending-off a.favorite').live('click', function(event){
    var sessionid = $("#attending-on").attr("data");
    changeSchedule(sessionid, "attending", "no");
    $("#attending-off").hide();
    $("#attending-on").show();
});

// handle rating buttons
$('#attending-off a.contentrating').live('click', function(event){
    var sessionid = $("#attending-on").attr("data");
    var thisSchedule = changeSchedule(sessionid, "contentrating", parseInt($(this).text()),
                            function(){
                                updateAvgRating(sessionid);
                                $("#avg-rating").show();
                            }
                        );
    $('#attending-off a.contentrating').each(function(index, element) {
        var theme = thisSchedule.contentrating == parseInt($(element).text()) ? "b" : "c";
        $(element)
            .removeClass('ui-btn-up-c ui-btn-up-b ui-btn-hover-c ui-btn-hover-b')
            .addClass('ui-btn-up-' + theme)
            .attr("data-theme", theme);
    });
});
$('#attending-off a.speakerrating').live('click', function(event){
    var sessionid = $("#attending-on").attr("data");
    var thisSchedule = changeSchedule(sessionid, "speakerrating", parseInt($(this).text()),
                            function(){
                                updateAvgRating(sessionid);
                                $("#avg-rating").show();
                            }
                        );
    $('#attending-off a.speakerrating').each(function(index, element) {
        var theme = thisSchedule.speakerrating == parseInt($(element).text()) ? "b" : "c";
        $(element)
            .removeClass('ui-btn-up-c ui-btn-up-b ui-btn-hover-c ui-btn-hover-b')
            .addClass('ui-btn-up-' + theme)
            .attr("data-theme", theme);
    });
});

// handle feedback and notes fields
$('#sessionfeedback').live('change', function(event){
    var sessionid = $("#attending-on").attr("data");
    changeSchedule(sessionid, "feedback", $(this).val());
});
$('#sessionnotes').live('change', function(event){
    var sessionid = $("#attending-on").attr("data");
    changeSchedule(sessionid, "notes", $(this).val());
});

// Schedule helper functions
// find the first scheduled event that matches the requested property and value
function findSchedule(property, value) {
    var thisSchedule = null;
    for (var s in schedule) {
        if (schedule[s][property] == value) {
            thisSchedule = schedule[s];
            break;
        }
    }
    return thisSchedule;
}

// change the requested event property.
function changeSchedule(sessionid, property, value, onSuccess) {
    var thisSchedule = null, index;
    for (var s in schedule) {
        if (schedule[s].session == sessionid) {
            thisSchedule = schedule[s];
            index = s;
            break;
        }
    }
    
    if (thisSchedule == null) {
        // No schedule exists for this eveent - make one.
        thisSchedule = {
            attending : "no",
            session : sessionid,
            contentrating : 0,
            speakerrating : 0,
            notes : "",
            feedback : ""
        }
        thisSchedule[property] = value;
       
        $.ajax({
            type : "POST",
            url : wso2conAPI + user.id + "/schedule" + apiKey,
            headers : {'Authorization': 'Bearer ' + window.localStorage.getItem("access_token")},
            data : thisSchedule,
            dataType : "json",
            success : function(data) {
                schedule.push(thisSchedule);
               
                window.localStorage.setItem("schedule", JSON.stringify(schedule));
                if(onSuccess){
                    onSuccess();
                }
            },
            error : function(data) {
                $("#popup_schedule_update_failed").popup("open");
            }
        });
        
    } else {
        schedule[index][property] = value;
        
        $.ajax({
            type : "PUT",
            url : wso2conAPI + user.id + "/schedule" + apiKey,
            headers : {'Authorization': 'Bearer ' + window.localStorage.getItem("access_token"), 'Content-Type' : 'application/json; charset=UTF-8'},
            data : JSON.stringify(schedule[index]),
            dataType : "json",
            success : function(data) {
                window.localStorage.setItem("schedule", JSON.stringify(schedule));
                if(onSuccess){
                    onSuccess();
                }
            },
            error : function(data) {
                $("#popup_schedule_update_failed").popup("open");
            }
        });
    }
    return thisSchedule;
}

