<!doctype html>
<%@include file='defaultextend.jsp'%>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <title>jQuery Circle Charts Plugin Demos</title>
        <script src="js/echarts.min.js"></script>
        <style>

        </style>
    </head>
    <body>
        <div class="card" style="background-color:#f7f5fa; width: 300px;height:350px;margin: 10px;zoom: 100%">
            <div class="card-header header-elements-inline"
                 style="background-color:#4d7485;color:#FFF">
                <h5 class="card-title">Jumlah Frekuensi Kegagalan Operasional</h5>
            </div>
            <div class="card-body" id="main" >
            </div>
        </div>
        <script>
            var main = echarts.init(document.getElementById('main'));
            var option;
            option = {
                tooltip: {
                    formatter: '{a} <br/>{b} : {c}%'
                },
                series: [
                    {
                        name: 'Pressure',
                        type: 'gauge',
                        progress: {
                            show: true,
                            overlap: true,
                            width: 5,
                            roundCap: false,
                            clip: true
                        },
                        detail: {
                            valueAnimation: true,
                            formatter: '{value}',
                            show: true,
                            backgroundColor: 'rgba(0, 0, 0, 0)',
                            borderColor: '#ccc',
                            color: 'red',
                            fontSize: 14,
                            fontWeight: 'bold',
                            lineHeight: 70
                        },
                        data: [
                            {
                                value: 90.22
                            }
                        ]
                    }
                ]



//name: Pressure
//type: gauge
//progress:
                        //show: true
                        //overlap: true
                        //width: 10
                        //roundCap: false
                        //clip: true
//detail:
                        //valueAnimation: true
                        //formatter: {value}
                        //show: true
                        //backgroundColor: rgba(0,0,0,0)
                        //borderWidth: 0
                        //borderColor: #ccc
                        //width: 100
                        //height: null
                        //padding: 
                        //0: 5
                        //1: 10
                        //offsetCenter: 
                        //color: #464646
                        //fontSize: 30
                        //fontWeight: bold
                        //lineHeight: 30
//data: 
//zlevel: 0
//z: 2
//colorBy: data
//center: 
//legendHoverLink: true
//radius: 75%
//startAngle: 225
//endAngle: -45
//clockwise: true
//min: 0
//max: 100
//splitNumber: 10




            };
            main.setOption(option);

        </script>
    </body>
</html>