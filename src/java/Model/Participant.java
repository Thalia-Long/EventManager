package Model;
import java.util.Objects;
public class Participant {
    private String participantId;
    private int eventId;
    private String userEmail, role;
    public String getparticipantId() {
        return participantId;
    }
    public void setparticipantId(String participantId) {
        this.participantId = participantId;
    }
    public int geteventId() {
        return eventId;
    }
    public void seteventId(int eventId) {
        this.eventId = eventId;
    }
    public String getuserEmail() {
        return userEmail;
    }
    public void setuserEmail(String userEmail) {
        this.userEmail = userEmail;
    }
    public String getrole() {
        return role;
    }
    public void setrole(String role) {
        this.role = role;
    }
    @Override
    public boolean equals(Object o) {
        if(o != null && o instanceof Participant) {
            Participant p = (Participant) o;
            return(p.getparticipantId().equalsIgnoreCase(participantId));
        }
        else
            return false;
    }
    @Override
    public int hashCode() {
        int hash = 7;
        hash = 79 * hash + Objects.hashCode(this.participantId);
        return hash;
    }
}