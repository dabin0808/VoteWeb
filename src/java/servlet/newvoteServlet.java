package servlet;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jdbc.Vote;

@WebServlet(name = "newvoteServlet", urlPatterns = {"/newvoteServlet"})
public class newvoteServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Vote vdb;
        RequestDispatcher rd = null;
        try {
            String a = request.getParameter("vote_name");
            vdb = new Vote();
            if (vdb.existvote(a)) {
                String date = request.getParameter("year") + "-" + request.getParameter("month") + "-" + request.getParameter("day");
                vdb.insertvote(request.getParameter("user"), a, request.getParameter("e1"), request.getParameter("e2"), request.getParameter("e3"), request.getParameter("select"), date);
                rd = request.getRequestDispatcher("/index.jsp");
                rd.forward(request, response);
            } else {
                rd = request.getRequestDispatcher("/newvote.jsp");
                rd.forward(request, response);
            }
        } catch (ClassNotFoundException ex) {

        } catch (SQLException ex) {
       
        } catch (ServletException ex) {
       
        } catch (IOException ex) {
        
        } finally {
//            rd = request.getRequestDispatcher("/index.jsp");
            try {
                rd.forward(request, response);
            } catch (ServletException ex) {

            } catch (IOException ex) {

            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
