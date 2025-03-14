package controller;

import dao.HocSinhDAO;
import model.HocSinh;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/hocsinh")
public class HocSinhServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private HocSinhDAO hocSinhDAO = new HocSinhDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");

        try {
            switch (action) {
                case "":
                    listHocSinh(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    deleteHocSinh(request, response);
                    break;
                case "logout":
                    logout(request, response);
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action không hợp lệ!");
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi hệ thống!");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");

        try {
            switch (action) {
                case "add":
                    insertHocSinh(request, response);
                    break;
                case "update":
                    updateHocSinh(request, response);
                    break;
                case "login":
                    login(request, response);
                    break;
                case "register": // ✅ Thêm chức năng đăng ký
                    register(request, response);
                    break;
                case "logout":
                    logout(request, response);
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action không hợp lệ!");
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi hệ thống!");
        }
    }
    

    private void listHocSinh(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<HocSinh> danhSachHocSinh = hocSinhDAO.getAllHocSinh();
        request.setAttribute("danhSachHocSinh", danhSachHocSinh);
        request.getRequestDispatcher("views/hocsinh.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        HocSinh hs = hocSinhDAO.getHocSinhById(id);
        request.setAttribute("hocSinh", hs);
        request.getRequestDispatcher("views/edit-hocsinh.jsp").forward(request, response);
    }

    private void insertHocSinh(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String hoTen = request.getParameter("hoTen");
        String taiKhoan = request.getParameter("taiKhoan");
        String matKhau = request.getParameter("matKhau");
        String email = request.getParameter("email");
        String lopHoc = request.getParameter("lopHoc");
        boolean trangThai = (request.getParameter("trangThai") != null);

        if (taiKhoan.isEmpty() || matKhau.isEmpty() || email.isEmpty()) {
            request.setAttribute("error", "Vui lòng nhập đầy đủ thông tin!");
            request.getRequestDispatcher("views/hocsinh/add.jsp").forward(request, response);
            return;
        }

        if (hocSinhDAO.isUsernameExist(taiKhoan)) {
            request.setAttribute("error", "Tài khoản đã tồn tại!");
            request.getRequestDispatcher("views/hocsinh/add.jsp").forward(request, response);
            return;
        }

        HocSinh hs = new HocSinh(0, hoTen, taiKhoan, matKhau, email, lopHoc, trangThai);
        hocSinhDAO.addHocSinh(hs);
        response.sendRedirect("hocsinh");
    }

    private void updateHocSinh(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String hoTen = request.getParameter("hoTen");
        String taiKhoan = request.getParameter("taiKhoan");
        String matKhau = request.getParameter("matKhau");
        String email = request.getParameter("email");
        String lopHoc = request.getParameter("lopHoc");
        boolean trangThai = (request.getParameter("trangThai") != null);

        HocSinh hs = new HocSinh(id, hoTen, taiKhoan, matKhau, email, lopHoc, trangThai);
        hocSinhDAO.updateHocSinh(hs);
        response.sendRedirect("hocsinh");
    }

    private void deleteHocSinh(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Thiếu ID để xóa học sinh!");
            return;
        }

        try {
            int id = Integer.parseInt(idParam);
            hocSinhDAO.deleteHocSinh(id);
            response.sendRedirect("hocsinh");
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID không hợp lệ!");
        }
    }
    private void register(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String hoTen = request.getParameter("hoTen");
        String taiKhoan = request.getParameter("taiKhoan");
        String matKhau = request.getParameter("matKhau");
        String email = request.getParameter("email");
        String lopHoc = request.getParameter("lopHoc");

        if (hoTen.isEmpty() || taiKhoan.isEmpty() || matKhau.isEmpty() || email.isEmpty() || lopHoc.isEmpty()) {
            request.setAttribute("error", "Vui lòng nhập đầy đủ thông tin!");
            request.getRequestDispatcher("Home/register.jsp").forward(request, response);
            return;
        }

        if (hocSinhDAO.isUsernameExist(taiKhoan)) {
            request.setAttribute("error", "Tài khoản đã tồn tại!");
            request.getRequestDispatcher("Home/register.jsp").forward(request, response);
            return;
        }

        HocSinh hs = new HocSinh(0, hoTen, taiKhoan, matKhau, email, lopHoc, true);
        boolean result = hocSinhDAO.dangKyHocSinh(hs);

        if (result) {
            response.sendRedirect("Home/login-user.jsp?success=true");
        } else {
            request.setAttribute("error", "Đăng ký thất bại, vui lòng thử lại!");
            request.getRequestDispatcher("Home/register.jsp").forward(request, response);
        }
    }


    private void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String taiKhoan = request.getParameter("taiKhoan");
        String matKhau = request.getParameter("matKhau");

        HocSinh hs = hocSinhDAO.login(taiKhoan, matKhau);

        if (hs != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", hs);

            System.out.println("Đăng nhập thành công: " + hs.getTaiKhoan());

            response.sendRedirect("Home/user.jsp");
        } else {
            System.out.println("Đăng nhập thất bại: Sai tài khoản hoặc mật khẩu!");
            request.setAttribute("error", "Sai tài khoản hoặc mật khẩu!");
            request.getRequestDispatcher("Home/login-user.jsp").forward(request, response);
        }
    }


    private void logout(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        response.sendRedirect(request.getContextPath() + "/Home/Index.jsp");
    }

}
