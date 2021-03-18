import consumer from "./consumer"

consumer.subscriptions.create("ItemChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data)
    const html = `<div class="comments-list">
                        <div class="comment-user">: ${data.user.nickname} :</div>
                        <div class="message-text">${data.content.text}</div>
                  </div>`;
    const messages = document.getElementById('messages');
    const newMessage = document.getElementById('message_text');
    messages.insertAdjacentHTML('afterbegin', html);
    newMessage.value='';
  },

  speak: function() {
    return this.perform('speak');
  }
});
