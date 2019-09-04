$(document).on('turbolinks:load', function(){
    'use strict';

    var ctx = document.getElementById('stats').getContext('2d');
    var stats = gon.stats;
    var language = Object.keys(stats);
    
    new Chart(ctx, {
    // 作成したいチャートのタイプ
    type: 'bar',

    // データセットのデータ
    data: {
        labels: ["今日", "昨日", "2日前", "3日前", "4日前", "5日前", "6日前"],
        datasets: [
            {label: language[0],
            backgroundColor: 'rgb(255, 99, 132)',
            borderColor: 'rgb(255, 99, 132)',
            data: studytimes[language[0]]},

            {label: language[1],
                backgroundColor: 'rgb(255, 99, 132)',
                borderColor: 'rgb(255, 99, 132)',
                data: studytimes[language[1]]},

            {label: language[2],
                backgroundColor: 'rgb(255, 99, 132)',
                borderColor: 'rgb(255, 99, 132)',
                data: studytimes[language[2]]},

            {label: language[3],
            backgroundColor: 'rgb(255, 99, 132)',
            borderColor: 'rgb(255, 99, 132)',
            data: studytimes[language[3]]},

            {label: language[4],
                backgroundColor: 'rgb(255, 99, 132)',
                borderColor: 'rgb(255, 99, 132)',
                data: studytimes[language[5]]},

            {label: language[5],
            backgroundColor: 'rgb(255, 99, 132)',
            borderColor: 'rgb(255, 99, 132)',
            data: studytimes[language[5]]},

            {label: language[6],
                backgroundColor: 'rgb(255, 99, 132)',
                borderColor: 'rgb(255, 99, 132)',
                data: studytimes[language[6]]},
        ]
    },

    // ここに設定オプションを書きます
    options: {
    }
    });

});