package controller;

import dao.DapAnDAO;
import model.DapAn;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/dapan")
public class DapAnServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DapAnDAO dapAnDAO;

    public void init() {
        dapAnDAO = new DapAnDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<DapAn> list = dapAnDAO.getAllDapAn();
        request.setAttribute("listDapAn", list);
        request.getRequestDispatcher("views/dap_an.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            int maCH = Integer.parseInt(request.getParameter("maCH"));
            String noiDung = request.getParameter("noiDung");
            boolean laDapAnDung = Boolean.parseBoolean(request.getParameter("laDapAnDung"));

            DapAn da = new DapAn(0, maCH, noiDung, laDapAnDung);
            dapAnDAO.addDapAn(da);
        } else if ("delete".equals(action)) {
            int maDA = Integer.parseInt(request.getParameter("maDA"));
            dapAnDAO.deleteDapAn(maDA);
        }
        response.sendRedirect("dapan");
    }
}
