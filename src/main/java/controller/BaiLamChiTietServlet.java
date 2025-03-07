package controller;

import dao.BaiLamChiTietDAO;
import model.BaiLamChiTiet;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/bailamchitiet")
public class BaiLamChiTietServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BaiLamChiTietDAO baiLamChiTietDAO;

    public void init() {
        baiLamChiTietDAO = new BaiLamChiTietDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<BaiLamChiTiet> list = baiLamChiTietDAO.getAllBaiLamChiTiet();
        request.setAttribute("listBaiLamChiTiet", list);
        request.getRequestDispatcher("views/bai_lam_chi_tiet.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            int maBaiLam = Integer.parseInt(request.getParameter("maBaiLam"));
            int maCauHoi = Integer.parseInt(request.getParameter("maCauHoi"));
            int maDapAn = Integer.parseInt(request.getParameter("maDapAn"));
            boolean isCorrect = Boolean.parseBoolean(request.getParameter("isCorrect"));

            BaiLamChiTiet blct = new BaiLamChiTiet(0, maBaiLam, maCauHoi, maDapAn, isCorrect);
            baiLamChiTietDAO.addBaiLamChiTiet(blct);
        } else if ("delete".equals(action)) {
            int maChiTiet = Integer.parseInt(request.getParameter("maChiTiet"));
            baiLamChiTietDAO.deleteBaiLamChiTiet(maChiTiet);
        }
        response.sendRedirect("bailamchitiet");
    }
}
