<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Venue</title>
    </head>
    <body>
        <div><jsp:include page="Menu.jsp" /></div>
        <div>
            <%Model.Venue v = (Model.Venue) session.getAttribute("thisVenue");%>
            <form action="venue" method="post">
                Venue Name : <input name="venueName" type="text" value="<%=v.getvenueName()%>" <%if(!v.getvenueName().equals("")) {%>disabled<%}%> /><br />
                Address : <input name="venueAddr" type="text" value="<%=v.getvenueAddr()%>" /><br />
                <input name="click" type="submit" value="Save Venue" />
                <input name="click" type="submit" value="Cancel" />
                <input name="click" type="submit" value="Delete" <%if(v.getvenueName().equals("")) {%>disabled<%}%> />
            </form>
        </div>
    </body>
</html>
