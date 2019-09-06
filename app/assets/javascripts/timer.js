$(document).on('turbolinks:load', function(){
    'use strict';
    
    var start = document.getElementById('start'); // startボタンを取得

    var studyTime = 0; // 勉強時間

    var startTime;
    var stopTime;
    var timerId;

    var now;
    var hour;
    var min;
    var sec;
  
    // タイマーが動作しているかどうか
    var isRunning = false;
  
    function updateTimer(t){
      
      now = new Date();
      
      var temp = studyTime + parseInt((now - startTime) / 1000);
      
      // タイマー処理
	    hour = parseInt(temp / 3600);
	    min = parseInt((temp / 60) % 60);
	    sec = temp % 60;

	    // 数値が1桁の場合、頭に0を付けて2桁で表示する指定
	    if(hour < 10) { hour = "0" + hour; }
	    if(min < 10) { min = "0" + min; }
	    if(sec < 10) { sec = "0" + sec; }

	    // フォーマットを指定
	    var timeCount = hour + 'h' + min + 'm' + sec + 's';

	    // テキストフィールドにデータを渡す処理
	    $('#timer').text(timeCount);
    }
  
    // カウントアップ機能
    function countUp(){
      timerId = setTimeout(function(){
        updateTimer(studyTime);
        countUp();
      }, 10);
    }
  
  
    // startボタンの挙動
    start.addEventListener('click', function(){
      // startを押した際にタイマーが動作している場合・していない場合で条件分岐
      if (isRunning === false){
        // 動作していない場合
        isRunning = true;
        start.textContent = 'Stop';
        startTime = new Date();
        countUp();
      } else {
        // 動作している場合
        isRunning = false;
        start.textContent = 'Start';
        clearTimeout(timerId);
        
        if(startTime){
          stopTime = new Date();
          studyTime += parseInt((stopTime - startTime) / 60000);
          $('#post_studytime').val(studyTime); // 隠しパラメータとして勉強時間を渡す
        }
      }
    });

});
  