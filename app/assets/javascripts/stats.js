$(document).on('turbolinks:load', function(){
    'use strict';

    function displayStats(){
        var ctx = document.getElementById('stats').getContext('2d');
        var language = gon.language;
        var studytime = gon.studytime;
        // var colors = ['midnightblue', 'deeppink', 'royalblue', 'maroon', 'gold', 'cornflowerblue', 'darkorchid', 'gainsboro', 'teal', 'crimson', 'gray'];

        new Chart(ctx, {
        // 作成したいチャートのタイプ
        type: 'bar',

        // データセットのデータ
        data: {
            labels: ["今日", "昨日", "2日前", "3日前", "4日前", "5日前", "6日前"],
            datasets: [
                {label: language[0],
                backgroundColor: 'midnightblue',
                borderColor: 'midnightblue',
                data: studytime[0]},

                {label: language[1],
                    backgroundColor: 'deeppink',
                    borderColor: 'deeppink',
                    data: studytime[1]},

                {label: language[2],
                    backgroundColor: 'royalblue',
                    borderColor: 'royalblue',
                    data: studytime[2]},

                {label: language[3],
                    backgroundColor: 'maroon',
                    borderColor: 'maroon',
                    data: studytime[3]},

                {label: language[4],
                    backgroundColor: 'gold',
                    borderColor: 'gold',
                    data: studytime[4]},

                {label: language[5],
                    backgroundColor: 'cornflowerblue',
                    borderColor: 'cornflowerblue',
                    data: studytime[5]},

                {label: language[6],
                    backgroundColor: 'darkorchid',
                    borderColor: 'darkorchid',
                    data: studytime[6]},

                {label: language[7],
                    backgroundColor: 'gainsboro',
                    borderColor: 'gainsboro',
                    data: studytime[7]},

                {label: language[8],
                    backgroundColor: 'teal',
                    borderColor: 'teal',
                    data: studytime[8]},

                {label: language[9],
                    backgroundColor: 'crimson',
                    borderColor: 'crimson',
                    data: studytime[9]},

                {label: language[10],
                    backgroundColor: 'gray',
                    borderColor: 'gray',
                    data: studytime[10]},
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
                mode:'label', //マウスオーバー時に表示されるtooltip
                filter: function(data){
                    return (data.yLabel > 0);
                }
            }
        }
        });
    }

    if(document.getElementById('stats') != null){
        displayStats();
    }else{
        return;
    }
});
