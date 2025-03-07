package controller;

import dao.GiaoVienDAO;
import model.GiaoVien;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/giaovien")
public class GiaoVienServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private GiaoVienDAO giaoVienDAO = new GiaoVienDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.equals("list")) {
            List<GiaoVien> list = giaoVienDAO.getAll();
            request.setAttribute("listGiaoVien", list);
            request.getRequestDispatcher("views/giaovien.jsp").forward(request, response);
        } else if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            giaoVienDAO.delete(id);
            response.sendRedirect("giaovien");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String hoTen = request.getParameter("hoTen");
        String taiKhoan = request.getParameter("taiKhoan");
        String matKhau = request.getParameter("matKhau");
        String email = request.getParameter("email");
        boolean trangThai = request.getParameter("trangThai") != null;

        GiaoVien gv = new GiaoVien(
                id == null ? 0 : Integer.parseInt(id),
                hoTen, taiKhoan, matKhau, email, trangThai, null
        );

        if (id == null || id.isEmpty()) {
            giaoVienDAO.insert(gv);
        } else {
            giaoVienDAO.update(gv);
        }
        response.sendRedirect("giaovien");
    }
}
