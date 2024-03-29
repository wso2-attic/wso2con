// Process the user login
// todo: get this working properly - through the main API, and handling "already logged in" errors.
$('#login button').live('click', function (event) {
    $("#login_error").hide();
    $.mobile.loading('show');
    $.mobile.loading('hide');
    //$.mobile.changePage('#home');
    
    var un = $('#un').val();
    if (un.indexOf("test-") == 0) {
        un = un.substring(5);
        testmode = false;
    }
    var pw = $('#pw').val();

    $.ajax({
        type: "POST",
        url: tokenIssuer,
        beforeSend: function (req) {
            req.setRequestHeader('Authorization', "--ADD HERE--");
            req.setRequestHeader('Content-Type', "application/x-www-form-urlencoded");
        },
        data: {
            grant_type: "password",
            username: un,
            password: pw,
            scope: "PRODUCTION"
        },
        dataType: "json",
        success: function (data) {
            console.log(data.access_token);
            //if (richClient) {
            window.localStorage.setItem("access_token", data.access_token);
            //}
            realLogin(un, pw, data.access_token);
        },
        error: function (data) {
            if (testmode && un == "--ADD HERE--") {
                user = {
                    "regcode": "--ADD HERE--",
                    "bio": "--ADD HERE--",
                    "organisation": "--ADD HERE--2",
                    "title": "--ADD HERE--",
                    "home": "--ADD HERE--",
                    "email": "--ADD HERE--",
                    "lastname": "--ADD HERE--",
                    "firstname": "--ADD HERE--",
                    "expertise": "--ADD HERE--",
                    "id": "--ADD HERE--",
                    "interests": "--ADD HERE--",
                    "accepting": 1
                };
                $.mobile.loading('hide');
                //$.mobile.changePage('#home');
                $( "#login" ).popup( "close" );
            } else {
                $("#login_error").html("Unable to log in with this combination of username and password.").show();
                $.mobile.loading('hide');
            }
        }

    });
});

var realLogin = function (un, pw, atoken) {
    $.ajax({
        type: "POST",
        url: wso2conAPI + "login" + apiKey,
        beforeSend: function (req) {
            req.setRequestHeader('Authorization', "Bearer " + atoken);
        },
        data: {
            username: un,
            password: pw
        },
        dataType: "json",
        cache: false,
        success: function (data) {
            if (testmode) {
                console.log("pw success");
            }
            $.ajax({
                type: "GET",
                url: wso2conAPI + "attendee/" + data.id + apiKey,
                beforeSend: function (req) {
                    req.setRequestHeader('Authorization', "Bearer " + atoken);
                },
                dataType: "json",
                cache: false,
                success: function (data) {
                    if (testmode) {
                        console.log("registration success");
                    }
                    user = data;

                    window.localStorage.setItem("user", JSON.stringify(user));

                    $.mobile.loading('hide');
                    //$.mobile.changePage('#home');
                    $( "#login" ).popup( "close" );
                    syncSchedule();
                },
                error: function (data) {
                    if (testmode) {
                        console.log(JSON.stringify(data));
                    }
                    $("#login_error").html("Unable to locate registration, is this the email address you used to register?").show();
                    $.mobile.loading('hide');
                }
            });
        },
        error: function (data) {
            if (testmode && un == "--ADD HERE--") {
                user = {
                    "regcode": "--ADD HERE--",
                    "bio": "--ADD HERE--",
                    "organisation": "--ADD HERE--",
                    "title": "--ADD HERE--",
                    "home": "--ADD HERE--",
                    "email": "--ADD HERE--",
                    "lastname": "--ADD HERE--",
                    "firstname": "--ADD HERE--",
                    "expertise": "--ADD HERE--",
                    "id": "--ADD HERE--",
                    "interests": "--ADD HERE--",
                    "accepting": 1
                };
                $.mobile.loading('hide');
                $.mobile.changePage($('#nav').val());
            } else if (un == "test") {
                user = {
                    "regcode": "--ADD HERE--",
                    "bio": "--ADD HERE--",
                    "organisation": "--ADD HERE--2",
                    "title": "--ADD HERE--",
                    "home": "--ADD HERE--",
                    "email": "--ADD HERE--",
                    "lastname": "--ADD HERE--",
                    "firstname": "--ADD HERE--",
                    "expertise": "--ADD HERE--",
                    "id": "--ADD HERE--",
                    "interests": "--ADD HERE--",
                    "accepting": 1
                };
                $.mobile.loading('hide');
                $.mobile.changePage($('#nav').val());
                syncSchedule();
            } else {
                $("#login_error").html("Unable to log in with this combination of username and password.").show();
                $.mobile.loading('hide');
            }
        }
    });

};

// Add the login check handler to every page, redirect to login page if user isn't logged in.
/*$("div:jqmData(role='page')").live('pagebeforeshow', function (event) {
    if (user == null) {
        var currentPage = "#" + $(this).attr("id");
        if (currentPage == '#login') {
            $("#login_error").hide();
        } else {
            user = JSON.parse(window.localStorage.getItem("user"));
            if (user == null) {
                $('#nav').val(currentPage);
                window.location = "#login";
            }
            event.preventDefault();
        }
    }
});

$('#login').live('pagebeforeshow', function (event) {
    if (user != null) {
        $.mobile.changePage('#home');
    } else {
        user = JSON.parse(window.localStorage.getItem("user"));
        if (user != null) {
            $.mobile.changePage('#home');
        }

    }
});*/
