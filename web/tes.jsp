<%@include file='defaultextend.jsp'%>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Animated Radial Progress Bars</title>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css"/>

    </head>
    <body>
        <table id="example" class="display" style="width:100%">
            <thead>
                <tr>
                    <th>module_id</th>
                    <th>module_desc</th>
                    <th>total_normal_time</th>
                    <th>total_intermittent_time</th>
                    <th>total_down_time</th>
                    <th>frequencyDown</th>
                    <th>availibility</tb>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
        <script>
            /* Formatting function for row details - modify as you need */
            var maco = {
                "data": [
                    {
                        "id": "1",
                        "radar": "Radar Kuala",
                        "dates":
                                [
                                    {
                                        "module_id": "RK1001M001",
                                        "module_desc": "Sensors RK1",
                                        "total_normal_time": 8.05,
                                        "total_intermittent_time": 0.0,
                                        "total_down_time": 0.0,
                                        "frequencyDown": 0.0,
                                        "availibility": "100"
                                    },
                                    {
                                        "module_id": "RK1001M002",
                                        "module_desc": "Sensors RK2",
                                        "total_normal_time": 8.05,
                                        "total_intermittent_time": 0.0,
                                        "total_down_time": 0.0,
                                        "frequencyDown": 0.0,
                                        "availibility": "100"
                                    }
                                ]
                    },
                    {
                        "id": "2",
                        "radar": "Radar Jakarta",
                        "dates":
                                [
                                    {
                                        "module_id": "RJ1001M001",
                                        "module_desc": "Sensors RJ1",
                                        "total_normal_time": 8.05,
                                        "total_intermittent_time": 0.0,
                                        "total_down_time": 0.0,
                                        "frequencyDown": 0.0,
                                        "availibility": "100"
                                    },
                                    {
                                        "module_id": "RJ1001M002",
                                        "module_desc": "Sensors RJ2",
                                        "total_normal_time": 8.05,
                                        "total_intermittent_time": 0.0,
                                        "total_down_time": 0.0,
                                        "frequencyDown": 0.0,
                                        "availibility": "100"
                                    }
                                ]
                    },
                    {
                        "id": "3",
                        "radar": "Radar Medan",
                        "dates":
                                [
                                    {
                                        "module_id": "RM1001M001",
                                        "module_desc": "Sensors RM1",
                                        "total_normal_time": 8.05,
                                        "total_intermittent_time": 0.0,
                                        "total_down_time": 0.0,
                                        "frequencyDown": 0.0,
                                        "availibility": "100"
                                    },
                                    {
                                        "module_id": "RM1001M002",
                                        "module_desc": "Sensors RM2",
                                        "total_normal_time": 8.05,
                                        "total_intermittent_time": 0.0,
                                        "total_down_time": 0.0,
                                        "frequencyDown": 0.0,
                                        "availibility": "100"
                                    }
                                ]
                    }
                ]
            };

            $(document).ready(function () {
                var tabelnya = document.getElementById('example').getElementsByTagName('tbody')[0];
                var row;
                var newcell;
                var newtext;

                var row2;
                var newcell2;
                var newtext2;
                $.each(maco.data, function (key, data) {
                    row = tabelnya.insertRow();


                    newcell = row.insertCell();
                    newtext = document.createTextNode(data.radar);
                    newcell.appendChild(newtext);
                    $.each(data.dates, function (key, data1) {

                        row2 = tabelnya.insertRow();
                        newcell2 = row2.insertCell();
                        newtext2 = document.createTextNode(data1.module_id);
                        newcell2.appendChild(newtext2);

                        newcell2 = row2.insertCell();
                        newtext2 = document.createTextNode(data1.module_desc);
                        newcell2.appendChild(newtext2);

                        newcell2 = row2.insertCell();
                        newtext2 = document.createTextNode(data1.total_normal_time);
                        newcell2.appendChild(newtext2);

                        newcell2 = row2.insertCell();
                        newtext2 = document.createTextNode(data1.total_intermittent_time);
                        newcell2.appendChild(newtext2);

                        newcell2 = row2.insertCell();
                        newtext2 = document.createTextNode(data1.total_down_time);
                        newcell2.appendChild(newtext2);

                        newcell2 = row2.insertCell();
                        newtext2 = document.createTextNode(data1.frequencyDown);
                        newcell2.appendChild(newtext2);

                        newcell2 = row2.insertCell();
                        newtext2 = document.createTextNode(data1.availibility);
                        newcell2.appendChild(newtext2);
                        
//                        newcell2 = row2.insertCell();
//                        newtext2 = document.createTextNode(data1.availibility);
//                        newcell2.appendChild(newtext2);

                    });
                });
            });
        </script>
    </body>
</html>
