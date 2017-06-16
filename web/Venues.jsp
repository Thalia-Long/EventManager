<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Events</title>        
    </head>
    <body>
       
        <div><jsp:include page="Menu.jsp" /></div>        
        <div class="container div-top">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Venue Name</th>
                        <th>Venue Address</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listOfVenues}" var="thisVenue">
                        <tr>
                            <td><c:out value="${thisVenue.venueName}" /></td>
                            <td><c:out value="${thisVenue.venueAddr}" /></td>
                            <td>
                                <form action="venue" method="post">
                                    <button name="click" type="submit" value="${thisVenue.venueName}">View</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="container">
            <form action="venue" method="post">
                <input name="click" type="submit" class="btn btn-primary" value="Add New Venue" />
            </form>
        </div>
    </body>
</html>