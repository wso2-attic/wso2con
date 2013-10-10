// Update home page
$('#home').live('pagebeforeshow', function (event) {
    if (testmode) {
        console.log("pagebeforeshow #home");
        $("#timetest").show();
    }
    // allow date offsetting to support testing
    var now;
    if (testdateoffset > 0) {
        now = new Date(agenda.sessions[0].start.valueOf() + testdateoffset * 1000 * 60 * 60);
    } else {
        var l = new Date().toUTCString();
        now = new Date(l.substr(0,l.length-4));
    }
    var currentSessions = [];
    var eventStart = new Date(2013, 1, 13);
    var eventEnd = new Date(2000, 1, 1);

    try { // For some reason this doesn't work on iPhone without the try (even though it doesn't get triggered - wierd...
        for (var s in agenda.sessions) {
            if (typeof(agenda.sessions[s].start) == "string") {
                agenda.sessions[s].start = new Date(agenda.sessions[s].start);
            }
            if (typeof(agenda.sessions[s].end) == "string") {
                agenda.sessions[s].end = new Date(agenda.sessions[s].end);
            }
            if (agenda.sessions[s].start.valueOf() <= now.valueOf() &&
                now.valueOf() < agenda.sessions[s].end.valueOf()) {
                currentSessions.push(agenda.sessions[s]);
            }
            if (agenda.sessions[s].start.valueOf() < eventStart.valueOf()) {
                eventStart = agenda.sessions[s].start;
            }
            if (agenda.sessions[s].end.valueOf() > eventEnd.valueOf()) {
                eventEnd = agenda.sessions[s].end;
            }
        }

    } catch (e) {
    }

    var trimmed = false;
    for (var s in currentSessions) {
        var thisSchedule = findSchedule("session", currentSessions[s].id);
        if (thisSchedule != null && thisSchedule.attending == "yes") {
            currentSessions = [currentSessions[s]];
            trimmed = true;
            break;
        }
    }

    if (currentSessions.length > 0) {
        var sessionDetails = "";
        var sessionTitle = "";
        for (var s in currentSessions) {
            sessionDetails += sessionReference(currentSessions[s]);
            sessionTitle += trimContent(currentSessions[s].title, 24 / currentSessions.length);
        }
        if (trimmed) {
            var agendaPosition = currentSessions[0].start.valueOf();
            sessionDetails += "<div class='note'><a href='#agenda?t=" + agendaPosition + "'>See other simultaneous tracks.</a></div>";
        } else if (currentSessions.length > 1) {
            sessionDetails += "<div class='note'>Mark your favorite tracks to shorten this list.</div>";
        }
        $("#nowPlayingDetails").html(sessionDetails);
        $("#nowPlayingTitle").html("Now playing: " + sessionTitle);

        var next = currentSessions[0].end;
        var nextSessions = [];
        for (var s in agenda.sessions) {
            if (agenda.sessions[s].start.valueOf() <= next.valueOf() &&
                next.valueOf() < agenda.sessions[s].end.valueOf()) {
                nextSessions.push(agenda.sessions[s]);
            }
        }
        for (var s in nextSessions) {
            var thisSchedule = findSchedule("session", nextSessions[s].id);
            if (thisSchedule != null && thisSchedule.attending == "yes") {
                nextSessions = [nextSessions[s]];
                break;
            }
        }


        trimmed = false;
        for (var s in nextSessions) {
            var thisSchedule = findSchedule("session", nextSessions[s].id);
            if (thisSchedule != null && thisSchedule.attending == "yes") {
                nextSessions = [nextSessions[s]];
                trimmed = true;
                break;
            }
        }

        if (nextSessions.length > 0) {
            sessionDetails = "";
            sessionTitle = "";
            for (var s in nextSessions) {
                sessionDetails += sessionReference(nextSessions[s]);
                sessionTitle += trimContent(nextSessions[s].title, 24 / nextSessions.length);
            }

            if (trimmed) {
                var agendaPosition = nextSessions[0].start.valueOf();
                sessionDetails += "<div class='note'><a href='#agenda?t=" + agendaPosition + "'>See other simultaneous tracks.</a></div>";
            } else if (nextSessions.length > 1) {
                sessionDetails += "<div class='note'>Mark your favorite tracks to shorten this list.</div>";
            }
            $("#upNextAll").show();
            $("#upNextDetails").html(sessionDetails);
            $("#upNextTitle").html("Up next: " + sessionTitle);
        }else{
            $("#upNextAll").hide();
            $("#upNextDetails").html("");
            $("#upNextTitle").html("Up next: -");
        }

        $("#upcoming").show();
        $("#countdown").hide();
    } else if (now < eventStart) {
        $("#upcoming").hide();
        var hoursTillStart = Math.floor((eventStart - now) / (1000 * 60 * 60));
        if (hoursTillStart > 72) {
            var countdownText = Math.floor(hoursTillStart / 24) + " days";
        } else {
            countdownText = hoursTillStart + " hours";
        }
        $("#countdown").html("WSO2Con 2013 starts in " + countdownText + "!<div class='note'>But start preparing now! RSVP for your favorite sessions to build your personal agenda.  Update your <a href='#settings' data-rel='dialog' data-transition='pop'>user profile</a> to allow 1-1 interactions!</div>").show();
    } else if (eventEnd < now) {
        $("#upcoming").hide();
        $("#countdown").html("We hope you enjoyed WSO2Con 2013, please visit <a href='http://wso2con.com'>wso2con.com</a> for recordings and details of other WSO2 events.").show();
    }else{
        $("#countdown").hide();
        $("#upcoming").hide();
    }
    if (user != null) {
        checkMessages(function (messages) {
            //TODO: after testing remove this
            if (testmode && messages.length == 0) {
                messages = dummyMessages;
            }
            $("#notifications").show();
            if (messages != null && messages.length > 0) {
                var newCount = 0;
                for (var i in messages) {
                    if (messages[i].from_user.id != user.id && messages[i].status == "new") {
                        newCount++;
                    }
                }
                $("#notifications span.ui-li-count").show().html(newCount);
            } else {
                $("#notifications span.ui-li-count").hide();
            }
        });
    }


});

function sessionReference(session) {
    var template = "<div>";
    template += "<p class='ui-li-aside ui-li-desc'>[" +
        trimTime(session.start) + "-" +
        trimTime(session.end) + "]";
    if (session.location != "") {
        template += "<br/>" + locations[session.location].room;
    }
    template += "</p>";
    template += "<h3 class='ui-li-heading'>" + session.title + "</h3>";
    if (session.speaker.length > 0) {
        template += "<p class='ui-li-desc speaker'>";
    }
    for (var p in session.speakerprofile) {
        var profile = session.speakerprofile[p];
        if (p != "0") {
            template += ", ";
        }
        template += "<a href='#profile?id=" + profile.id + "'>" + profile.firstname + " " + profile.lastname + "</a>";
    }
    if (session.speaker.length > 0) {
        template += "</p>";
    }
    if (session.type != "break") {
        template += "<a href='#session?id=" + session.id + "' class='more'>more info and feedback...</a>";
    }
    template += "</div><hr style='clear:both'/>";
    return template;
}
function trimContent(text, len) {
    if (text.length > len) {
        text = text.substring(0, len) + "..."
    }
    return text;
}

// Enter test date
testdateoffset = 0;
$("#testdateoffset").live("change", function () {
    testdateoffset = parseFloat($("#testdateoffset").val());
    if (isNaN(testdateoffset)) {
        testdateoffset = 0;
    }
    $("#home").trigger("pageshow");
});



