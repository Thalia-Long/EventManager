package Controller;
import javax.servlet.*;
import javax.servlet.http.*;
import org.hibernate.*;
import org.hibernate.cfg.Configuration;
public class VenueServlet extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html");
        try {
            String click = request.getParameter("click");
            HttpSession hs = request.getSession(false);
            Model.Venue v;
            SessionFactory factory = (new Configuration()).configure("Hibernate/hibernate.cfg.xml").buildSessionFactory();
            Session session = factory.openSession();
            Transaction tx = session.beginTransaction();
            RequestDispatcher rd;
            switch(click) {
                case "Add New Venue":   v = new Model.Venue();
                                        v.setvenueName("");
                                        v.setvenueAddr("");
                                        hs.setAttribute("thisVenue", v);
                                        rd = request.getRequestDispatcher("AddNewVenue.jsp");
                                        break;
                case "Save Venue":      if((v = (Model.Venue) hs.getAttribute("thisVenue")).getvenueName().equals(""))
                                            v.setvenueName(request.getParameter("venueName"));
                                        v.setvenueAddr(request.getParameter("venueAddr"));
                                        session.saveOrUpdate(v);
                                        tx.commit();
                                        request.setAttribute("click", "Venues");
                                        rd = request.getRequestDispatcher("click");
                                        break;
                case "Delete":          v = (Model.Venue) hs.getAttribute("thisVenue");
                                        session.delete(v);
                                        tx.commit();
                                        request.setAttribute("click", "Venues");
                                        rd = request.getRequestDispatcher("click");
                                        break;
                case "Cancel":          request.setAttribute("click", "Venues");
                                        rd = request.getRequestDispatcher("click");
                                        break;
                default:                v = (Model.Venue) session.createQuery("from Venue as v where venueName='" + request.getParameter("click") + "'").uniqueResult();
                                        hs.setAttribute("thisVenue", v);
                                        rd = request.getRequestDispatcher("AddNewVenue.jsp");
            }
            session.close();
            factory.close();
            rd.forward(request, response);
        } catch(Exception ex) {}
    }
}