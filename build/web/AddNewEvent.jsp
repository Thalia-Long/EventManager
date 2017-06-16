<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Venue</title>
        <script>
            function enableVenues(dateBooked) {
		if(dateBooked === "")
                    document.getElementById("venueName").disabled = true;
                else {
                    document.getElementById("venueName").disabled = false;
                    /*var venueName = document.getElementById("venueName");
                    venueName.options.length = 0; 
                    venueName.disabled = false;
                    $.get( "/WebTest1/event?click=getVenues&selectedDate="+dateBooked, function( data ) {
		    var vl = JSON.parse(data);                    
                    for(i = 0; i < vl.length; i++) {
                        var option = document.createElement("option");
                        option.text = vl[i];
                        option.value = vl[i];
                        venueName.add(option);
                    }
	            });*/
                }
            }
            function booked() {
                document.getElementById("addParticipant").disabled = false;
            }
        </script>
    </head>
    <body>
        <div><jsp:include page="Menu.jsp" /></div>
        <div class="container div-top">
            <%Model.Event e = (Model.Event) session.getAttribute("thisEvent");
            String role = (String) session.getAttribute("role");%>
            <form action="event" method="post">
                <input name="eventName" type="text" placeholder="Event Name" value="<%=e.geteventName()%>" class="form-control" <%if(!role.equals("Organizer")) {%>disabled<%}%> required />
                <input name="eventType" type="text" placeholder="Event Type" value="<%=e.geteventType()%>" class="form-control" <%if(!role.equals("Organizer")) {%>disabled<%}%> required />
                <input name="isPublic" type="checkbox" value="yes" <%if(e.getisPublic()) {%>checked<%}%> <%if(!role.equals("Organizer")) {%>disabled<%}%> /> Public
                <hr />
                <textarea name="eventDesc" placeholder="Description" class="form-control" <%if(!role.equals("Organizer")) {%>disabled<%}%> required><%=e.geteventDesc()%></textarea>
                <hr />
                <%if(role.equals("Organizer")) {%>
                <input name="eventDate" type="date" value="<%=e.geteventDate()%>" onchange="enableVenues(this.value)" required />
                <select name="venueName" id="venueName" disabled>
                    <c:forEach items="${listOfVenues}" var="thisVenue">
                        <option>${thisVenue.venueName}</option>
                    </c:forEach>
                </select>
                <input name="click" type="submit" value="Book Event" onclick="booked()" class="btn btn-primary" />
                <%} else {%>
                <input type="text" value="<%=e.geteventDate()%>" disabled />
                <input type="text" value="<%=e.getvenueName()%>" disabled />
                <input type="text" value="<%=request.getAttribute("venueAddr")%>" disabled />
                <%}%>
            </form>
            <hr />
            <%if(role.equals("Organizer") || role.equals("Special Guest")) {%>
            <c:forEach items="${myParticipants}" var="thisParticipant">
                <form action="event" method="post">
                    <input name="userEmail" type="text" value="${thisParticipant.userEmail}" />
                    <c:set var="Organizer" value="Organizer" />
                    <c:set var="Participant" value="Participant" />
                    <c:set var="Guest" value="Special Guest" />
                    <c:if test="${thisParticipant.role == Organizer}">
                        <select name="role" id="role" <%if(role.equals("Special Guest")) {%>disabled<%}%>>
                            <option value="Organizer" selected="selected">Organizer</option>
                            <option value="Participant">Participant</option>
                            <option value="Special Guest">Special Guest</option>
                        </select>
                    </c:if>
                    <c:if test="${thisParticipant.role == Participant}">
                        <select name="role" id="role" <%if(role.equals("Special Guest")) {%>disabled<%}%>
                            <option value="Organizer">Organizer</option>
                            <option value="Participant" selected="selected">Participant</option>
                            <option value="Special Guest">Special Guest</option>
                        </select>
                    </c:if>
                    <c:if test="${thisParticipant.role == Guest}">
                        <select name="role" id="role" <%if(role.equals("Special Guest")) {%>disabled<%}%>>
                            <option value="Organizer">Organizer</option>
                            <option value="Participant">Participant</option>
                            <option value="Special Guest" selected="selected">Special Guest</option>
                        </select>
                    </c:if>
                    <%if(role.equals("Organizer")) {%>
                    <input name="click" type="submit" value="Save Participant" class="btn btn-primary" disabled />
                    <%}%><br />
                </form>
            </c:forEach>
            <%}%>
            <form action="event" method="post">
                <%if(role.equals("Viewer")) {%>
                <input name="click" id="addParticipant" type="submit" value="RSVP" class="btn btn-primary" />
                <%} else {%>
                <input name="userEmail" type="text" placeholder="Email" />
                <select name="role" id="role">
                    <%if(role.equals("Organizer")) {%>
                    <option value="Organizer">Organizer</option>
                    <%} if(role.equals("Organizer") || role.equals("Special Guest")) {%>
                    <option value="Special Guest">Special Guest</option>
                    <%}%>
                    <option value="Participant">Participant</option>
                </select>
                <input name="click" id="addParticipant" type="submit" value="Add Participant" class="btn btn-primary" <%if(e.getvenueName() == null) {%> disabled<%}%> />
                <%}%>
            </form>
            <hr />
            <form action="click" method="post"><input name="click" type="submit" value="Cancel" class="btn btn-primary" /></form>
        </div>
    </body>
</html>