<%-- 
    Document   : dashboard
    Created on : 09-Oct-2021, 15:35:17
    Author     : matajari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='defaultextend.jsp'%>
<!--<meta http-equiv='refresh' content='120'>-->
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width">
        <title>DASHBOARD MONITORING CNS</title>
        <link rel="stylesheet" href="css/navbar.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/4.3.0/echarts.min.js"></script>

        <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
        <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>

        <style>
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
            td {
                border:2px solid white;
                /*cursor: pointer;*/
            }

            th {
                /*border:2px solid white;*/
                cursor: pointer;
            }

            /*            button.gm-ui-hover-effect {
                            visibility: hidden;
                            color: blue;
                            background-color: red
                        }*/
            /*            .gm-ui-hover-effect {
                display: none !important;
            }*/
            #mantap {
                cursor: pointer;
            }
        </style>
    </head>
    <body>
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
        <nav id="navbar" class="navbar navbar-expand-md navbar-light" style="background-color: #0487b5; z-index: 999">
            <div class="container-fluid">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav me-auto mb-2 mb-md-0" style="font-size: 13px">
                        <li class="nav-item" style="margin-left: 10px;">
                            <a class="nav-link" href="dashboard.jsp"><i class="fa fa-home" style="margin-right: 10px;"></i>Dashboard</a>
                        </li>
                        <select id="merek_radar" onchange="run()">
                            <option value="1">Radar</option><!-- indra -->
                            <option value="2">Telecomunication</option><!-- all radar -->
                        </select>
                        <!--                        <li class="nav-item" style="margin-left: 10px;">
                                                    <a class="nav-link" href="#"><i class="fa fa-area-chart" style="margin-right: 10px;"></i>Statistic</a>
                                                </li>-->
                        <!--                        <li class="nav-item" style="margin-left: 10px;">
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
        <div id="qwerty" class="content" style="z-index: -1; background-color: white; width: -webkit-fill-available; height: auto; margin: 25px; border-radius: 8px; padding: 30px">
            <div id="googleMap" style="width:-webkit-fill-available;height:85%;"></div>
            <div id="bottomMap" class="d-flex justify-content-center" style="width:-webkit-fill-available;height:60px;">
                <div style="height: 25px; width: 25px; border-radius: 70px; float: left; font-size: 20px; background: rgb(0, 255, 0);margin: auto; margin-right: 5px"></div><div style="float: left;margin: auto; margin-left: 0">NORMAL</div>
                <div style="height: 25px; width: 25px; border-radius: 70px; float: left; font-size: 20px; background: rgb(255, 204, 0);margin: auto; margin-right: 5px"></div><div style="float: left;margin: auto; margin-left: 0">NON CRITICAL</div>
                <div style="height: 25px; width: 25px; border-radius: 70px; float: left; font-size: 20px; background: rgb(255, 0, 0);margin: auto; margin-right: 5px"></div><div style="float: left;margin: auto; margin-left: 0">CRITICAL</div>
                <!--<div style="height: 25px; width: 25px; border-radius: 70px; float: left; font-size: 20px; background: rgb(14, 40, 237);margin: auto; margin-right: 5px"></div><div style="float: left;margin: auto; margin-left: 0">INHIBITED</div>-->
                <div style="height: 25px; width: 25px; border-radius: 70px; float: left; font-size: 20px; background: rgb(179, 179, 181);margin: auto; margin-right: 5px"></div><div style="float: left;margin: auto; margin-left: 0">NO INFORMATION</div>
                <!--<div style="height: 25px; width: 25px; border-radius: 70px; float: left; font-size: 20px; background: rgb(0, 0, 0);margin: auto; margin-right: 5px"></div><div style="float: left;margin: auto; margin-left: 0">DOWN</div>-->
            </div>
            <div style="display: inline-flex; width: -webkit-fill-available">

                <div class="card" style="background-color:#f7f5fa; width: 50%;height:400px;margin-right: 10px;">
                    <div class="card-header header-elements-inline"
                         style="padding:1em !important;background-color:#4d7485;color:#FFF">
                        <h5 class="card-title">National Percentage of Status</h5>
                        <div class="header-elements">
                            <div class="list-icons">
                            </div>
                        </div>
                    </div>
                    <div class="card-body" id="chartkiri">
                    </div>
                </div>

                <div class="card" style="background-color:#f7f5fa; width: 50%;height:400px;margin-left: 10px;">
                    <div class="card-header header-elements-inline"
                         style="padding:1em !important;background-color:#4d7485;color:#FFF">
                        <h5 class="card-title">National Percentage of Critical Status (Period: Week)</h5>
                        <div class="header-elements">
                            <div class="list-icons">
                            </div>
                        </div>
                    </div>
                    <div class="card-body" id="chartkanan">
                    </div>
                </div>
            </div>
        </div>
        <!--content end-->


        <!--footer start-->
        <footer class="bg-light text-center text-lg-start" id="footer">
            <!-- Copyright -->
            <div class="text-center p-3" style="background-color: #28a8e0 !important; font-size: 14px; color: white">
                © 2020 DIREKTORAT NAVIGASI PENERBANGAN | Version 1.0.0
            </div>
            <!-- Copyright -->
        </footer>
        <!--footer end-->

        <div id="ctn">
        </div>

        <script>   
    
    
    function run() {
                initMap();
                chartKanan();
            }
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
                chartKanan();
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
            var infowindow;
            var content_main;
            var content_detail;
            var info2;
            var ssid, ssn, sts;
            ssid = '?';
            ssn = '?';
            sts = '?';
            var nilai;
            var map;
