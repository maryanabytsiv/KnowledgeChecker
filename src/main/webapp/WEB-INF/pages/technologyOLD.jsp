<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <style>
            body {
                background: url("background.png");
                background-size: 50px, 130px, auto;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Technology list</title>
    </head>
    <body>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script type="text/javascript">
            function addTechnology() {
                var chapter = document.getElementById("chapter").value;
                var newTechnologyName = document.getElementById("technologyName").value;
                $('#tableTechnology').append('<tr><td>' + chapter + '</td> <td>' + newTechnologyName + '</td></tr>');
            }

//            $(document).ready(function () {
//                sendAjax();
//            });
//
//            function sendAjax() {
//
//                $.ajax({
//                    url: "KnowledgeChecker/technology/addRecord",
//                    type: 'POST',
//                    dataType: 'json',
//                    data: "{\"name\":\"hmkcode\",\"id\":2}",
//                    contentType: 'application/json',
//                    mimeType: 'application/json',
//                    success: function (data) {
//                        alert(data.id + " " + data.name);
//                    },
//                    error: function (data, status, er) {
//                        alert("error: " + data + " status: " + status + " er:" + er);
//                    }
//                });
//            }
        </script>

        <table id="tableTechnology" border="2">
            <tr>
                <td>Chapter</td>
                <td>Name of technology</td>
            </tr>
            <c:forEach var="technology" items="${technologyList}">         
                <tr>
                    <td>${technology.chapterName}</td>
                    <td>${technology.name}</td>
                </tr>
            </c:forEach>

            <!--todo auto delete from DB
                                    <tr>
                                            <td><input type="button" value="delete" onclick="window.location='person/delete?id=${person.id}'"/></td>
                                    </tr>-->

        </table>
        <form  action="technology/index.jsp" method="POST">
            <select id="chapter">
                <option value="web">web</option>
                <option value="framework">framework</option>
                <option value="language">language</option>
            </select>
            <input id="technologyName" type="text" size="10"/>
            <!--<input type="submit" value="Enter" onmousedown="addTechnology()">-->

        </form>
        <button type="submit" onmousedown="addTechnology()">Submit</button><br>
    </body>
</html>