$("#twitter").live("pagebeforeshow", function (event, data) {
    if (testmode) {
        console.log("pagebeforeshow #twitter");
    }
    updateTweet();

    var twitterList = $("#twitterlist");
    var timeout = function () {
        setTimeout(timeout, 8000);
        if ($.mobile.activePage.data('url') == 'twitter') {
            updateTweet();
        }
    }

    var timer = twitterList.data("timer_running");
    if (!timer) {
        twitterList.data("timer_running", true);
        timeout();
    }
});

function updateTweet() {
    var twitterList = $("#twitterlist");
    var refreshUrl = twitterList.data("refresh_url");
    var url = 'https://search.twitter.com/search.json?callback=?'
    if (!refreshUrl) {
        url += '&q=%23WSO2Con&rpp=15';
    } else {
        url += '&' + refreshUrl.substr(1);
    }
    $.mobile.loading('show');
    $.ajax({
        url: url,
        dataType: 'jsonp',
        success: function (jsonp) {
            var maxId = twitterList.data("max_id");
            if (!maxId || ( jsonp.max_id > maxId )) {
                var results = jsonp.results;
                var resultsList = $('<ul data-role="list-view"></ul>');

                for (var i = 0; i < results.length; i++) {
                    var tweet = results[i];
                    var itemHtml = '<a href="https://twitter.com/' + tweet.from_user + '">';
                    itemHtml += '<img src="' + tweet.profile_image_url + '">';
                    itemHtml += '<div class="tweet-cont">';
                    itemHtml += '<strong>' + tweet.from_user_name + '</strong>';
                    itemHtml += '<span class="twitterid">@' + tweet.from_user + '</span>';
                    itemHtml += '<p>' + tweet.text + '</p>';
                    itemHtml += '</div></a>';
                    resultsList.append($('<li  data-transition="slide">' + itemHtml + '</li>'));
                }

                twitterList.data("refresh_url", jsonp.refresh_url);
                twitterList.data("max_id", jsonp.max_id);

                $.mobile.loading('hide');
                twitterList.prepend(resultsList);
                $("#twitterlist ul").listview();
            }
        }
    });
}
