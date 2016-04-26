<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<html>
    <link rel="stylesheet" type="text/css" href="resources/css/skel.css">
    <link rel="stylesheet" type="text/css" href="resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="resources/css/style-wide.css">
    <link rel="stylesheet" type="text/css" href="resources/css/style-mobile.css">
    <link rel="stylesheet" type="text/css" href="resources/css/style-narrow.css">
    <link rel="stylesheet" type="text/css" href="resources/css/style-narrower.css">
    <link rel="stylesheet" type="text/css" href="resources/css/style-normal.css">
    <link rel="stylesheet" type="text/css" href="resources/css/font-awesome.min.css">
    
    <head>
        <title>Technology Page</title>
        <style type="text/css">
            .tg  {
                border-collapse:collapse;
                border-spacing:0;
                border-color:#ccc;
            }
            .tg td{
                font-family:Arial, sans-serif;
                font-size:14px;
                padding:10px 5px;
                border-style:solid;
                border-width:1px;
                overflow:hidden;
                word-break:normal;
                border-color:#ccc;color:#333;
                background-color:#fff;
            }
            .tg th{
                font-family:Arial, sans-serif;
                font-size:14px;
                font-weight:normal;
                padding:10px 5px;
                border-style:solid;
                border-width:1px;
                overflow:hidden;
                word-break:normal;
                border-color:#ccc;
                color:#333;
                background-color:#f0f0f0;
            }
            .tg .tg-4eph{
                background-color:#f9f9f9
            }
            .title{
                font-family:Arial, sans-serif;
            }

        </style>
    </head>
    <body class="wrapper style1">
        <h1 class="title">
            Add a Technology
        </h1>
        <img src="resources/images/pic02.jpg" />

        <c:url var="addAction" value="/technology/add" ></c:url>

        <form:form action="${addAction}" commandName="technology">
            <table>
                <c:if test="${!empty technology.name}">
                    <tr>
                        <td>
                            <form:label path="id">
                                <spring:message text="ID"/>
                            </form:label>
                        </td>
                        <td>
                            <form:input path="id" readonly="true" size="8"  disabled="true" />
                            <form:hidden path="id" />
                        </td>
                    </tr>
                </c:if>
                <tr>
                    <td>
                        <form:label path="name">
                            <spring:message text="Name"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="name" required="true" />
                    </td> 
                </tr>
                <tr>
                    <td>
                        <form:label path="chapter">
                            <spring:message text="Chapter"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="chapter" required="true"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <c:if test="${!empty technology.name}">
                            <input type="submit"
                                   value="<spring:message text="Edit Technology"/>" />
                        </c:if>
                        <c:if test="${empty technology.name}">
                            <input type="submit"
                                   value="<spring:message text="Add Technology"/>" />
                        </c:if>
                    </td>
                </tr>
            </table>  
        </form:form>
        <br>
        <h3>Technology List</h3>
        <c:if test="${!empty listTechnologies}">
            <table class="tg">
                <tr>
                    <th width="80">Technology ID</th>
                    <th width="120">Technology Name</th>
                    <th width="120">Technology Chapter</th>
                    <th width="60">Edit</th>
                    <th width="60">Delete</th>
                </tr>
                <c:forEach items="${listTechnologies}" var="technology">
                    <tr>
                        <td>${technology.id}</td>
                        <td>${technology.name}</td>
                        <td>${technology.chapter}</td>
                        <td><a href="<c:url value='/edit/${technology.id}' />" >Edit</a></td>
                        <td><a href="<c:url value='/remove/${technology.id}' />" >Delete</a></td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </body>
</html>