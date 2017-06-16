package Model;
import java.util.Objects;
public class Booking {
    private int bookingId;
    private String venueName;
    private String bookingDate;
    public int getbookingId() {
        return bookingId;
    }
    public void setbookingId(int bookingId) {
        this.bookingId = bookingId;
    }
    public String getvenueName() {
        return venueName;
    }
    public void setvenueName(String venueName) {
        this.venueName = venueName;
    }
    public String getbookingDate() {
        return bookingDate;
    }
    public void setbookingDate(String bookingDate) {
        this.bookingDate = bookingDate;
    }
    @Override
    public boolean equals(Object o) {
        if(o != null && o instanceof Booking) {
            Booking b = (Booking) o;
            return((b.getbookingId() == bookingId));
        }
        else
            return false;
    }
    @Override
    public int hashCode() {
        int hash = 5;
        hash = 13 * hash + Objects.hashCode(this.bookingId);
        return hash;
    }
}