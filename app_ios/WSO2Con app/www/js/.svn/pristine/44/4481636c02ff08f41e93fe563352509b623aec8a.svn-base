// Populate the agenda page
$('#agenda').live('pageshow', function (event) {
    if (testmode) {
        console.log("pageshow #agenda");
    }
    var currentSession = 0;
    var currentDay;
    if (testdateoffset > 0) {
        var now = new Date(agenda.sessions[0].start.valueOf() + testdateoffset * 1000 * 60 * 60);
    } else {
        now = new Date();
    }

    var count = 0;
    var template = "<div data-role='collapsible-set' data-inset='false'>";
    //var template = "<ul data-role='listview'>";
    for (var s in agenda.sessions) {
        var session = agenda.sessions[s];
        // Do some lazy cleanup of dates that have been recast as strings while in localStorage
        if (typeof(session.start) == "string") {
            session.start = new Date(session.start);
            session.end = new Date(session.end);
        }

        // Find out whether we need to inject a day separator
        if (currentDay == null || session.start.getDay() != currentDay.getDay()) {
            if (count > 0) {
                template += "</ul></div>";
            }
            currentDay = session.start;
            //template += "<li data-role='list-divider' id='t" + currentDay.valueOf() + "'>";
            if (count == 0) {
                template += "<div data-role='collapsible' data-theme='b' data-collapsed='false' id='t" + currentDay.valueOf() + "'><h3>";
            } else {
                template += "<div data-role='collapsible' data-theme='b' id='t" + currentDay.valueOf() + "'><h3>";
            }

            template += ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"][currentDay.getDay()];
            //template += "</li>";
            template += "</h3>";
            template += "<ul data-role='listview'>";
            //template += "</li>";
            count++;
        }
        // Look for nearest session in the past
        if (session.start.valueOf() <= now.valueOf()) {
            currentSession = session.start.valueOf();
        }

        var thisSchedule = findSchedule("session", session.id);
        if (thisSchedule == null) {
            var favorite = false;
        } else {
            favorite = thisSchedule.attending == "yes";
        }
        template += "<li id='t" + session.start.valueOf() + "' class='" + session.type + "'" + (favorite ? " data-theme='e'" : "") + ">";
        if (session.type != "break") {
            template += "<a href='#session?id=" + session.id + "' data-transition='slide'>";
        }
        template += "<p class='ui-li-aside ui-li-desc'><span class='duration'><i class='icon-time'></i> " +
            trimTime(session.start) + "-" +
            trimTime(session.end) + "";
        if (session.location != "none") {
            template += "</span><br/><span class='location'><i class='icon-map-marker'></i> " + locations[session.location].room;
        }
        template += "</span></p>";
        template += "<h3 class='ui-li-heading'>" + session.title + "</h3>";
        if (session.speaker.length > 0) {
            template += "<p class='ui-li-desc speaker'><i class='icon-bullhorn'></i> ";
        }
        var notfound = session.speaker.length > 0;
        for (var p in session.speakerprofile) {
            var profile = session.speakerprofile[p];
            if (p != "0") {
                template += ", ";
            }
            template += profile.firstname + " " + profile.lastname;
            notfound = false;
        }
        if (notfound) {
            template += "[speaker profile not found]";
        }
        if (session.speaker.length > 0) {
            template += "</p>";
        }
        if (session.type != "break") {
            template += "</a>";
        }
        template += "</li>";
    }
    //template += "</ul>";
    template += "</ul></div></div>";

    $("#agendadetails").html(template).trigger("create");
    if ($.mobile.pageData && $.mobile.pageData.t) {
        $.mobile.silentScroll($("#t" + $.mobile.pageData.t).position().top - 42);
    } else if (currentSession > 0) {
        $.mobile.silentScroll($("#t" + currentSession).position().top - 42);
    }
});

function trimTime(d) {
    // normalize out variations in LocaleTimeString results (leading zeroes)
    var e = d.toLocaleTimeString().split(":");
    var f = e[0] + ":" + e[1];
    if (f.charAt(0) == "0") {
        f = f.substring(1);
    }
    return f;
}
