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

@WebServlet(name = "voteServlet", urlPatterns = {"/voteServlet"})
public class voteServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Vote vdb = new Vote();
            boolean e1 = false;
            boolean e2 = false;
            boolean e3 = false;
            String[] cb = request.getParameterValues("elements");
            if (cb == null) {
                switch (request.getParameter("element")) {
                    case "e1":
                        e1 = true;
                        break;
                    case "e2":
                        e2 = true;
                        break;
                    case "e3":
                        e3 = true;
                        break;
                    default:
                        break;
                }
            } else {
                for (String e : cb) {
                    switch (e) {
                        case "e1":
                            e1 = true;
                            break;
                        case "e2":
                            e2 = true;
                            break;
                        case "e3":
                            e3 = true;
                            break;
                        default:
                            break;
                    }
                }
            }

            vdb.setvote(request.getParameter("votename"), e1, e2, e3);

            request.setAttribute("votename", request.getParameter("votename"));
        } catch (ClassNotFoundException ex) {

        } catch (SQLException ex) {

        } finally {
            try {
                RequestDispatcher rd = request.getRequestDispatcher("/lookvote.jsp");
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
