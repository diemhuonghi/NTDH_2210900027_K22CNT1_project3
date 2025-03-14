package controller;

import dao.DeThiDAO;
import model.DeThi;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/dethi")
public class DeThiServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DeThiDAO deThiDAO = new DeThiDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
           throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if (action == null) {
                listDeThi(request, response);
            } else {
                switch (action) {
                    case "edit":
                        showEditForm(request, response);
                        break;
                    case "delete":
                        deleteDeThi(request, response);
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
        String action = request.getParameter("action");

        try {
            if (action == null || action.equals("add")) {
                insertDeThi(request, response);
            } else if (action.equals("update")) {
                updateDeThi(request, response);
            } else {
                System.out.println("⚠️ Action không hợp lệ: " + action);
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action không hợp lệ!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã xảy ra lỗi hệ thống!");
        }
    }

    // 🟢 Hiển thị danh sách đề thi
    private void listDeThi(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        List<DeThi> danhSachDeThi = deThiDAO.getAllDeThi();
        request.setAttribute("danhSachDeThi", danhSachDeThi);
        request.getRequestDispatcher("views/dethi.jsp").forward(request, response);
    }

    // 🟡 Hiển thị form chỉnh sửa
    private void showEditForm(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            System.out.println("🟢 Đang edit đề thi có ID: " + id);

            DeThi dt = deThiDAO.getDeThiById(id);
            if (dt == null) {
                System.out.println("❌ Không tìm thấy đề thi với ID: " + id);
                response.sendRedirect("dethi?error=notfound");
                return;
            }

            request.setAttribute("deThi", dt);
            System.out.println("✅ Chuyển hướng đến edit-dethi.jsp");
            request.getRequestDispatcher("views/edit-dethi.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            System.out.println("⚠️ Lỗi chuyển đổi ID: " + e.getMessage());
            response.sendRedirect("dethi?error=invalidid");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi hệ thống!");
        }
    }

    // 🟠 Thêm đề thi
    private void insertDeThi(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            String tieuDe = request.getParameter("tieuDe");
            String moTa = request.getParameter("moTa");
            int thoiGianThi = Integer.parseInt(request.getParameter("thoiGianThi"));
            int giaoVienID = Integer.parseInt(request.getParameter("giaoVienID"));
            int monHocID = Integer.parseInt(request.getParameter("monHocID"));

            if (tieuDe.isEmpty() || moTa.isEmpty()) {
                request.setAttribute("error", "Vui lòng nhập đầy đủ thông tin!");
                request.getRequestDispatcher("views/dethi/add.jsp").forward(request, response);
                return;
            }

            DeThi dt = new DeThi(0, tieuDe, moTa, thoiGianThi, null, giaoVienID, monHocID);
            deThiDAO.addDeThi(dt);
            response.sendRedirect("dethi");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi thêm đề thi!");
        }
    }

    // 🟢 Cập nhật đề thi
    private void updateDeThi(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String tieuDe = request.getParameter("tieuDe");
            String moTa = request.getParameter("moTa");
            int thoiGianThi = Integer.parseInt(request.getParameter("thoiGianThi"));
            int giaoVienID = Integer.parseInt(request.getParameter("giaoVienID"));
            int monHocID = Integer.parseInt(request.getParameter("monHocID"));

            if (tieuDe.isEmpty() || moTa.isEmpty()) {
                request.setAttribute("error", "Vui lòng nhập đầy đủ thông tin!");
                request.getRequestDispatcher("views/edit-dethi.jsp").forward(request, response);
                return;
            }

            DeThi dt = new DeThi(id, tieuDe, moTa, thoiGianThi, null, giaoVienID, monHocID);
            deThiDAO.updateDeThi(dt);
            response.sendRedirect("dethi");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi cập nhật đề thi!");
        }
    }

    // 🔴 Xóa đề thi
    private void deleteDeThi(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        deThiDAO.deleteDeThi(id);
        response.sendRedirect("dethi");
    }
}
