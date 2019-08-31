$(document).on('turbolinks:load', function(){
    'use strict';

    var ctx = document.getElementById('stats').getContext('2d');
    var studytimes = gon.studytimes;
    var kyouzai = gon.kyouzai;
    
    new Chart(ctx, {
    // 作成したいチャートのタイプ
    type: 'bar',

    // データセットのデータ
    data: {
        labels: ["1月", "2月", "3月", "4月", "5月", "6月", "7月"],
        datasets: [{
            label: "勉強時間",
            backgroundColor: 'rgb(255, 99, 132)',
            borderColor: 'rgb(255, 99, 132)',
            data: [100, 10, 5, 2, 20, 30, 45],
        }]
    },

    // ここに設定オプションを書きます
    options: {
    }
    });

});