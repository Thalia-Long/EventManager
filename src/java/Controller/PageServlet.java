package Controller;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.Session;
import javax.servlet.RequestDispatcher;
import java.io.PrintWriter;
import java.util.*;
public class PageServlet extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html");
        try {
            String click = (String) request.getAttribute("click");
            if(click == null) {
                request.removeAttribute("click");
                click = request.getParameter("click");
            }
            HttpSession hs = request.getSession(false);
            Model.User u = (Model.User) hs.getAttribute("thisUser");
            RequestDispatcher rd;
            ArrayList<Model.User> ul;
            ArrayList<Model.Event> el;
            ArrayList<Model.Participant> pl;
            ArrayList<Model.Venue> vl;
            SessionFactory factory = (new Configuration()).configure("Hibernate/hibernate.cfg.xml").buildSessionFactory();
            Session session = factory.openSession();
            switch(click) {
                case "Cancel":
                case "Home":        el = new ArrayList<>();
                                    for(Object o:session.createQuery("from Event as e where e.isPublic=1").list())
                                        el.add((Model.Event) o);
                                    request.setAttribute("allEvents", el);
                                    rd = request.getRequestDispatcher("Home.jsp");
                                    break;
                case "My Events":   pl = new ArrayList<>();
                                    for(Object o:session.createQuery("from Participant as p where p.userEmail='" + u.getuserEmail() + "'").list())
                                        pl.add((Model.Participant) o);
                                    el = new ArrayList<>();
                                    for(Model.Participant p:pl)
                                        el.add((Model.Event) session.createQuery("from Event as e where e.eventId=" + p.geteventId()).uniqueResult());
                                    request.setAttribute("myEvents", el);
                                    rd = request.getRequestDispatcher("MyEvents.jsp");
                                    break;
                case "Venues":      vl = new ArrayList<>();
                                    for(Object o:session.createQuery("from Venue as v").list())
                                        vl.add((Model.Venue) o);
                                    request.setAttribute("listOfVenues", vl);
                                    rd = request.getRequestDispatcher("Venues.jsp");
                                    break;
                case "Account":     ul = new ArrayList<>();
                                    for(Object o:session.createQuery("from User as u").list())
                                        ul.add((Model.User) o);
                                    if(u.getisAdmin())
                                        request.setAttribute("listOfUsers", ul);
                                    rd = request.getRequestDispatcher("Account.jsp");
                                    break;
                default:            if(hs.getAttribute("doRemember").equals("yes")) {
                                        request.setAttribute("userEmail", hs.getAttribute("userEmail"));
                                        request.setAttribute("userPassword", hs.getAttribute("userPassword"));
                                        request.setAttribute("doRemember", "yes");
                                    }
                                    hs.invalidate();
                                    PrintWriter out = response.getWriter();
                                    out.print("<font color=\"red\">Logout successful.</font>");
                                    rd = request.getRequestDispatcher("Login.jsp");
            }
            session.close();
            factory.close();
            rd.include(request, response);
        } catch(Exception ex) {}
    }
}