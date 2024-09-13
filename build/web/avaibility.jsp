<%-- 
    Document   : dashboard
    Created on : 09-Oct-2021, 15:35:17
    Author     : matajari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='defaultextend.jsp'%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width">
        <title>DASHBOARD MONITORING CNS</title>
        <link rel="stylesheet" href="css/navbar.css">
        <script src="js/jquery.circlechart.js"></script>
        <script src="js/echarts.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!--<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>-->
        <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
        <style>
            @import url("//unpkg.com/element-ui@2.15.6/lib/theme-chalk/index.css");
            body{
                background-color: #eff1f5;
                font-family: 'Roboto';
            }
            .header {
                background-color: #f1f1f1;
                text-align: center;
            }


            #navbar a {
                float: left;
                display: block;
                color: #f1f1f1;
                text-align: center;
            }

            #navbar a:hover {
                color: white;
            }

            #navbar a.active {
                background-color: #04AA6D;
                color: white;
            }

            .sticky {
                position: fixed;
                top: 0;
                width: 100%;
            }
            .dropdown-menu.show{
                margin-top: 10px;
                min-width: 8rem;
                font-size: 13px;
            }

            .themed-grid-col {
                padding-top: .75rem;
                padding-bottom: .75rem;
                background-color: rgba(86, 61, 124, .15);
                border: 1px solid rgba(86, 61, 124, .2);
            }

            .themed-container {
                padding: .75rem;
                margin-bottom: 1.5rem;
                background-color: rgba(0, 123, 255, .15);
                border: 1px solid rgba(0, 123, 255, .2);
            }
            table, th, td {
                /*border:2px solid black;*/
            }
            td {padding-bottom: 8px}
            .circle {
                border-radius: 50%;
                width: 100px;
                background: #fff;
                border: 2px solid #009688;
                color: #009688;
                font-size: 14px;
                height: 100px;
                line-height: 100px;
                text-align: center;
            }
            .card-body {
                background-color: white;
            }
