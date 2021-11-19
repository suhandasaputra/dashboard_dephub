<%@page contentType="text/html"%>    
<%@page pageEncoding="UTF-8"%>
<%@include file='defaultextend.jsp'%>

<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login | DASHBOARD MONITORING CNS</title>
        <style>
            .con {
                height: 100%;
                display: flex;
                align-items: center;
                position: absolute;
                width: 100%;
                top: 0;
                right: 0;
                left: 0;
                background: rgba(0,150,120,.30);
            }

            form {
                padding: 25px;
                text-align: center;
                width: 500px;
            }

            #carousel-img {
                height: 100vh;
                width: 100%;
            }
            body {
                color: white;
                text-shadow: 1px 1px black;
                font-weight: 600;
            }

        </style>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body style="font-family: 'Roboto'">
        <div class="img-responsive carousel-fade"  data-ride="carousel" style="height: 100%; padding: 0; margin: 0; background-color: #09024a">
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="img/bg-login.jpg" alt="#" class="img-responsive" style="height: 100%; width: 100%; opacity: 0.5" id="carousel-img">
                </div>
                <div class="item">
                    <img src="img/bg-login-2.jpg" alt="#" class="img-responsive" style="height: 100%; width: 100%; opacity: 0.5">
                </div>
                <div class="item">
                    <img src="img/bg-login-3.jpg" alt="#" class="img-responsive" style="height: 100%; width: 100%; opacity: 0.5">
                </div>
                <div class="item">
                    <img src="img/bg-login-4.jpg" alt="#" class="img-responsive" style="height: 100%; width: 100%; opacity: 0.5">
                </div>
                <div class="con" style="">
                    <div class="col-md-6" style="height: 100%">
                        <div id="left" style="width: 500px; height: 350px; margin: auto; top: 30%; position: relative; text-align: -webkit-center">
                            <img class="mb-4" src="img/logo-kemenhub.png" alt="" width="130" height="130">
                            <div style="color: white; font-weight: 600; font-size: 35px;">DASHBOARD MONITORING CNS</div>
                        </div>
                    </div>
                    <div class="col-md-6" style="background-color: #09024a; height: 100%;background: rgba(0,0,50,.5)">
                        <div id="right" style="width: 500px; height: 350px; margin: auto; top: 30%; position: relative; text-align: -webkit-center">
                            <img class="mb-4" src="img/shield.png" alt="" width="110" height="110">
                            <form>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Username" required="">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" placeholder="Password" required="">
                                </div>
                                <button class="w-100 btn btn-lg btn-primary" type="submit" style="margin-bottom: 10px; padding: 15px">SIGN IN</button>
                                <p class="" style="color: white;">&copy; 2021 DIREKTORAT NAVIGASI PENERBANGAN</p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>
</html>