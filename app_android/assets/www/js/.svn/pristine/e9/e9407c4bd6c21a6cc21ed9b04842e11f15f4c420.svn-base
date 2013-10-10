$(function () {

    var chatServerUrl = 'https://chat.wso2con.com:6789';

    var socket;

    var getRoom = function () {
        return $('#select-choice-min').val();
    };

    var rooms = {
        track1: false,
        track2: false
    };

    var activeRoom = getRoom();

    var timeString = function (time) {
        time = timeParser(new Date(time));
        return time.hours + ':' + time.minutes + ' ' + time.meridiem;
    };

    var scroll = function () {
        $('html, body').animate({scrollTop: $(document).height()}, 'slow');
    };

    var addChat = function (data, room) {
        room = room || data.room;
        $('#chat-' + room + ' ul').append('<li>' +
            '<table width="100%"><tbody>' +
            '<tr>' +
            '<td class="chat-sender">' +
            '<span>' + formatUser(data.user) + '</span>' +
            '</td>' +
            '<td class="chat-message">' +
            '<div>' + textParser(data.message) + '</div>' +
            '<div>' +
            '<span class="chat-time">' + timeString(data.time) + '</span>' +
            '</div>' +
            '</td>' +
            '</tr>' +
            '</tbody></table>' +
            '</li>');
        scroll();
    };

    var joinUser = function (data, room) {
        room = room || data.room;
        $('#chat-' + room + ' ul').append('<table width="100%"><tbody><tr>' +
            '<td>' +
            '<div class="user-new">' + formatUser(data.user) + ' has joined the room.' +
            '<span class="chat-time">' + timeString(data.time) + '</span>' +
            '</div>' +
            '</td>' +
            '</tr></tbody></table>');
        scroll();
    };

    var leaveUser = function (data, room) {
        room = room || data.room;
        $('#chat-' + room + ' ul').append('<table width="100%"><tbody><tr>' +
            '<td>' +
            '<div class="user-new">' + formatUser(data.user) + ' has left the room.' +
            '<span class="chat-time">' + timeString(data.time) + '</span>' +
            '</div>' +
            '</td>' +
            '</tr></tbody></table>');
        scroll();
    };

    var formatUser = function (user) {
        return user;
    };

    $('#track-name').html($('option:selected', $(this)).html());
    $('.chat-log').hide();
    $('#chat-' + activeRoom).show();

    $('#select-choice-min').change(function () {
        $('#track-name').html($('option:selected', $(this)).html());
        /*socket.emit('unregister', {
            user: user.firstname + ' ' + user.lastname,
            uid: user.id,
            room: activeRoom
        });*/
        activeRoom = getRoom();
        $('.chat-log').hide();
        $('#chat-' + activeRoom).show();
        if(!rooms[activeRoom]) {
            socket.emit('register', {
                user: user.firstname + ' ' + user.lastname,
                uid: user.id,
                room: activeRoom
            });
            rooms[activeRoom] = true;
        }
    });

    $("#chat-text").keypress(function (e) {
        var inputText = $(this).val().trim();
        if (e.which == 13 && inputText) {
            var chunks = inputText.match(/.{1,1024}/g)
                , len = chunks.length;
            for (var i = 0; i < len; i++) {
                socket.emit('user message', {
                    message: chunks[i],
                    room: activeRoom
                });
            }

            $(this).val('');

            return false;
        }
    });

    $("#chat-input .send").click(function (e) {
        var inputText = $('#chat-text').val().trim();
        if (inputText) {
            var chunks = inputText.match(/.{1,1024}/g)
                , len = chunks.length;
            for (var i = 0; i < len; i++) {
                socket.emit('user message', {
                    message: chunks[i],
                    room: activeRoom
                });
            }

            $("#chat-text").val('');
            return false;
        }
    });

    $('#chat-link').click(function (event) {
        //$(this).unbind(event);
        if (!socket) {
            socket = io.connect(chatServerUrl);

            socket.on('error', function (reason) {
                console.error('Unable to connect Socket.IO', reason);
            });

            socket.on('connect', function () {
                console.info('successfully established a working connection');
                socket.emit('register', {
                    user: user.firstname + ' ' + user.lastname,
                    uid: user.id,
                    room: activeRoom
                });
                rooms[activeRoom] = true;
            });

            socket.on('register response', function () {
                socket.emit('history request', {
                    room: activeRoom
                });
            });

            socket.on('history response', function (data) {
                $('#chat-' + data.room + ' ul').empty();
                if (data.history && data.history.length) {
                    data.history.forEach(function (history) {
                        switch (history.type) {
                            case 'register' :
                                joinUser(history, data.room);
                                break;
                            case 'unregister' :
                                leaveUser(history, data.room);
                                break;
                            case 'message' :
                                addChat(history, data.room);
                                break;
                        }
                    });
                }
            });

            socket.on('new user', function (data) {
                joinUser(data);
            });

            socket.on('new message', function (data) {
                addChat(data);
            });

            socket.on('user leave', function (data) {
                leaveUser(data);
            });
        }
    });

    var timeParser = function (date) {
        var hours = date.getHours()
            , minutes = date.getMinutes()
            , seconds = date.getSeconds();
        return {
            hours: hours > 12 ? hours - 12 : hours,
            minutes: minutes > 10 ? minutes : '0' + minutes,
            seconds: seconds > 10 ? seconds : '0' + seconds,
            meridiem: hours > 12 ? 'PM' : 'AM'
        }
    };

    var textParser = function (text) {
        text = text
            .replace(/(\b(https?|ftp|file):\/\/[-A-Z0-9+&@#\/%?=~_|!:,.;]*[-A-Z0-9+&@#\/%=~_|])/ig, "<a href=\"$1\" target='_blank'>$1</a>")
            .replace(/(@)([a-zA-Z0-9_]+)/g, "<a href=\"http://twitter.com/$2\" target=\"_blank\">$1$2</a>");

        return  injectEmoticons(text);
    };

    var patterns = {
        angry: /\&gt;:-o|\&gt;:o|\&gt;:-O|\&gt;:O|\&gt;:-\(|\&gt;:\(/g,
        naughty: /\&gt;:-\)|\&gt;:\)|\&gt;:-\&gt;|\&gt;:\&gt;/g,
        sick: /:-\&amp;|:\&amp;|=\&amp;|=-\&amp;|:-@|:@|=@|=-@/g,
        smile: /:-\)|:\)|=-\)|=\)/g,
        wink: /;-\)|;\)/g,
        frown: /:-\(|:\(|=\(|=-\(/g,
        ambivalent: /:-\||:\|/g,
        gasp: /:-O|:O|:-o|:o|=-O|=O|=-o|=o/g,
        laugh: /:-D|:D|=-D|=D/g,
        kiss: /:-\*|:\*|=-\*|=\*/g,
        yuck: /:-P|:-p|:-b|:P|:p|:b|=-P|=-p|=-b|=P|=p|=b/g,
        yum: /:-d|:d/g,
        grin: /\^_\^|\^\^|\^-\^/g,
        sarcastic: /:-\&gt;|:\&gt;|\^o\)/g,
        cry: /:'\(|='\(|:'-\(|='-\(/g,
        cool: /8-\)|8\)|B-\)|B\)/g,
        nerd: /:-B|:B|8-B|8B/g,
        innocent: /O:-\)|o:-\)|O:\)|o:\)/g,
        sealed: /:-X|:X|=X|=-X/g,
        footinmouth: /:-!|:!/g,
        embarrassed: /:-\[|:\[|=\[|=-\[/g,
        crazy: /%-\)|%\)/g,
        confused: /:-S|:S|:-s|:s|%-\(|%\(|X-\(|X\(/g,
        moneymouth: /:-\$|:\$|=\$|=-\$/g,
        heart: /\(L\)|\(l\)/g,
        thumbsup: /\(Y\)|\(y\)/g,
        thumbsdown: /\(N\)|\(n\)/g,
        "not-amused": /-.-\"|-.-|-_-\"|-_-/g,
        "mini-smile": /c:|C:|c-:|C-:/g,
        "mini-frown": /:c|:C|:-c|:-C/g,
        content: /:j|:J/g,
        hearteyes: /\&lt;3/g
    };

    var emoticHTML = "<span class='emoticon $emotic'></span>";

    var injectEmoticons = function (text) {
        for (var emotic in patterns) {
            text = text.replace(patterns[emotic], emoticHTML.replace("$emotic", "emoticon-" + emotic));
        }
        return text;
    }
});
