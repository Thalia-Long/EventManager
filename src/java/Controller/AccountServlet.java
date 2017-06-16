package Controller;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import org.hibernate.*;
import org.hibernate.cfg.Configuration;
public class AccountServlet extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html");
        try {
            String click = request.getParameter("click");
            if(click == null) {
                click = (String) request.getAttribute("click");
                request.removeAttribute("click");
            }
            HttpSession hs = request.getSession(false);
            Model.User u = (Model.User) hs.getAttribute("thisUser");
            SessionFactory factory = (new Configuration()).configure("Hibernate/hibernate.cfg.xml").buildSessionFactory();
            Session session = factory.openSession();
            Transaction tx = session.beginTransaction();
            RequestDispatcher rd;
            switch(click) {
                case "Change Password": rd = request.getRequestDispatcher("NewPasswordForm.html");
                                        break;
                case "Confirm Password":if(u.getuserPassword().equals(request.getParameter("old"))) {
                                            u.setuserPassword(request.getParameter("new"));
                                            session.saveOrUpdate(u);
                                            tx.commit();
                                        }
                                        else
                                            response.getWriter().print("Invalid Credentials");
                                        rd = request.getRequestDispatcher("Account.jsp");
                                        break;
                case "Cancel":          rd = request.getRequestDispatcher("Account.jsp");
                                        break;
                case "Save":            u.setfName(request.getParameter("fName"));
                                        u.setlName(request.getParameter("lName"));
                                        u.setPhone(request.getParameter("phone"));
                                        session.saveOrUpdate(u);
                                        tx.commit();
                                        rd = request.getRequestDispatcher("Account.jsp");
                                        break;
                default:                rd = request.getRequestDispatcher("Account.jsp");
            }
            session.close();
            factory.close();
            rd.include(request, response);
        } catch(Exception ex) {}
    }
}