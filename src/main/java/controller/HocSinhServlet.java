package controller;

import dao.HocSinhDAO;
import model.HocSinh;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

@WebServlet("/hocsinh")
public class HocSinhServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private HocSinhDAO hocSinhDAO = new HocSinhDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.equals("list")) {
            List<HocSinh> list = hocSinhDAO.getAllHocSinh();
            request.setAttribute("listHocSinh", list);
            request.getRequestDispatcher("views/hocsinh.jsp").forward(request, response);
        } else if (action.equals("delete")) {
            int maHS = Integer.parseInt(request.getParameter("maHS"));
            hocSinhDAO.deleteHocSinh(maHS);
            response.sendRedirect("hocsinh");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String maHS = request.getParameter("maHS");
        String hoTen = request.getParameter("hoTen");
        String taiKhoan = request.getParameter("taiKhoan");
        String matKhau = request.getParameter("matKhau");
        String email = request.getParameter("email");
        boolean trangThai = request.getParameter("trangThai") != null;

        HocSinh hs = new HocSinh(
                maHS == null ? 0 : Integer.parseInt(maHS),
                hoTen, taiKhoan, matKhau, email, trangThai, new Timestamp(System.currentTimeMillis())
        );

        
        response.sendRedirect("hocsinh");
    }
}
