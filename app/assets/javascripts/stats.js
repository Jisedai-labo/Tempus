$(document).on('turbolinks:load', function(){
    'use strict';

    var ctx = document.getElementById('stats').getContext('2d');
    var stats = gon.stats;
    
    new Chart(ctx, {
    // 作成したいチャートのタイプ
    type: 'bar',

    // データセットのデータ
    data: {
        labels: ["今日", "昨日", "2日前", "3日前", "4日前", "5日前", "6日前"],
        datasets: [
            {label: "HTML/CSS",
            backgroundColor: 'midnightblue',
            borderColor: 'midnightblue',
            data: stats["HTML/CSS"]},

            {label: "JavaScript",
                backgroundColor: 'deeppink',
                borderColor: 'deeppink',
                data: stats["JavaScript"]},

            {label: "JavaScripライブラリ",
                backgroundColor: 'royalblue',
                borderColor: 'royalblue',
                data: stats["JavaScripライブラリ"]},

            {label: "Ruby/Rails",
            backgroundColor: 'maroon',
            borderColor: 'maroon',
            data: stats["Ruby/Rails"]},

            {label: "Python/Django",
                backgroundColor: 'gold',
                borderColor: 'gold',
                data: stats["Python/Django"]},

            {label: "PHP",
            backgroundColor: 'cornflowerblue',
            borderColor: 'cornflowerblue',
            data: stats["PHP"]},

            {label: "Swift/Kotlin/Flutter",
                backgroundColor: 'darkorchid',
                borderColor: 'darkorchid',
                data: stats["Swift/Kotlin/Flutter"]},

            {label: "SQL",
            backgroundColor: 'gainsboro',
            borderColor: 'gainsboro',
            data: stats["SQL"]},

            {label: "C/C++",
            backgroundColor: 'teal',
            borderColor: 'teal',
            data: stats["C/C++"]},

            {label: "Java",
            backgroundColor: 'crimson',
            borderColor: 'crimson',
            data: stats["Java"]},

            {label: "その他",
            backgroundColor: 'gray',
            borderColor: 'gray',
            data: stats["その他"]},
        ]
    },

    // ここに設定オプションを書きます
    options: {
        title: {
            display: true,
            text: '1週間の勉強時間', //グラフの見出し
            padding:3
        },
        scales: {
            xAxes: [{
                  stacked: true, //積み上げ棒グラフにする設定
                  categoryPercentage:0.4 //棒グラフの太さ
            }],
            yAxes: [{
                  stacked: true //積み上げ棒グラフにする設定
            }]
        },
        legend: {
            labels: {
                  boxWidth:30,
                  padding:20 //凡例の各要素間の距離
            },
            display: true
        },
        tooltips:{
          mode:'label' //マウスオーバー時に表示されるtooltip
        }
    }
    });

});