//            var marker;
            // fungsi initialize untuk mempersiapkan peta
            function initMap() {
                console.log('h');
                
                // membuat objek untuk titik koordinat
                var indonesia = {lat: -1.035721, lng: 118.436931};
                // membuat objek peta
                map = new google.maps.Map(document.getElementById("googleMap"), {
                    zoom: 5,
                    center: indonesia,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                });
                infowindow = new google.maps.InfoWindow();
//              Create the markers.
                createMarker(map);
                google.maps.event.addListener(map, "click", function (event) {
                    $('#example').dataTable().fnClearTable();
                    $('#example').dataTable().fnDestroy();
                    $('#example').remove();
                    infowindow.close();
                });
                google.maps.event.addListener(infowindow, 'closeclick', function () {
                    $('#example').dataTable().fnClearTable();
                    $('#example').dataTable().fnDestroy();
                    $('#example').remove();
                });

            }
            setInterval(initMap, 10000);



            function createMarker(map) {
                var datjson1 = new Object();
                var merek_radar = document.getElementById('merek_radar').value;
                if (merek_radar == '1') {
                    datjson1.procCode = 'CNSDNP0001B';
                } else {
                    datjson1.procCode = 'CNSDNP0001';
                }
                $.ajax({
                    contentType: 'application/json',
                    dataType: "json",
                    url: "http://10.30.215.21:8080/DNPCNSServer/ProcessRequest",
                    data: JSON.stringify(datjson1),
                    type: 'post',
                    success: function (response) {
                        if (response.resp_code == 0000) {
                            var isipath;

                            $.each(response.list, function (key, data) {
                                var merek_radar2 = document.getElementById('merek_radar').value;
                                if (merek_radar2 == '1') {
                                    isipath = "M-20,0a20,20 0 1,0 40,0a20,20 0 1,0 -40,0";
                                } else {
                                    isipath = "M35 0 L0 35 L70 35 Z";
                                }
                                var icon = {
                                    path: isipath,
                                    fillColor: data.status,
                                    fillOpacity: 1,
                                    anchor: new google.maps.Point(0, 0),
                                    strokeWeight: 0.3,
                                    scale: 0.5
                                };
                                var marker = new google.maps.Marker({
                                    position: new google.maps.LatLng(data.latitude, data.longitude),
                                    map: map,
                                    icon: icon
//                                    icon: "img/radar-icon.png"
                                });
                                marker.set("id", data.device_id);
                                marker.addListener("click", () => {
                                    $('#example').dataTable().fnClearTable();
                                    $('#example').dataTable().fnDestroy();
                                    $('#example').remove();
                                    markCall(data.device_id, marker, map);
                                });
                            });
                            //chartkiri
                            var chartkiri = echarts.init(document.getElementById('chartkiri'));
                            option = {
                                tooltip: {
                                    trigger: 'item',
                                    formatter: "{a} <br> {b} : {c} ({d}%)"
                                },
                                series: [
                                    {
                                        name: 'National Percentage of Status',
                                        type: 'pie',
                                        data: [
                                            {value: response.status_percentage.normal, name: 'Normal'},
                                            {value: response.status_percentage.noncritical, name: 'Non Critical'},
                                            {value: response.status_percentage.critical, name: 'Critical'},
                                            {value: response.status_percentage.inhibited, name: 'Inhibited'},
                                            {value: response.status_percentage.noinformation, name: 'No Information'}
                                        ],
                                        color: ['#0f0', '#fc0', '#f00', '#0e28ed', '#b3b3b5'],
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
                            chartkiri.setOption(option);
                        } else {
                            alert('gagal : ' + response.resp_code);
                        }
                    }
                });
            }

            function markCall(data, mark, map) {
                var merek_radar3 = document.getElementById('merek_radar').value;
                if (merek_radar3 == '1') {
                    var datjson2 = new Object();
                    datjson2.procCode = 'CNSDNP0002';
                    datjson2.device_id = data;
                    $.ajax({
                        contentType: 'application/json',
                        dataType: "json",
                        url: "http://10.30.215.21:8080/DNPCNSServer/ProcessRequest",
                        data: JSON.stringify(datjson2),
                        type: 'post',
                        success: function (detail) {
                            if (detail.resp_code == 0000) {
                                var global_data = detail.list[0];
                                var sensor_data = detail.list[1];
                                var infrastructure_data = detail.list[2];
                                var mssr_data = detail.list[3];
                                var psr_data = detail.list[4];
                                var pedestal_data = detail.list[5];
                                var rdc_data = detail.list[6];
                                var clocks_data = detail.list[7];
                                var network_data = detail.list[8];
                                var sdcs_data = detail.list[9];
                                var aei_data = detail.list[10];
                                var cms_data = detail.list[11];
                                var ntp1_data = detail.list[12];
                                var ntp2_data = detail.list[13];
                                var tx_data = detail.list[14];
                                var switch1_data = detail.list[15];
                                var switch2_data = detail.list[16];
                                var lan1_data = detail.list[17];
                                var lan2_data = detail.list[18];
                                var global_data_c, sensor_data_c, infrastructure_data_c, mssr_data_c, pedestal_data_c, clocks_data_c, network_data_c, sdcs_data_c, aei_data_c,
                                        cms_data_c, ntp1_data_c, ntp2_data_c, tx_data_c, switch1_data_c, switch2_data_c, lan1_data_c, lan2_data_c;
                                if (global_data.status === '#FF0000') {
                                    global_data_c = 'white';
                                }
                                if (sensor_data.status === '#FF0000') {
                                    sensor_data_c = 'white';
                                }
                                if (infrastructure_data.status === '#FF0000') {
                                    infrastructure_data_c = 'white';
                                }
                                if (mssr_data.status === '#FF0000') {
                                    mssr_data_c = 'white';
                                }
                                if (pedestal_data.status === '#FF0000') {
                                    pedestal_data_c = 'white';
                                }
                                if (clocks_data.status === '#FF0000') {
                                    clocks_data_c = 'white';
                                }
                                if (network_data.status === '#FF0000') {
                                    network_data_c = 'white';
                                }
                                if (sdcs_data.status === '#FF0000') {
                                    sdcs_data_c = 'white';
                                }
                                if (aei_data.status === '#FF0000') {
                                    aei_data_c = 'white';
                                }
                                if (cms_data.status === '#FF0000') {
                                    cms_data_c = 'white';
                                }
                                if (ntp1_data.status === '#FF0000') {
                                    ntp1_data_c = 'white';
                                }
                                if (ntp2_data.status === '#FF0000') {
                                    ntp2_data_c = 'white';
                                }
                                if (tx_data.status === '#FF0000') {
                                    tx_data_c = 'white';
                                }
                                if (switch1_data.status === '#FF0000') {
                                    switch1_data_c = 'white';
                                }
                                if (switch2_data.status === '#FF0000') {
                                    switch2_data_c = 'white';
                                }
                                if (lan1_data.status === '#FF0000') {
                                    lan1_data_c = 'white';
                                }
                                if (lan2_data.status === '#FF0000') {
                                    lan2_data_c = 'white';
                                }





                                // mebuat konten untuk info window


                                var vis;
                                if (detail.flag_rlu == 1) {
                                    vis = 'visible';
                                } else {
                                    vis = 'hidden';
                                }


                                content_main = `<div class="container-md" style="; height: auto; width: 500px; text-align-last: center;">
            <div class="row row-cols-1 row-cols-lg-1">
                <table style="font-size: 12px">
                    <tr>
                        <th onclick="detail_global('` + global_data.module_id + `','` + global_data.module_desc + `','` + global_data.time + `')" colspan="15" style="background-color: ` + global_data.status + `; color: ` + global_data_c + `; border:2px solid white">` + detail.device_name.replace("RADAR", "") + `</th>
                    </tr>
                    <tr>
                        <td onclick="detail_sensors('` + sensor_data.module_id + `','` + sensor_data.module_desc + `','` + sensor_data.time + `')" colspan="2" style="background-color: ` + sensor_data.status + `; color: ` + sensor_data_c + `; border:2px solid white; cursor:pointer;">Sensors</td>
                        <td onclick="detail_infra('` + infrastructure_data.module_id + `','` + infrastructure_data.module_desc + `','` + infrastructure_data.time + `')" colspan="10" style="background-color: ` + infrastructure_data.status + `; color: ` + infrastructure_data_c + `; border:2px solid white; cursor: pointer;">Infrastructure</td>
                        <td onclick="detail_tx('` + tx_data.module_id + `','` + tx_data.module_desc + `','` + tx_data.time + `')" style="background-color: ` + tx_data.status + `; color: ` + tx_data_c + `; border:2px solid white; cursor: pointer;">TX</td>
                        <td onclick="detail_switch1('` + switch1_data.module_id + `','` + switch1_data.module_desc + `','` + switch1_data.time + `')" style="background-color: ` + switch1_data.status + `; color: ` + switch1_data_c + `; border:2px solid white; cursor: pointer;">SW1</td>
                        <td onclick="detail_switch2('` + switch2_data.module_id + `','` + switch2_data.module_desc + `','` + switch2_data.time + `')" style="background-color: ` + switch2_data.status + `; color: ` + switch2_data_c + `; border:2px solid white; cursor: pointer;">SW2</td>
                    </tr>
                    <tr>
                        <td onclick="detail_mssr('` + mssr_data.module_id + `','` + mssr_data.module_desc + `','` + mssr_data.time + `')" style="background-color: ` + mssr_data.status + `; color: ` + mssr_data_c + `; border:2px solid white;cursor: pointer;">MSSR-S</td>
                        <td onclick="detail_pedestal('` + pedestal_data.module_id + `','` + pedestal_data.module_desc + `','` + pedestal_data.time + `')" style="background-color: ` + pedestal_data.status + `; color: ` + pedestal_data_c + `; border:2px solid white;cursor: pointer;">PEDESTAL</td>
                        <td onclick="detail_clock('` + clocks_data.module_id + `','` + clocks_data.module_desc + `','` + clocks_data.time + `')" colspan="2" style="background-color: ` + clocks_data.status + `; color: ` + clocks_data_c + `; border:2px solid white;cursor: pointer;">Clocks</td>
                        <td onclick="detail_network('` + network_data.module_id + `','` + network_data.module_desc + `','` + network_data.time + `')" colspan="5" style="background-color: ` + network_data.status + `; color: ` + network_data_c + `; border:2px solid white;cursor: pointer;">NETWORK</td>
                        <td onclick="detail_sdcs('` + sdcs_data.module_id + `','` + sdcs_data.module_desc + `','` + sdcs_data.time + `')" style="background-color: ` + sdcs_data.status + `; color: ` + sdcs_data_c + `; border:2px solid white;cursor: pointer;">SDCS</td>
                        <td onclick="detail_aei('` + aei_data.module_id + `','` + aei_data.module_desc + `','` + aei_data.time + `')" style="background-color: ` + aei_data.status + `; color: ` + aei_data_c + `; border:2px solid white;cursor: pointer;">AEI</td>
                        <td onclick="detail_cms('` + cms_data.module_id + `','` + cms_data.module_desc + `','` + cms_data.time + `')" style="background-color: ` + cms_data.status + `; color: ` + cms_data_c + `; border:2px solid white;cursor: pointer;">CMS</td>
                    </tr>
                    <tr>
                        <td onclick="detail_rlu('` + detail.device_id + `')" style="background-color: ` + mssr_data.status + `; color: ` + mssr_data_c + `; border:2px solid white; cursor: pointer; visibility: ` + vis + `" id="rlu">LRU'S</td>
                        <td></td>
                        <td onclick="detail_ntp1('` + ntp1_data.module_id + `','` + ntp1_data.module_desc + `','` + ntp1_data.time + `')" style="background-color: ` + ntp1_data.status + `; color: ` + ntp1_data_c + `; border:2px solid white;cursor: pointer;">NTP1</td>
                        <td onclick="detail_ntp2('` + ntp2_data.module_id + `','` + ntp2_data.module_desc + `','` + ntp2_data.time + `')" style="background-color: ` + ntp2_data.status + `; color: ` + ntp2_data_c + `; border:2px solid white;cursor: pointer;">NTP2</td>
                        <td onclick="detail_lan1('` + lan1_data.module_id + `','` + lan1_data.module_desc + `','` + lan1_data.time + `')" style="background-color: ` + lan1_data.status + `; color: ` + lan1_data_c + `; border:2px solid white;cursor: pointer;">L1</td>
                        <td onclick="detail_lan2('` + lan2_data.module_id + `','` + lan2_data.module_desc + `','` + lan2_data.time + `')" style="background-color: ` + lan2_data.status + `; color: ` + lan2_data_c + `; border:2px solid white;cursor: pointer;">L2</td>
                        <td colspan="3"></td>
                    </tr>
                    <tr style="height: 40px; color:#66b1ff">
                        <td colspan="3"></td>
                        <td colspan="4" id="mantap" onclick="avaibilityFunc('` + detail.device_id + `','` + detail.city + `','` + detail.province + `','` + detail.device_name + `')"><i class="fa fa-bar-chart" style="margin-right: 5px"></i>Avaibility</td>
                        <td colspan="5"></td>
                    </tr>
                    <tr style="height: 40px;text-align-last: left;border-top:1px solid #eff1f5">
                        <td colspan="3" style="padding-left: 20px;">Device ID</td>
                        <td colspan="4">` + detail.device_id + `</td>
                        <td colspan="5" style="text-align-last: center;"><i class="fa fa-stop" style="color: ` + global_data.status + `"></i></td>
                    </tr>
                    <tr style="height: 40px;text-align-last: left;border-top:1px solid #eff1f5">
                        <td colspan="3" style="padding-left: 20px">Device Name</td>
                        <td colspan="4">` + detail.device_name + `</td>
                    </tr>
                    <tr style="height: 40px;text-align-last: left;border-top:1px solid #eff1f5">
                        <td colspan="3" style="padding-left: 20px">Device Category</td>
                        <td colspan="4">` + detail.device_category + `</td>
                    </tr>
                    <tr style="height: 40px;text-align-last: left;border-top:1px solid #eff1f5">
                        <td colspan="3" style="padding-left: 20px">Device Group</td>
                        <td colspan="4">` + detail.device_group + `</td>
                    </tr>
                    <tr style="height: 40px;text-align-last: left;border-top:1px solid #eff1f5">
                        <td colspan="3" style="padding-left: 20px">System</td>
                        <td colspan="4">` + detail.system + `</td>
                    </tr>
                    <tr style="height: 40px;text-align-last: left;border-top:1px solid #eff1f5">
                        <td colspan="3" style="padding-left: 20px">Location</td>
                        <td colspan="4">` + detail.location_name + `</td>
                    </tr>
                </table>
            </div>
        </div>`;
                                if (global_data.status_module == 1) {
                                    nilai = 'NORMAL';
                                } else if (global_data.status_module == 2) {
                                    nilai = 'NON CRITICAL';
                                } else if (global_data.status_module == 3) {
                                    nilai = 'CRITICAL';
                                } else if (global_data.status_module == 4) {
                                    nilai = 'INHIBITED';
                                } else if (global_data.status_module == 5) {
                                    nilai = 'NO INFORMATION';
                                }
                                ;
                                infowindow.setContent(content_main);
                                infowindow.open({
                                    anchor: mark,
                                    map,
                                    shouldFocus: false
                                });
                            } else {
                                alert('gagal : ' + response.resp_code);
                            }
                        }
                    });
                }

            }

            function setContentDetail() {
                content_detail = `<div class="container-md" style="; height: auto; width: 500px;">
            <div class="row row-cols-1 row-cols-lg-1">
                <table style="font-size: 12px">
                    <tr style="height: 40px; color:#66b1ff">
                        <td colspan="1" onclick="back()" style="padding-left: 40px;"><i class="fa fa-chevron-left" style="margin-right:10px;"></i>Back</td>
                        <td colspan="1"></td>
                    </tr>
                    <tr style="height: 40px;text-align-last: left;border-top:1px solid #eff1f5">
                        <td colspan="1" style="padding-left: 40px;">Sub System ID</td>
                        <td colspan="1" style="padding-left: 40px;">` + ssid + `</td>
                    </tr>
                    <tr style="height: 40px;text-align-last: left;border-top:1px solid #eff1f5">
                        <td colspan="1" style="padding-left: 40px;">Sub System Name</td>
                        <td colspan="1" style="padding-left: 40px;">` + ssn + `</td>
                    </tr>
                    <tr style="height: 40px;text-align-last: left;border-top:1px solid #eff1f5">
                        <td colspan="1" style="padding-left: 40px;">Status</td>
                        <td colspan="1" style="padding-left: 40px;">` + sts + `</td>
                    </tr>
                </table>
            </div>
        </div>`;
            }

//            function mantap() {
//                $('.cd-popup-tes').addClass('is-visible');
//                document.getElementById('qq').style.display = 'hidden';
//            }
            function detail_global(data1, data2, data3) {
                ssid = data1;
                ssn = data2;
                sts = data3 + ' - ' + nilai;
                setContentDetail();
                infowindow.setContent(content_detail);
            }

            function detail_sensors(data1, data2, data3) {
                ssid = data1;
                ssn = data2;
                sts = data3 + ' - ' + nilai;
                setContentDetail();
                infowindow.setContent(content_detail);
            }
            function detail_infra(data1, data2, data3) {
                ssid = data1;
                ssn = data2;
                sts = data3 + ' - ' + nilai;
                setContentDetail();
                infowindow.setContent(content_detail);
            }

            function detail_mssr(data1, data2, data3) {
                ssid = data1;
                ssn = data2;
                sts = data3 + ' - ' + nilai;
                setContentDetail();
                infowindow.setContent(content_detail);
            }
            function detail_pedestal(data1, data2, data3) {
                ssid = data1;
                ssn = data2;
                sts = data3 + ' - ' + nilai;
                setContentDetail();
                infowindow.setContent(content_detail);
            }
            function detail_clock(data1, data2, data3) {
                ssid = data1;
                ssn = data2;
                sts = data3 + ' - ' + nilai;
                setContentDetail();
                infowindow.setContent(content_detail);
            }
            function detail_network(data1, data2, data3) {
                ssid = data1;
                ssn = data2;
                sts = data3 + ' - ' + nilai;
                setContentDetail();
                infowindow.setContent(content_detail);
            }
            function detail_sdcs(data1, data2, data3) {
                ssid = data1;
                ssn = data2;
                sts = data3 + ' - ' + nilai;
                setContentDetail();
                infowindow.setContent(content_detail);
            }
            function detail_aei(data1, data2, data3) {
                ssid = data1;
                ssn = data2;
                sts = data3 + ' - ' + nilai;
                setContentDetail();
                infowindow.setContent(content_detail);
            }
            function detail_cms(data1, data2, data3) {
                ssid = data1;
                ssn = data2;
                sts = data3 + ' - ' + nilai;
                setContentDetail();
                infowindow.setContent(content_detail);
            }

            function detail_ntp1(data1, data2, data3) {
                ssid = data1;
                ssn = data2;
                sts = data3 + ' - ' + nilai;
                setContentDetail();
                infowindow.setContent(content_detail);
            }
            function detail_ntp2(data1, data2, data3) {
                ssid = data1;
                ssn = data2;
                sts = data3 + ' - ' + nilai;
                setContentDetail();
                infowindow.setContent(content_detail);
            }
            function detail_tx(data1, data2, data3) {
                ssid = data1;
                ssn = data2;
                sts = data3 + ' - ' + nilai;
                setContentDetail();
                infowindow.setContent(content_detail);
            }

            function detail_switch1(data1, data2, data3) {
                ssid = data1;
                ssn = data2;
                sts = data3 + ' - ' + nilai;
                setContentDetail();
                infowindow.setContent(content_detail);
            }
            function detail_switch2(data1, data2, data3) {
                ssid = data1;
                ssn = data2;
                sts = data3 + ' - ' + nilai;
                setContentDetail();
                infowindow.setContent(content_detail);
            }

            function detail_lan1(data1, data2, data3) {
                ssid = data1;
                ssn = data2;
                sts = data3 + ' - ' + nilai;
                setContentDetail();
                infowindow.setContent(content_detail);
            }
            function detail_lan2(data1, data2, data3) {
                ssid = data1;
                ssn = data2;
                sts = data3 + ' - ' + nilai;
                setContentDetail();
                infowindow.setContent(content_detail);
            }

            function detail_rlu(data1) {

                var ctn = document.getElementById('ctn');
//                                    var ty = document.getElementById('example');
//                                    if (!ty) {
                var tbl = document.createElement("table");
                tbl.setAttribute("id", "example");
                tbl.setAttribute("style", "width:200px; font-size: 12px;");
                ctn.appendChild(tbl);
                var thead = document.createElement("thead");
                tbl.appendChild(thead);
                var tr = document.createElement("tr");
                thead.appendChild(tr);
                var th = document.createElement("th");
                th.innerHTML = 'description';
                tr.appendChild(th);
                var th1 = document.createElement("th");
                th1.innerHTML = 'status';
                tr.appendChild(th1);
//                                    }




                var datjson5 = new Object();
                datjson5.procCode = 'CNSDNP0007';
                datjson5.device_id = data1;
                $.ajax({
                    contentType: 'application/json',
                    dataType: "json",
                    url: "http://10.30.215.21:8080/DNPCNSServer/ProcessRequest",
                    data: JSON.stringify(datjson5),
                    type: 'post',
                    success: function (response) {
                        if (response.resp_code == 0000) {
                            var datanya = response.list;
                            $('#example').dataTable({
                                "paging": false,
                                "ordering": true,
                                "info": false,
                                "searching": false,
                                "data": datanya,
                                "columns": [
                                    {"data": "module_desc"},
                                    {"data": "status",
                                        render: function (data) {
                                            return '<div class="btn" style="background-color:' + data + ';"></div>';
                                        }
                                    }
                                ]
                            });
                            var the_reds = document.getElementById('example');
//                            the_reds.style.visibility = 'visible';
                            infowindow.setContent(the_reds);
                        } else {
                            alert('gagal : ' + response.resp_code);
                        }
                    }
                });
            }





            function back() {
                infowindow.setContent(content_main);
            }



            var colorPalette = ['#5470c6', '#91cc75', '#fac858', '#ee6666', '#73c0de', '#3ba272', '#fc8452', '#9a60b4', '#ea7ccc', '#ef3402', '#3aefdb', '#1df93d', '#f50bb2', '#7a6173', '#2f616a', '#c9e31e', '#8bc34a'];
            //chartkanan
//            var chartkanan = echarts.init(document.getElementById('chartkanan'));
            function chartKanan() {
                var datjson3 = new Object();
                var merek_radar1 = document.getElementById('merek_radar').value;
                if (merek_radar1 == '1') {
                    datjson3.procCode = 'CNSDNP0003B';
                } else {
                    datjson3.procCode = 'CNSDNP0003';
                }
                $.ajax({
                    contentType: 'application/json',
                    dataType: "json",
                    url: "http://10.30.215.21:8080/DNPCNSServer/ProcessRequest",
                    data: JSON.stringify(datjson3),
                    type: 'post',
                    success: function (response) {
                        if (response.resp_code == 0000) {
                            var data_gabung = [];
                            var data_name = [];
                            var data_value = [];
                            var i;
                            for (i = 0; i < response.list.length; i++) {
//                            data_gabung.push(JSON.stringify(response.list[i].device_name).substring(1, JSON.stringify(response.list[i].device_name)));

                                data_gabung.push(JSON.stringify(response.list[i].device_name).substring(7));
                                data_name.push(response.list[i].device_name);
                                data_value.push(response.list[i].record);
                            }

                            var chartDom3 = document.getElementById('chartkanan');
                            var myChart3 = echarts.init(chartDom3);
                            var option3;
                            option3 = {
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
                                        data: data_gabung,
                                        axisTick: {
                                            alignWithLabel: true
                                        },
                                        axisLabel: {interval: 0, rotate: 70}
                                    }
                                ],
                                yAxis: [
                                    {
                                        type: 'value'
                                    }
                                ],
                                series: [
                                    {
                                        name: 'National Percentage of Critical Status',
                                        type: 'bar',
                                        barWidth: '50%',
                                        data: data_value,
                                        color: ['#3398db']
                                    }
                                ]
                            };
                            option3 && myChart3.setOption(option3);
                        } else {
                            alert('gagal : ' + response.resp_code);
                        }
                    }
                });
            }
            ;
            function avaibilityFunc(data1, data2, data3, data4) {
                window.localStorage.setItem('ava_dev_id', data1);
                window.localStorage.setItem('ava_dev_kota', data2);
                window.localStorage.setItem('ava_dev_prov', data3);
                window.localStorage.setItem('ava_dev_name', data4);
                window.location.href = "avaibility.jsp";
            }

        </script>
        <script
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA50rFMPpGOI4Nuryv0t9VgAJm7bZ_9szA"
            async defer>
        </script>
    </body>
</html>
