$("#messages").live("pagebeforeshow", function (event, data) {
    if (testmode) {
        console.log("pagebeforeshow #meetings");
    }
    var $content = $("#messages div:jqmData(role=content)");

    checkMessages(function (msgs) {
        var userbucket = new Object();

        messages = msgs;
        if (testmode && messages.length == 0) {
            messages = dummyMessages;
        }
        for (var m in messages) {
            var mine = messages[m].from_user.id == user.id;
            var fromuser = mine ? messages[m].to_user.id : messages[m].from_user.id;
            if (userbucket[fromuser] == null) {
                userbucket[fromuser] = {
                    messages: [messages[m]],
                    newCount: 0
                };
            } else {
                userbucket[fromuser].messages.push(messages[m]);
            }
            if (!mine && messages[m].status == "new") {
                userbucket[fromuser].newCount++;
            }
        }

        var messagelist = "";
        if (messages.length == 0) {
            messagelist = '<div class="no-messages"><i class="icon-comment-alt icon-4x" ></i>';
            messagelist += '<p>You do not have any messages</p></div>';
        }
        for (var u in userbucket) {
            var thisUser = userbucket[u];
            var thisProfile = (thisUser.messages[0].from_user.id == user.id ? thisUser.messages[0].to_user : thisUser.messages[0].from_user);
            var messagelistitem = '<div data-role="collapsible" data-inset="false" data-theme="b" data-content-theme="c"' + (thisUser.newCount > 0 ? ' data-collapsed="false"' : '') + '><h2>' + thisProfile.firstname + ' ' + thisProfile.lastname + '</h2>';

                messagelistitem += '<form class="response"><ul data-role="listview" data-theme="c">';

            messagelistitem += '<li><div class="form"><table width="100%"><tr><td>' +
                '<textarea style="width:100%" data-mini="true" id="send-' + thisProfile.id + '"></textarea></td><td width="70px" style="width:70px">' +
                '<input class="send" type="button" id="respond-' + thisProfile.id + '" value="Send response" data-icon="forward" data-mini="true"/>' +
                '</td></tr></table></div></li>';

            // sort the messages by timestamp
            theseMessages = thisUser.messages.sort(function(a, b) {
                if (new Date(a.timestamp).valueOf() < new Date(b.timestamp).valueOf()) {
                    return 1;
                } else {
                    return -1;
                }
            });
            
            for (var m in theseMessages) {
                var thisMessage = theseMessages[m];
                var mine = thisMessage.from_user.id == user.id;
                var timestring = formatTime(new Date(thisMessage.timestamp));
                messagelistitem += '<li class="' + (thisMessage.status == "new" ? "new" : "read") + (mine ? " mine" : " notmine") + '">' + 
                    (!mine && thisMessage.status == "new" ? '<input class="read" data-inline="true" data-icon="check" data-iconpos="notext" data-mini="true" type="button" value="' + thisMessage.id + '"/>' : '' ) +
                    thisMessage.message + ' <span class="messagetime"> ' + timestring + '</span></li>';
            }
            messagelistitem += '</ul></form></div>';
            messagelist += messagelistitem;
        }

        $content.html(messagelist).trigger("create");

    });
});


$('#messages input.read').live('click', function (event) {
    //todo: send new status to API
    $target = $(event.currentTarget);
    var messageId = $target.val();
    for (var m in messages) {
        if (messages[m].id == messageId) {
            messages[m].status = "read";
            updateMessage(messages[m]);
            break;
        }
    }
    $target.parents("li").removeClass("new").addClass("read");
    $target.parent().remove();

});

$('#messages input.send').live('click', function (event) {
    sendMessage({
        to: event.currentTarget.id.substring(8),
        from: user.id,
        message: $(event.currentTarget).parents('li').find('textarea').val(),
        status: "new"
    });
});

function sendMessage(message) {
    $.mobile.loading('show');
    $.ajax({
        type: "POST",
        url: wso2conAPI + message.from + "/message" + apiKey,
        headers: {'Authorization': 'Bearer ' + window.localStorage.getItem("access_token")},
        data: message,
        dataType: "json",
        success: function (data) {
            if ($.mobile.activePage.attr("id") == "profile") {
                $("#requestmessage").val("");
                $("#accept").trigger("collapse");
            } else {
                var $send = $("#send-" + message.to);
                $send.val("");
                $send.parents("li").after(
                    $('<li class="mine">' + message.message + ' <span class="messagetime"> ' + formatTime(new Date()) + '</span></li>')
                );
                $send.parents("ul").listview("refresh");
            }
            $.mobile.loading('hide');
        },
        error: function (data) {
            $.mobile.loading('hide');
            if (testmode) {
                console.log("response failed");
            }
           alert("Message send failed - please reconnect and try again.");
        }
    });
}

function formatTime(time) {
    var now = new Date();
    var timestring = trimTime(time);
    if (now.valueOf() - time.valueOf() > 6*24*60*60*1000) {
        timestring = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"][time.getMonth()] + " " + (time.getDate() + 1) + " " + timestring;
    } else if (now.getDay() != time.getDay()) {
        timestring = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"][time.getDay()] + " " + timestring;
    }
    return timestring;

}

function updateMessage(message) {
    $.ajax({
        type: "PUT",
        url: wso2conAPI + "message/" + message.id + "/" + message.status + apiKey,
        headers: {'Authorization': 'Bearer ' + window.localStorage.getItem("access_token"), 'Content-Type' : 'application/x-www-form-urlencoded; charset=UTF-8'},
        dataType: "json",
        success: function (data) {
            if (testmode) {
                console.log("message update succeeded");
            }
        },
        error: function (data) {
            if (testmode) {
                console.log("message update failed");
            }
            alert("failed");
        }
    });
}


function checkMessages(callback) {
    $.mobile.loading('show');
    $.ajax({
        type: "GET",
        url: wso2conAPI + user.id + "/message/all" + apiKey,
        //url: wso2conAPI + user.email.replace('@', '_') + "/message" + apiKey,
        headers: {'Authorization': 'Bearer ' + window.localStorage.getItem("access_token")},
        dataType: "json",
        success: function (data) {
            callback(data);
            $.mobile.loading('hide');
        },
        error: function (data) {
            if (testmode) {
                console.log("Notification failure");
            }
        }
    });
}


