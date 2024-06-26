$('.chat:first').addClass('active-chat')
$('.person:first').addClass('active')
var currentChatUserId = $('.person:first').data('chat');
let friends = {
    list: document.querySelector('ul.people'),
    all: document.querySelectorAll('.left .person'),
    name: ''
},
    chat = {
        container: document.querySelector('.chat-container .right'),
        current: null,
        person: null,
        name: document.querySelector('.chat-container .right .top .name')
    };

friends.all.forEach(f => {
    f.addEventListener('mousedown', () => {
        f.classList.contains('active') || setActiveChat(f)
    })
});
if (friends.all.length != 0) {
    setActiveChat($('.person:first')[0])
}

function setActiveChat(f) {
    if (friends.all.length == 0) {
        return;
    }
    if (friends.all.length > 1) {
        friends.list.querySelector('.active').classList.remove('active')
    }
    f.classList.add('active')
    chat.current = chat.container.querySelector('.active-chat')
    chat.person = f.getAttribute('data-chat')
    chat.current.classList.remove('active-chat')
    chat.container.querySelector('[data-chat="' + chat.person + '"]').classList.add('active-chat')
    friends.name = f.querySelector('.name').innerText
    chat.name.innerHTML = friends.name
    currentChatUserId = chat.person;
    //GetMessages();
    var $target = $('.chat-container');
    $target.animate({ scrollTop: $target.height() + 1000 }, 1000);
}
function GetMessages() {
    $.ajax({
        url: "/Inbox/GetMessages?userId=" + currentChatUserId,
        method: 'Get',
        success: function (response) {
            response.forEach(f => {
                if (response.SenderUserId == currentChatUserId || response.ReceiverUserId == currentChatUserId) {
                    $('.active-chat').append('<div class="bubble you">' +
                        response.Content +
                        '</div > ');
                }
                else {
                    $('.active-chat').append('<div class="bubble me">' +
                        response.Content +
                        '</div > ');
                }
            });

        },
        error: function (response) {

        }
    });
}
function SendMessage() {
    var msg = $('#message-box').val();
    if (msg == '') {
        return;
    }
    var data = {
        ReceiverUserId: currentChatUserId,
        Content: $('#message-box').val()
    }
    $.ajax({
        url: "/Inbox/Add",
        method: 'POST',
        data: data,
        success: function (response) {
            let today = new Date();
            $('.active-chat').append('<div class="bubble me mb-3">' +
                msg +
                '<p class="message-time">' + formatTime(today) + '</div></div > ');
            $('#message-box').val('');
            msg = msg.length > 30 ? msg.slice(0, 25) + "..." : msg;
            $('.person.active .preview').html(msg);
            $('.person.active').prependTo('.people')
            $('.person.active .time').html(formatTime(today));
            var $target = $('.chat-container');
            $target.animate({ scrollTop: $target.height() + 1000 }, 1000);
            $('.active-chat .today-conversation').show();
        },
        error: function (response) {

        }
    });
}
function formatTime(d) {
    var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
    var days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
    var day = days[d.getDay()];
    var hr = d.getHours();
    var min = d.getMinutes();
    if (min < 10) {
        min = "0" + min;
    }
    var ampm = "am";
    if (hr > 12) {
        hr -= 12;
        ampm = "pm";
    }
    var date = d.getDate();
    var month = months[d.getMonth()];
    var year = d.getFullYear();
    return hr + ":" + min + " " + ampm.toUpperCase();
}

function OpenUsersModal() {
    $('#subscriptionModal').modal('show');
}
function StartConversation() {
    var userId = $('#users-select').val();
    if (userId != -1) {
        currentChatUserId = userId;
        if ($('#person-' + currentChatUserId).length != 0) {
            $('#person-' + currentChatUserId).click();
            $('#subscriptionModal').modal('hide');
            $('#users-select').val('-1');
            return;
        }
        var userName = $('#users-select option:selected').data('username');
        $('.people').prepend('<li id="person-' + currentChatUserId + '" onmousedown="setActiveChat(this)" class="person d-flex " data-chat="' + currentChatUserId + '" data-chatUser="' + userName + '">' +
            '<img src="/images/user.png" alt="" />' +
            '<div>' +
            '   <div class="name">' + userName + '</div>' +
            '<div class="preview">...</div>' +
            '<span class="time">---</span>' +
            '</div>' +
            '</li>')
        friends.all = document.querySelectorAll('.left .person');
        $('#person-' + currentChatUserId).click();
        $('#subscriptionModal').modal('hide');
        $('#users-select').val('-1');
    }
}