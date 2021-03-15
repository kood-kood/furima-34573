// $(function(){
//   $("#search-icon").click(function(){ //送信ボタンを押すとイベントが発火します
//     var input = $("#input-box").val(); // フォームの値を'input'という名前の変数に代入します
//     $.ajax({
//       type:'GET', // リクエストのタイプはGETです
//       url: '/items', // URLは"/meals"を指定します
//       data: {keyword: input}, // コントローラへフォームの値を送信します
//       dataType: 'json' // データの型はjsonで指定します
//     })
//     .done(function(data){
//       // 通信に成功した場合の処理です
//       $('.meal_list').empty(); //前回の検索結果が残っている場合はそれを消します
//       data.forEach(function(meal){
//         $('.meal_list').append(`<li>${meal.name} </li>`);
//       }) //データは配列形式でかえってくるので、forEachで繰り返し処理をします
//     })
//     .fail(function(){
//       // 通信に失敗した場合の処理です
//       alert('検索に失敗しました') // alertで検索失敗の旨を表示します
//     })
//   })
// })