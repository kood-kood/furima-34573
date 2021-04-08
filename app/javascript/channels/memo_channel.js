import consumer from "./consumer"

consumer.subscriptions.create("MemoChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<div class="memo-list">
                       <div class="show-notes"><p>${data.content.memo}</p></div>
                       <div class="memo-date"><p>${data.content.created_at}</p></div>
                  </div>`;
    const memos = document.getElementById('memos');
    const newMemo = document.getElementById('memo_memo');
    memos.insertAdjacentHTML('afterbegin', html);
    newMemo.value='';
  }
 });





 
 // document.getElementById('memo-container').
    //   insertAdjacentHTML('beforeend', data['memo'])
    // memoContainer.insertAdjacentHTML('beforeend', data['memo'])
    // console.log(data)