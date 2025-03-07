package controller;

import dao.BaiLamDAO;
import model.BaiLam;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/bailam")
public class BaiLamServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BaiLamDAO baiLamDAO;

    public void init() {
        baiLamDAO = new BaiLamDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<BaiLam> list = baiLamDAO.getAllBaiLam();
        request.setAttribute("listBaiLam", list);
        request.getRequestDispatcher("views/bai_lam.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            int maHS = Integer.parseInt(request.getParameter("maHS"));
            int maDe = Integer.parseInt(request.getParameter("maDe"));
            Timestamp thoiGianNop = Timestamp.valueOf(request.getParameter("thoiGianNop"));
            float diem = Float.parseFloat(request.getParameter("diem"));

            BaiLam baiLam = new BaiLam(0, maHS, maDe, thoiGianNop, diem);
            baiLamDAO.addBaiLam(baiLam);
        } else if ("delete".equals(action)) {
            int maBaiLam = Integer.parseInt(request.getParameter("maBaiLam"));
            baiLamDAO.deleteBaiLam(maBaiLam);
        }
        response.sendRedirect("bailam");
    }
}
