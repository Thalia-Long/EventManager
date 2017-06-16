package Controller;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
public class RegisterServlet extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String userEmail = request.getParameter("userEmail");
            String userPassword = request.getParameter("userPassword");
            String fName = request.getParameter("fName");
            String lName = request.getParameter("lName");
            String phone = request.getParameter("phone");
            HttpSession hs = request.getSession();
            SessionFactory factory = (new Configuration()).configure("Hibernate/hibernate.cfg.xml").buildSessionFactory();
            Session session = factory.openSession();
            Transaction tx = session.beginTransaction();
            Model.User u = new Model.User();
            u.setuserEmail(userEmail);
            u.setuserPassword(userPassword);
            u.setfName(fName);
            u.setlName(lName);
            u.setPhone(phone);
            u.setisAdmin(false);
            session.saveOrUpdate(u);
            tx.commit();
            session.close();
            factory.close();
            PrintWriter out = response.getWriter();
            out.print("<font color=\"green\">Registration successful. Please login.</font>");
            RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
            rd.include(request, response);
        } catch(Exception ex) {}
    }
}