/*            canvas{

                width:130% !important;
                height:100% !important;

            }*/
        </style>
    </head>
    <body>
        <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
        <!--<script src="https//unpkg.com/vue/dist/vue.js"></script>-->
        <script src="https://unpkg.com/element-ui@2.15.6/lib/index.js"></script>
        <!--navbar atas start-->
        <nav class="navbar navbar-expand-md navbar-dark header" style="background-color: #28a8e0 !important; height: 90px; border-top: 2px solid gold">
            <div class="container-fluid">
                <a href="dashboard.jsp" class="d-flex align-items-center mb-0 mb-lg-0 text-dark text-decoration-none" style="float: left">
                    <img class="" src="img/logo-kemenhub.png" alt="" width="80" height="90">
                </a>
                <p class="navbar-brand" style="font-size: 16px"><strong style="font-size: 25px">DASHBOARD MONITORING CNS</strong><br>DIREKTORAT NAVIGASI PENERBANGAN</p>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample04" aria-controls="navbarsExample04" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="dropdown text-end" style="">
                    <!--<a href="#" class="d-block link-light text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">-->
                    <!--<img src="img/user-icon.png" alt="mdo" width="32" height="32" class="rounded-circle"><label style="font-size: 13px; color: white; margin-left: 10px">Super User</label>-->
                    <!--</a>-->
                    <!--<ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1" style="font-size: 13px; color: white;">-->
                    <!--<li><a class="dropdown-item" href="#"><i class="fa fa-power-off" style="padding-right: 10px; color: red"></i>Logout</a></li>-->
                    <!--</ul>-->
                </div>
            </div>
        </nav>
        <!--navbar atas end-->

        <!--navbar fix start-->
        <nav id="navbar" class="navbar navbar-expand-md navbar-light" style="background-color: #0487b5; z-index: 999;">
            <div class="container-fluid">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav me-auto mb-2 mb-md-0" style="font-size: 13px">
                        <li class="nav-item" style="margin-left: 10px;">
                            <a class="nav-link" href="dashboard.jsp"><i class="fa fa-home" style="margin-right: 10px;"></i>Dashboard</a>
                        </li>
                        <!--                        <li class="nav-item" style="margin-left: 10px;">
                                                    <a class="nav-link" href="#"><i class="fa fa-area-chart" style="margin-right: 10px;"></i>Statistic</a>
                                                </li>
                                                <li class="nav-item" style="margin-left: 10px;">
                                                    <a class="nav-link" href="#"><i class="fa fa-table" style="margin-right: 10px;"></i>Report</a>
                                                </li>
                                                <li class="nav-item" style="margin-left: 10px;">
                                                    <a class="nav-link" href="http://10.30.215.26:9502/bi-security-login/login.jsp" target="_blank"><i class="fa fa-bar-chart" style="margin-right: 10px;"></i>DV Dashboard & Analytic</a>
                                                </li>
                                                <li class="nav-item" style="margin-left: 10px;">
                                                    <a class="nav-link" href="https://10.30.210.7" target="_blank"><i class="fa fa-bar-chart" style="margin-right: 10px;"></i>RMMS</a>
                                                </li>
                                                <li class="nav-item dropdown" style="margin-left: 10px;">
                                                    <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa fa-cog" style="margin-right: 10px;"></i>Setup</a>
                                                    <ul class="dropdown-menu" aria-labelledby="dropdown04">
                                                        <li><a class="dropdown-item" href="#" style="color: black">User</a></li>
                                                        <li><a class="dropdown-item" href="#" style="color: black">Menu</a></li>
                                                        <li><a class="dropdown-item" href="#" style="color: black">Broadcast Group</a></li>
                                                        <li><a class="dropdown-item" href="#" style="color: black">Broadcast Email</a></li>
                                                    </ul>
                                                </li>-->
                    </ul>
                    <div id="time" style="color: #f1f1f1;text-align: center; font-size: 13px"></div>
                </div>
            </div>
        </nav>
        <!--navbar fix end-->

        <!--content  start-->
        <div class="header-elements" style="margin: 20px 0px 20px 30px;"><h5>Availability Device</h5></div>
        <div class="content" style="z-index: -1; background-color: white; width: -webkit-fill-available; height: auto; margin: 25px; border-radius: 8px; padding: 30px">
            <div class="row">
                <div class="col">
                    <label class="form-control" style="border: none">Availability Device ( ID: <span id="ava_dev_id"></span>, KOTA: <span id="ava_dev_kota"></span> - <span id="ava_dev_prov"></span> )</label>
                </div>
                <div class="col">
                    <select type="text" class="form-control" style="width: auto; float: right" id="opsi" onchange="changebro()">
                        <option value="1">1 Minggu</option>
                        <option value="2">1 Bulan</option>
                        <option value="3">6 Bulan</option>
                        <option value="4">1 Tahun</option>
                        <option value="5">Periode Tanggal</option>
                    </select>
                </div>
                <div class="col" id="daterange" style="display: none"></div>
            </div>
            <div class="row-cols-md-auto" style="display: inline-flex">
                <div class="card" style="background-color:#f7f5fa; width: 450px;height:300px;margin: 10px;" id="app">
                    <div class="card-header header-elements-inline"
                         style="background-color:#4d7485;color:#FFF">
                        <h5 class="card-title">Availability</h5>
                    </div>
                    <div class="card-body" style="display: inline-flex; margin: 3px">
                        <div style="width: 100px; height: 150px;" id="radar">
                            <p style="text-align:center;font-weight:normal;margin:7px">SENSOR</p>
                        </div>
                        <div id="sdcs" style="width: 100px; height: 150px;">
                            <p style="text-align:center;font-weight:normal;margin:7px">INFRA</p>
                        </div>
                        <div id="lan1" style="width: 100px; height: 150px;">
                            <p style="text-align:center;font-weight:normal;margin:7px">SW I</p>
                        </div>
                        <div id="lan2" style="width: 100px; height: 150px;">
                            <p style="text-align:center;font-weight:normal;margin:7px">SW II</p>
                        </div>
                    </div>
                </div>
                <div class="card" style="background-color:#f7f5fa; width: 300px;height:300px;margin: 10px;">
                    <div class="card-header header-elements-inline"
                         style="background-color:#4d7485;color:#FFF">
                        <h5 class="card-title">Availability Radar</h5>
                    </div>
                    <div class="card-body" id="avaibility_radar">

                    </div>
                </div>
                <div class="card" style="background-color:#f7f5fa; width: 450px;height:300px;margin: 10px;text-align: -webkit-center;">
                    <div class="card-header header-elements-inline"
                         style="background-color:#4d7485;color:#FFF">
                        <h5 class="card-title">Performance</h5>
                    </div>
                    <div class="card-body" style="display: inline-flex; margin: 3px;">
                        <div style="width: 150px; height: 150px;" id="">
                            <div class="circle" id="mttr"></div>
                            <p style="text-align:center;font-weight:normal;margin:7px">MTTR</p>
                        </div>
                        <div id="" style="width: 150px; height: 150px;">
                            <div class="circle" id="mtbf"></div>
                            <p style="text-align:center;font-weight:normal;margin:7px">MTBF</p>
                        </div>
                        <div id="" style="width: 150px; height: 150px;">
                            <div class="circle" id="reliability"></div>
                            <p style="text-align:center;font-weight:normal;margin:7px">RELIABILITY</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row-cols-md-auto" style="display: inline-flex">
                <div class="card" style="background-color:#f7f5fa; width: 450px;height:250px;margin: 10px;text-align: center">
                    <div class="card-header header-elements-inline"
                         style="background-color:#4d7485;color:#FFF">
                        <h5 class="card-title">RMM DNP Saat Ini</h5>
                    </div>
                    <div class="card-body" style="display: inline-flex; margin: 3px">
                        <div style="width: 100px; height: 150px; margin-right: 5px" id="">
                            <p style="text-align:center;font-weight:normal;margin:7px">SENSOR</p>
                            <img id="rmm_sensor" src="img/radar-icon.png" style="width: 100%; height: 80px; padding:15px;border-radius: 10px;"/>
                        </div>
                        <div id="" style="width: 100px; height: 150px; margin-right: 5px">
                            <p style="text-align:center;font-weight:normal;margin:7px">INFRA</p>
                            <img id="rmm_infra" src="img/server-icon.png" style="width: 100%; height: 80px; padding:15px;border-radius: 10px;"/>
                        </div>
                        <div id="" style="width: 100px; height: 150px; margin-right: 5px">
                            <p style="text-align:center;font-weight:normal;margin:7px">SW I</p>
                            <img id="rmm_sw1" src="img/router-new.png" style="width: 100%; height: 80px; padding:15px;border-radius: 10px;"/>
                        </div>
                        <div id="" style="width: 100px; height: 150px;">
                            <p style="text-align:center;font-weight:normal;margin:7px">SW II</p>
                            <img id="rmm_sw2" src="img/router-new.png" style="width: 100%; height: 80px; padding:15px;border-radius: 10px;"/>
                        </div>
                    </div>
                </div>
                <div class="card" style="background-color:#f7f5fa; width: 300px;height:250px;margin: 10px; text-align: center">
                    <div class="card-header header-elements-inline"
                         style="background-color:#4d7485;color:#FFF">
                        <h5 class="card-title">Monitoring<br><span id="ava_dev_name"></span></h5>
                    </div>
                    <div class="card-body" id="mon_rad_con">
                        <div id="title_mon_rad_con" style="margin-bottom: 20px">
                        </div>
                        <div id="content_mon_rad_con">
                            <table style="width: -webkit-fill-available;">
                                <tr style="">
                                    <td>NORMAL</td>
                                    <td id="nor_val"></td>
                                </tr>
                                <tr>
                                    <td>NON CRITICAL</td>
                                    <td id="noncri_val"></td>
                                </tr>
                                <tr>
                                    <td>CRITICAL</td>
                                    <td id="cri_val"></td>
                                </tr>
                                <tr>
                                    <td>NO INFORMATION</td>
                                    <td id="noinf_val"></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="card" style="background-color:#f7f5fa; width: 450px;height:250px;margin: 10px; text-align: center">
                    <div class="card-header header-elements-inline"
                         style="background-color:#4d7485;color:#FFF">
                        <h5 class="card-title">Statistik Kondisi Per Wilayah</h5>
                    </div>
                    <div class="card-body" style="display: inline-flex; margin: 3px" id="perwilayah">

                    </div>
                </div>
            </div>

            <div class="row-cols-md-auto" style="display: inline-flex;">
                <div class="card" style="background-color:#f7f5fa; width: 450px;height:250px;margin: 10px;">
                    <div class="card-header header-elements-inline"
                         style="background-color:#4d7485;color:#FFF">
                        <h5 class="card-title">Jumlah Frekuensi Kegagalan Operasional</h5>
                    </div>
                    <div class="card-body" id="avail_gagal_kiri">
                    </div>
                </div>
                <div class="card" style="background-color:#f7f5fa; width: 300px;height:250px;margin: 10px;visibility: hidden">
                </div>
                <div class="card" style="background-color:#f7f5fa; width: 450px;height:250px;margin: 10px;">
                    <div class="card-header header-elements-inline"
                         style="background-color:#4d7485;color:#FFF">
                        <h5 class="card-title">Jumlah Waktu Kegagalan Operasional (Jam)</h5>
                    </div>
                    <div class="card-body" id="avail_gagal_kanan">
                    </div>
                </div>
            </div>
        </div>
        <!--content end-->
