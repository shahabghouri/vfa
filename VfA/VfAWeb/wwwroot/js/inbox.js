document.querySelector('.chat:first').classList.add('active-chat')
document.querySelector('.person:first').classList.add('active')
var currentChatUserId = null;

let friends = {
    list: document.querySelector('ul.people'),
    all: document.querySelectorAll('.left .person'),
    name: ''
},
chat = {
    container: document.querySelector('.container .right'),
    current: null,
    person: null,
    name: document.querySelector('.container .right .top .name')
};

friends.all.forEach(f => {
    f.addEventListener('mousedown', () => {
        f.classList.contains('active') || setActiveChat(f)
    })
});

function setActiveChat(f) {
    friends.list.querySelector('.active').classList.remove('active')
    f.classList.add('active')
    chat.current = chat.container.querySelector('.active-chat')
    chat.person = f.getAttribute('data-chat')
    chat.current.classList.remove('active-chat')
    chat.container.querySelector('[data-chat="' + chat.person + '"]').classList.add('active-chat')
    friends.name = f.querySelector('.name').innerText
    chat.name.innerHTML = friends.name
    currentChatUserId = chat.person;
    $('.chat').html('');
    GetMessages();
}
function GetMessages() {
    $.ajax({
        url: "/Inbox/GetMessages?userId=" + currentChatUserId,
        method: 'Get',
        data: data,
        success: function (response) {
            response.forEach(f => {
                if (response.SenderUserId == currentChatUserId || response.ReceiverUserId == currentChatUserId) {
                    $('.chat').append('<div class="bubble you">' +
                        response.Content +
                        '</div > ');
                }
                else {
                    $('.chat').append('<div class="bubble me">' +
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
    var data = {
        ReceiverUserId: currentChatUserId,
        Content: $('#message-box').val()
    }
    $.ajax({
        url: "/Inbox/Add",
        method: 'POST',
        data: data,
        success: function (response) {
            $('.chat').append('<div class="bubble me">'+
                msg +
                '</div > ');
        },
        error: function (response) {

        }
    });
}