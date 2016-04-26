
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:h="http://java.sun.com/jsf/html">
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <style type="text/css">
            .weather {
                height: 155px;
                width: 112px;
                border: solid 1px blue;
            }
            #city{
                font: bold italic 110% serif; 
                color: firebrick
            }
            .hot{
                color: red;
                text-decoration: overline;
            }
            .cold{
                color: blueviolet;
                text-decoration: underline;
            }
            .descr{
                font: cursive italic 80% serif; 
                color: firebrick
            }
            .brd {
                border: 4px double black; 
                width: 50;
                height: 50;
            }

        </style>
    </head>
    <body onload="loadWeather();loadCities()">
        <h2>Weather </h2>

        <script>

            var KelvinConstant = 273.15;
            var CelsiiMark = '°C';
            function kelvinToCelsii(kelvins) {
                return (kelvins - KelvinConstant).toFixed(0);
            }

            function loadWeather() {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (xhttp.readyState == 4 && xhttp.status == 200) {
                        var jsonData = JSON.parse(xhttp.responseText);

                        var tempMax = jsonData.main.temp_max;
                        var tempMin = jsonData.main.temp_min;
                        var name = jsonData.name;
                        var clouds = jsonData.clouds.all;
                        var wind = jsonData.wind.speed;
                        var descr = jsonData.weather[0].description;
                        document.getElementById("city").innerHTML = name;
                        document.getElementById("tempMax").innerHTML = 'temp max: ' + kelvinToCelsii(tempMax) + CelsiiMark;
                        document.getElementById("tempMin").innerHTML = 'temp min: ' + kelvinToCelsii(tempMin) + CelsiiMark;
                        document.getElementById("descr").innerHTML = descr;
                        document.getElementById("wind").innerHTML = 'wind: ' + wind + ' m/sec';
                        switch (true) {
                            case (clouds < 15):
                                document.getElementById("myImg").src = "resources/images/1.jpg";
                                break;
                            case (clouds >= 15 && clouds < 30):
                                document.getElementById("myImg").src = "resources/images/2.jpg";
                                break;
                            case (clouds >= 30 && clouds < 60):
                                document.getElementById("myImg").src = "resources/images/3.jpg";
                                break;
                            case (clouds >= 60 && clouds < 75):
                                document.getElementById("myImg").src = "resources/images/4.jpg";
                                break;
                            case (clouds >= 75 && clouds < 90):
                                document.getElementById("myImg").src = "resources/images/5.jpg";
                                break;
                            case (clouds >= 90):
                                document.getElementById("myImg").src = "resources/images/6.jpg";
                                break;
                            default:
                                alert("NONE");
                                break;
                        }
                    }
                }

                xhttp.open("GET", getWeatherAPILinkWithCityChoseFromComboBox(), true);
                xhttp.send();
            }

            function getWeatherAPILinkWithCityChoseFromComboBox() {
                return "http://api.openweathermap.org/data/2.5/weather?q=" + document.getElementById("listOfCities").value + "&appid=2ab5b3146e581d9a3ebf77d077c095a8";
            }

            function loadCities() {

                var xobj = new XMLHttpRequest();
                xobj.overrideMimeType("application/json");
                xobj.open('GET', 'resources/files/city.json', true);
                xobj.onreadystatechange = function ()
                {
                    if (xobj.readyState == 4 && xobj.status == 200)
                    {
                        var a = JSON.parse(xobj.responseText);
                        var option;
                        var name;
                        var select = document.getElementById("listOfCities");

                        for (var i = 0; i < 11; i++) {
                            name = a.city[i].name;
                            option = document.createElement("option");
                            option.innerHTML = name;
                            option.value = name;
                            select.appendChild(option);
                        }
                    }
                }
                xobj.send();
            }
        </script>
        <div id="weather" class="weather">
            <span id="city"></span></br>
            <span id="descr" class="descr">..</span></br>
            <span id="tempMax" class="hot">..</span></br>
            <span id="tempMin" class="cold">..</span></br>
            <span id="wind" class="descr">..</span></br>
            <img id="myImg" width="50" height="50" >
        </div>

        <select id='listOfCities' onchange="loadWeather()">
            <option value="Lviv">Lviv</option> <!--default value-->
        </select>

    </body>

</html>