<!--<canvas>qqqqqqqqq</canvas>-->

        <!--footer start-->
        <footer class="bg-light text-center text-lg-start">
            <!-- Copyright -->
            <div class="text-center p-3" style="background-color: #28a8e0 !important; font-size: 14px; color: white">
                © 2020 DIREKTORAT NAVIGASI PENERBANGAN | Version 1.0.0
            </div>
            <!-- Copyright -->
        </footer>
        <!--footer end-->



        <script>
            //navigasi        
            window.onscroll = function () {
                myFunction();
            };
            var navbar = document.getElementById("navbar");
            var sticky = navbar.offsetTop;
            function myFunction() {

                if (window.pageYOffset >= sticky) {
                    navbar.classList.add("sticky");
                } else {
                    navbar.classList.remove("sticky");
                }
            }

            //timer
            $(document).ready(function () {
                
//                            var canvas = document.querySelector('canvas');
//                            canvas.setAttribute("id", "myCanvas");



                function Timer() {
                    var date = new Date();
                    var weekday = new Array(7);
                    weekday[0] = "Sunday";
                    weekday[1] = "Monday";
                    weekday[2] = "Tuesday";
                    weekday[3] = "Wednesday";
                    weekday[4] = "Thursday";
                    weekday[5] = "Friday";
                    weekday[6] = "Saturday";
                    var n = weekday[date.getDay()];
                    var day = date.getDate();
                    var month;
                    switch (new Date().getMonth()) {
                        case 0:
                            month = "January";
                            break;
                        case 1:
                            month = "Februari";
                            break;
                        case 2:
                            month = "March";
                            break;
                        case 3:
                            month = "April";
                            break;
                        case 4:
                            month = "May";
                            break;
                        case 5:
                            month = "June";
                            break;
                        case  6:
                            month = "July";
                            break;
                        case  7:
                            month = "August";
                            break;
                        case  8:
                            month = "September";
                            break;
                        case  9:
                            month = "October";
                            break;
                        case  10:
                            month = "November";
                            break;
                        case  11:
                            month = "December";
                    }
                    var year = date.getFullYear();
                    var hours = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
                    var minutes = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
                    var seconds = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
                    time = n + ", " + day + " " + month + " " + year + " " + hours + ":" + minutes + ":" + seconds;
                    var lblTime = document.getElementById("time");
                    lblTime.innerHTML = time;
                }
                setInterval(Timer, 1000);
            });
            new Vue().$mount('#app');








            $(document).ready(function () {
                run();
            });

            function changebro() {
                var myobj1 = document.getElementById("chart1");
                myobj1.remove();
                var myobj2 = document.getElementById("chart2");
                myobj2.remove();
                var myobj3 = document.getElementById("chart3");
                myobj3.remove();
                var myobj4 = document.getElementById("chart4");
                myobj4.remove();

                const intrv = document.getElementById('opsi').value;
                var daterange = document.getElementById("daterange");
                switch (intrv) {
                    case '1':
                        daterange.style.display = 'none';
                        run();
                        break;
                    case '2':
                        daterange.style.display = 'none';
                        run();
                        break;
                    case '3':
                        daterange.style.display = 'none';
                        run();
                        break;
                    case '4':
                        daterange.style.display = 'none';
                        run();
                        break;
                    case '5':
                        daterange.style.display = 'block';
                        var dt = document.createElement("input");
                        dt.setAttribute("name", "daterange");
                        dt.setAttribute("class", "form-control");
                        daterange.appendChild(dt);
                        $('input[name="daterange"]').daterangepicker({
                            opens: 'left'
                        }, function (start, end, label) {
                            console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
                            run(start.format('YYYY-MM-DD'), end.format('YYYY-MM-DD'));
                        });
                        break;
                    default:
                }
            }


            function run(startdate, enddate) {
                var ava_dev_id = window.localStorage.getItem('ava_dev_id');
                var ava_dev_name = window.localStorage.getItem('ava_dev_name');
                var ava_dev_kota = window.localStorage.getItem('ava_dev_kota');
                var ava_dev_prov = window.localStorage.getItem('ava_dev_prov');
                document.getElementById('ava_dev_id').innerHTML = ava_dev_id;
                document.getElementById('ava_dev_kota').innerHTML = ava_dev_kota;
                document.getElementById('ava_dev_prov').innerHTML = ava_dev_prov;
                document.getElementById('ava_dev_name').innerHTML = ava_dev_name;

                var datjson4 = new Object();
                var interval = document.getElementById('opsi').value;
                if (interval == 5) {
                    datjson4.start_date = startdate;
                    datjson4.end_date = enddate;
                }
                datjson4.procCode = 'CNSDNP0004';
                datjson4.device_id = ava_dev_id;
                datjson4.device_kota = ava_dev_kota;
                datjson4.device_prov = ava_dev_prov;
                datjson4.interval = interval;
                $.ajax({
                    contentType: 'application/json',
                    dataType: "json",
                    url: "http://10.30.215.21:8080/DNPCNSServer/ProcessRequest",
                    data: JSON.stringify(datjson4),
                    type: 'post',
                    success: function (response) {
                        console.log('ini response nya : ' + JSON.stringify(response.list));
                        if (response.resp_code == 0000) {
                            var ch1 = document.getElementById("radar");
                            var ch11 = document.createElement("div");
                            ch11.setAttribute("id", "chart1");
                            ch11.setAttribute("class", "demo-5");
                            ch11.setAttribute("data-percent", response.list[0].availibility);
                            ch1.appendChild(ch11);


                            var ch2 = document.getElementById("sdcs");
                            var ch22 = document.createElement("div");
                            ch22.setAttribute("id", "chart2");
                            ch22.setAttribute("class", "demo-5");
                            ch22.setAttribute("data-percent", response.list[1].availibility);
                            ch2.appendChild(ch22);


                            var ch3 = document.getElementById("lan1");
                            var ch33 = document.createElement("div");
                            ch33.setAttribute("id", "chart3");
                            ch33.setAttribute("class", "demo-5");
                            ch33.setAttribute("data-percent", response.list[2].availibility);
                            ch3.appendChild(ch33);


                            var ch4 = document.getElementById("lan2");
                            var ch44 = document.createElement("div");
                            ch44.setAttribute("id", "chart4");
                            ch44.setAttribute("class", "demo-5");
                            ch44.setAttribute("data-percent", response.list[3].availibility);
                            ch4.appendChild(ch44);


                            $('.demo-5').percentcircle({
                                animate: true,
                                diameter: 100,
                                guage: 3,
                                coverBg: '#fff',
                                bgColor: '#efefef',
                                fillColor: '#8BC163',
                                percentSize: '18px',
                                percentWeight: '20px'
                            });
                            document.getElementById('mttr').innerHTML = response.list[0].mttr + ' jam';
                            document.getElementById('mtbf').innerHTML = response.list[0].mtbf + ' jam';
                            document.getElementById('reliability').innerHTML = response.list[0].reliability + ' %';



                            var chartDom = document.getElementById('avaibility_radar');
                            var myChart = echarts.init(chartDom);
                            var option;

                            option = {
                                tooltip: {
                                    formatter: '{a} <br/>{b} : {c}%'
                                },
                                series: [
                                    {
                                        name: 'Availability',
                                        type: 'gauge',
                                        radius: '100%',
                                        axisLine: {
                                            lineStyle: {
                                                width: 5
                                            }
                                        },
                                        progress: {
                                            top: 100,
                                            show: true,
                                            overlap: true,
                                            width: 5,
                                            roundCap: false,
                                            clip: true
                                        },
                                        detail: {
                                            valueAnimation: true,
                                            formatter: '{value}%',
                                            show: true,
                                            backgroundColor: 'rgba(0, 0, 0, 0)',
                                            borderColor: '#ccc',
                                            color: '#5470c6',
                                            fontSize: 20,
                                            fontWeight: 'bold',
                                            lineHeight: 5,
                                            offsetCenter: [0, 90]
                                        },

                                        data: [
                                            {
                                                value: response.list[0].availibility
                                            }
                                        ],
                                        axisTick: {
                                            show: false,
                                            length: 4
                                        },
                                        splitLine: {
                                            length: 6,
                                            lineStyle: {
                                                width: 2,
                                                color: '#999'
                                            }
                                        },
                                        axisLabel: {
                                            distance: 5,
                                            color: '#999',
                                            fontSize: 14
                                        },
                                        anchor: {
                                            show: true,
                                            showAbove: true,
                                            size: 10,
                                            itemStyle: {
                                                borderWidth: 5
                                            }
                                        }
                                    }
                                ]
                            };
//                            var canvas = document.querySelector('canvas');
//                            canvas.style.width = '200px';
//                            canvas.setAttribute("id", "myCanvas");
                            option && myChart.setOption(option);




                            var warna_sensor = response.list[0].status;
                            var warna_infra = response.list[1].status;
                            var warna_sw1 = response.list[2].status;
                            var warna_sw2 = response.list[3].status;

                            var new_warna_sensor;
                            var new_warna_infra;
                            var new_warna_sw1;
                            var new_warna_sw2;


                            switch (warna_sensor) {
                                case '1':
                                    new_warna_sensor = 'rgb(0, 255, 0)';//hijau
                                    break;
                                case '2':
                                    new_warna_sensor = 'rgb(255, 204, 0)';//kuning
                                    break;
                                case '3':
                                    new_warna_sensor = 'rgb(255, 0, 0)'; //merah
                                    break;
                                case '4':
                                    new_warna_sensor = 'rgb(179, 179, 181)'; //abu abu
                                    break;
                                case '5':
                                    new_warna_sensor = 'rgb(14, 40, 237)'; //blue
                                    break;
                                default:
                            }
                            document.getElementById("rmm_sensor").style.border = "5px solid " + new_warna_sensor;

                            switch (warna_infra) {
                                case '1':
                                    new_warna_infra = 'rgb(0, 255, 0)';
                                    break;
                                case '2':
                                    new_warna_infra = 'rgb(255, 204, 0)';
                                    break;
                                case '3':
                                    new_warna_infra = 'rgb(255, 0, 0)';
                                    break;
                                case '4':
                                    new_warna_infra = 'rgb(179, 179, 181)';
                                    break;
                                case '5':
                                    new_warna_infra = 'rgb(14, 40, 237)';
                                    break;
                                default:
                            }
                            document.getElementById("rmm_infra").style.border = "5px solid " + new_warna_infra;


                            switch (warna_sw1) {
                                case '1':
                                    new_warna_sw1 = 'rgb(0, 255, 0)';
                                    break;
                                case '2':
                                    new_warna_sw1 = 'rgb(255, 204, 0)';
                                    break;
                                case '3':
                                    new_warna_sw1 = 'rgb(255, 0, 0)';
                                    break;
                                case '4':
                                    new_warna_sw1 = 'rgb(179, 179, 181)';
                                    break;
                                case '5':
                                    new_warna_sw1 = 'rgb(14, 40, 237)';
                                    break;
                                default:
                            }
                            document.getElementById("rmm_sw1").style.border = "5px solid " + new_warna_sw1;


                            switch (warna_sw2) {
                                case '1':
                                    new_warna_sw2 = 'rgb(0, 255, 0)';
                                    break;
                                case '2':
                                    new_warna_sw2 = 'rgb(255, 204, 0)';
                                    break;
                                case '3':
                                    new_warna_sw2 = 'rgb(255, 0, 0)';
                                    break;
                                case '4':
                                    new_warna_sw2 = 'rgb(179, 179, 181)';
                                    break;
                                case '5':
                                    new_warna_sw2 = 'rgb(14, 40, 237)';
                                    break;
                                default:
                            }
                            document.getElementById("rmm_sw2").style.border = "5px solid " + new_warna_sw2;






                            var chartDom2 = document.getElementById('avail_gagal_kiri');
                            var myChart2 = echarts.init(chartDom2);
                            var option2;

                            option2 = {
                                tooltip: {
                                    trigger: 'axis',
                                    axisPointer: {
                                        type: 'shadow'
                                    }
                                },
                                grid: {
                                    top: '5%',
                                    left: '0%',
                                    right: '0%',
                                    bottom: '0%',
                                    containLabel: true
                                },
                                xAxis: [
                                    {
                                        type: 'category',
                                        data: ['SENSOR', 'INFRA', 'SW I', 'SW II'],
                                        axisTick: {
                                            alignWithLabel: true
                                        }
                                    }
                                ],
                                yAxis: [
                                    {
                                        type: 'value'
                                    }
                                ],
                                series: [
                                    {
                                        name: 'Jumlah Kegagalan',
                                        type: 'bar',
                                        barWidth: '50%',
                                        data: [response.list[0].frequency, response.list[1].frequency, response.list[2].frequency, response.list[3].frequency],
                                        color: ['#3398db']
                                    }
                                ]
                            };
                            option2 && myChart2.setOption(option2);





                            var chartDom1 = document.getElementById('avail_gagal_kanan');
                            var myChart1 = echarts.init(chartDom1);
                            var option1;

                            option1 = {
                                tooltip: {
                                    trigger: 'axis',
                                    axisPointer: {
                                        type: 'shadow'
                                    }
                                },
                                grid: {
                                    top: '5%',
                                    left: '0%',
                                    right: '0%',
                                    bottom: '0%',
                                    containLabel: true
                                },
                                xAxis: [
                                    {
                                        type: 'category',
                                        data: ['SENSOR', 'INFRA', 'SW I', 'SW II'],
                                        axisTick: {
                                            alignWithLabel: true
                                        }
                                    }
                                ],
                                yAxis: [
                                    {
                                        type: 'value'
                                    }
                                ],
                                series: [
                                    {
                                        name: 'Jumlah Down Time',
                                        type: 'bar',
                                        barWidth: '50%',
                                        data: [response.list[0].total_down_time, response.list[1].total_down_time, response.list[2].total_down_time, response.list[3].total_down_time],
                                        color: ['#3398db']
                                    }
                                ]
                            };
                            option1 && myChart1.setOption(option1);


                            document.getElementById("nor_val").innerHTML = response.list[0].total_normal_time + ' jam';
                            document.getElementById("noncri_val").innerHTML = response.list[0].total_intermittent_time + ' jam';
                            document.getElementById("cri_val").innerHTML = response.list[0].total_down_time + ' jam';
                            document.getElementById("noinf_val").innerHTML = response.list[0].total_noinformation_time + ' jam';




                            //statistik kondisi perwilayah
                            var datjson5 = new Object();
                            datjson5.interval = interval;
                            datjson5.procCode = 'CNSDNP0010';
                            $.ajax({
                                contentType: 'application/json',
                                dataType: "json",
                                url: "http://10.30.215.21:8080/DNPCNSServer/ProcessRequest",
                                data: JSON.stringify(datjson5),
                                type: 'post',
                                success: function (response) {
                                    console.log('ini response nya : ' + JSON.stringify(response.list));
                                    if (response.resp_code == 0000) {
                                        var perwilayah = echarts.init(document.getElementById('perwilayah'));
                                        option = {
                                            tooltip: {
                                                trigger: 'item',
                                                formatter: "{a} <br> {b} : {c} ({d}%)"
                                            },
                                            series: [
                                                {
                                                    name: 'Statistik Kondisi Per Wilayah',
                                                    type: 'pie',
                                                    radius: '90%',
                                                    data: [
                                                        {value: response.list[0].total_down_time, name: 'Barat'},
                                                        {value: response.list[1].total_down_time, name: 'Timur'}
                                                    ],
                                                    color: ['yellow', 'blue'],
                                                    emphasis: {
                                                        itemStyle: {
                                                            shadowBlur: 10,
                                                            shadowOffsetX: 0,
                                                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                                                        }
                                                    }
                                                }
                                            ]
                                        };
                                        // Display the chart using the configuration items and data just specified.
                                        perwilayah.setOption(option);
                                    } else {
                                        alert('gagal fetch data from statistik kondisi perwilayah');
                                    }
                                }
                            });
                        } else {
                            alert('gagal : ' + response.resp_code);
                        }
                    }
                });
            }
        </script>
    </body>
</html>
