package controller;

import dao.CauHoiDAO;
import model.CauHoi;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CauHoiServlet")
public class CauHoiServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CauHoiDAO cauHoiDAO;

    public CauHoiServlet() {
        super();
        cauHoiDAO = new CauHoiDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            int maCauHoi = Integer.parseInt(request.getParameter("maCauHoi"));
            cauHoiDAO.deleteCauHoi(maCauHoi);
            response.sendRedirect("views/cauhoi.jsp");
        } else if ("edit".equals(action)) {
            int maCauHoi = Integer.parseInt(request.getParameter("maCauHoi"));
            CauHoi ch = cauHoiDAO.getCauHoiById(maCauHoi);
            request.setAttribute("cauHoi", ch);
            request.getRequestDispatcher("views/cauhoi_edit.jsp").forward(request, response);
        } else {
            List<CauHoi> listCauHoi = cauHoiDAO.getAllCauHoi();
            request.setAttribute("listCauHoi", listCauHoi);
            request.getRequestDispatcher("views/cauhoi.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            String noiDung = request.getParameter("noiDung");
            int maDe = Integer.parseInt(request.getParameter("maDe"));
            int doKho = Integer.parseInt(request.getParameter("doKho"));

            CauHoi ch = new CauHoi(0, noiDung, maDe, doKho);
            cauHoiDAO.addCauHoi(ch);
            response.sendRedirect("views/cauhoi.jsp");
        } else if ("update".equals(action)) {
            int maCauHoi = Integer.parseInt(request.getParameter("maCauHoi"));
            String noiDung = request.getParameter("noiDung");
            int maDe = Integer.parseInt(request.getParameter("maDe"));
            int doKho = Integer.parseInt(request.getParameter("doKho"));

            CauHoi ch = new CauHoi(maCauHoi, noiDung, maDe, doKho);
            cauHoiDAO.updateCauHoi(ch);
            response.sendRedirect("views/cauhoi.jsp");
        }
    }
}
