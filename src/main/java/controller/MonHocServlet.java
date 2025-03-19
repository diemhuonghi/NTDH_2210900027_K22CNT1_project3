package controller;

import dao.MonHocDAO;
import model.MonHoc;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/monhoc")
public class MonHocServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MonHocDAO monHocDAO = new MonHocDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");

        try {
            if (action == null) {
                listMonHoc(request, response);
            } else {
                switch (action) {
                    case "edit":
                        showEditForm(request, response);
                        break;
                    case "delete":
                        deleteMonHoc(request, response);
                        break;
                    default:
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "⚠️ Action không hợp lệ!");
                        break;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "❌ Lỗi hệ thống!");
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
                insertMonHoc(request, response);
            } else if (action.equals("update")) {
                updateMonHoc(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "⚠️ Action không hợp lệ!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "❌ Lỗi hệ thống!");
        }
    }

    // 🟢 Hiển thị danh sách môn học
    private void listMonHoc(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<MonHoc> danhSachMonHoc = monHocDAO.getAllMonHoc();
        request.setAttribute("danhSachMonHoc", danhSachMonHoc);
        request.getRequestDispatcher("views/monhoc.jsp").forward(request, response);
    }

    // 🟡 Hiển thị form chỉnh sửa môn học
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        MonHoc monHoc = monHocDAO.getMonHocById(id);
        request.setAttribute("monHoc", monHoc);
        request.getRequestDispatcher("views/edit_monhoc.jsp").forward(request, response);
    }

    // 🟠 Thêm mới môn học
    private void insertMonHoc(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String tenMon = request.getParameter("tenMon");

        if (tenMon.isEmpty()) {
            request.setAttribute("error", "⚠️ Vui lòng nhập tên môn học!");
            request.getRequestDispatcher("views/add_monhoc.jsp").forward(request, response);
            return;
        }

        MonHoc mh = new MonHoc(0, tenMon);
        monHocDAO.addMonHoc(mh);
        response.sendRedirect("monhoc");
    }

    // 🟢 Cập nhật môn học
    private void updateMonHoc(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String tenMon = request.getParameter("tenMon");

        if (tenMon.isEmpty()) {
            request.setAttribute("error", "⚠️ Vui lòng nhập tên môn học!");
            request.getRequestDispatcher("views/edit_monhoc.jsp").forward(request, response);
            return;
        }

        MonHoc mh = new MonHoc(id, tenMon);
        monHocDAO.updateMonHoc(mh);
        response.sendRedirect("monhoc");
    }

    // 🔴 Xóa môn học
    private void deleteMonHoc(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        monHocDAO.deleteMonHoc(id);
        response.sendRedirect("monhoc");
    }
}
