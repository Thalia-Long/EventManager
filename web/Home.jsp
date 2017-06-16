<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>        
        <div><jsp:include page="Menu.jsp" /></div>        
        <div class="container div-top">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Event ID</th>
                        <th>Event Name</th>
                        <th>Event Type</th>
                        <th>Event Description</th>
                        <th>Event Date</th>
                        <th>Event Venue</th>
                        <th><th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${allEvents}" var="thisEvent">
                        <tr>
                            <td><c:out value="${thisEvent.eventId}" /></td>
                            <td><c:out value="${thisEvent.eventName}" /></td>
                            <td><c:out value="${thisEvent.eventType}" /></td>
                            <td><c:out value="${thisEvent.eventDesc}" /></td>
                            <td><c:out value="${thisEvent.eventDate}" /></td>
                            <td><c:out value="${thisEvent.venueName}" /></td>
                            <td><form action="event" method="post"><button name="click" type="submit" value="${thisEvent.eventId}">View</button></form></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="container">
            <form action="event" method="post">
                <input name="click" type="submit" class="btn btn-primary" value="Add New Event" />
            </form>
        </div>
    </body>
</html>