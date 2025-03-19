package controller;

import dao.GiaoVienDAO;
import model.GiaoVien;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/giaovien")
public class GiaoVienServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private GiaoVienDAO giaoVienDAO = new GiaoVienDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
           throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");

        try {
            if (action == null) {
                listGiaoVien(request, response);
            } else {
                switch (action) {
                    case "edit":
                        showEditForm(request, response);
                        break;
                    case "delete":
                        deleteGiaoVien(request, response);
                        break;
                    case "logout":
                        logout(request, response);
                        break;
                    default:
                        System.out.println("⚠️ Action không hợp lệ: " + action);
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action không hợp lệ!");
                        break;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã xảy ra lỗi hệ thống!");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
           throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");

        try {
            if (action == null || action.equals("add")) {
                insertGiaoVien(request, response);
            } else if (action.equals("update")) {
                updateGiaoVien(request, response);
            } else if (action.equals("login")) {
                login(request, response);
            } else {
                System.out.println("⚠️ Action không hợp lệ: " + action);
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action không hợp lệ!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã xảy ra lỗi hệ thống!");
        }
    }

    // Hiển thị danh sách giáo viên
    private void listGiaoVien(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        List<GiaoVien> danhSachGiaoVien = giaoVienDAO.getAllGiaoVien();
        request.setAttribute("danhSachGiaoVien", danhSachGiaoVien);
        request.getRequestDispatcher("views/giaovien.jsp").forward(request, response);
    }

    // Hiển thị form chỉnh sửa
    private void showEditForm(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        GiaoVien gv = giaoVienDAO.getGiaoVienById(id);
        request.setAttribute("giaoVien", gv);
        request.getRequestDispatcher("views/edit-giaovien.jsp").forward(request, response);
    }

    // Thêm giáo viên
    private void insertGiaoVien(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            String hoTen = request.getParameter("hoTen");
            String taiKhoan = request.getParameter("taiKhoan");
            String matKhau = request.getParameter("matKhau");
            String email = request.getParameter("email");
            boolean trangThai = (request.getParameter("trangThai") != null);

            if (taiKhoan.isEmpty() || matKhau.isEmpty() || email.isEmpty()) {
                request.setAttribute("error", "Vui lòng nhập đầy đủ thông tin!");
                request.getRequestDispatcher("views/giaovien/add.jsp").forward(request, response);
                return;
            }

            if (giaoVienDAO.isUsernameExist(taiKhoan)) {
                request.setAttribute("error", "Tài khoản đã tồn tại!");
                request.getRequestDispatcher("views/giaovien/add.jsp").forward(request, response);
                return;
            }

            GiaoVien gv = new GiaoVien(0, hoTen, taiKhoan, matKhau, email, trangThai);
            giaoVienDAO.addGiaoVien(gv);
            response.sendRedirect("giaovien");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi thêm giáo viên!");
        }
    }

    // Cập nhật giáo viên
    private void updateGiaoVien(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String hoTen = request.getParameter("hoTen");
            String taiKhoan = request.getParameter("taiKhoan");
            String matKhau = request.getParameter("matKhau");
            String email = request.getParameter("email");
            boolean trangThai = (request.getParameter("trangThai") != null);

            GiaoVien gv = new GiaoVien(id, hoTen, taiKhoan, matKhau, email, trangThai);
            giaoVienDAO.updateGiaoVien(gv);
            response.sendRedirect("giaovien");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi cập nhật giáo viên!");
        }
    }

    // Xóa giáo viên
    private void deleteGiaoVien(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        giaoVienDAO.deleteGiaoVien(id);
        response.sendRedirect("giaovien");
    }

    // Đăng nhập
    private void login(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String taiKhoan = request.getParameter("taiKhoan");
        String matKhau = request.getParameter("matKhau");

        GiaoVien gv = giaoVienDAO.login(taiKhoan, matKhau);
        if (gv != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", gv);
            response.sendRedirect("Home/dashboard.jsp");
        } else {
            request.setAttribute("error", "Sai tài khoản hoặc mật khẩu!");
            request.getRequestDispatcher("Home/login.jsp").forward(request, response);
        }
    }

    // Đăng xuất
    private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        if (session != null) {
            session.invalidate();
        }
        System.out.println("🚪 Đăng xuất thành công!");
        response.sendRedirect(request.getContextPath() + "/Home/Index.jsp");
    }
}
