package controller;

import dao.CauHoiDAO;
import model.CauHoi;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/cauhoi")
public class CauHoiServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CauHoiDAO cauHoiDAO = new CauHoiDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");

        try {
            if (action == null) {
                listCauHoi(request, response);
            } else {
                switch (action) {
                    case "edit":
                        showEditForm(request, response);
                        break;
                    case "delete":
                        deleteCauHoi(request, response);
                        break;
                    default:
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action không hợp lệ!");
                        break;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi hệ thống!");
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
                insertCauHoi(request, response);
            } else if (action.equals("update")) {
                updateCauHoi(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action không hợp lệ!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi hệ thống!");
        }
    }

    // 🟢 Hiển thị danh sách câu hỏi
    private void listCauHoi(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<CauHoi> danhSachCauHoi = cauHoiDAO.getAllCauHoi();
        request.setAttribute("danhSachCauHoi", danhSachCauHoi);
        request.getRequestDispatcher("views/cauhoi.jsp").forward(request, response);
    }

    // 🟡 Hiển thị form chỉnh sửa
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            CauHoi ch = cauHoiDAO.getCauHoiById(id);

            if (ch == null) {
                response.sendRedirect("cauhoi?error=notfound");
                return;
            }

            request.setAttribute("cauHoi", ch);
            request.getRequestDispatcher("views/edit-cauhoi.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendRedirect("cauhoi?error=invalidid");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi hệ thống!");
        }
    }

    // 🟠 Thêm câu hỏi
    private void insertCauHoi(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String noiDung = request.getParameter("noiDung");
            int doKho = Integer.parseInt(request.getParameter("doKho"));
            int deThiID = Integer.parseInt(request.getParameter("deThiID"));

            if (noiDung.isEmpty()) {
                request.setAttribute("error", "Nội dung không được để trống!");
                request.getRequestDispatcher("views/cauhoi.jsp").forward(request, response);
                return;
            }

            CauHoi ch = new CauHoi(0, noiDung, doKho, deThiID);
            cauHoiDAO.addCauHoi(ch);
            response.sendRedirect("cauhoi");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi thêm câu hỏi!");
        }
    }

    // 🟢 Cập nhật câu hỏi
    private void updateCauHoi(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String noiDung = request.getParameter("noiDung");
            int doKho = Integer.parseInt(request.getParameter("doKho"));
            int deThiID = Integer.parseInt(request.getParameter("deThiID"));

            if (noiDung.isEmpty()) {
                request.setAttribute("error", "Nội dung không được để trống!");
                request.getRequestDispatcher("views/edit-cauhoi.jsp").forward(request, response);
                return;
            }

            CauHoi ch = new CauHoi(id, noiDung, doKho, deThiID);
            cauHoiDAO.updateCauHoi(ch);
            response.sendRedirect("cauhoi");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi cập nhật câu hỏi!");
        }
    }

    // 🔴 Xóa câu hỏi
    private void deleteCauHoi(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            cauHoiDAO.deleteCauHoi(id);
            response.sendRedirect("cauhoi");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi xóa câu hỏi!");
        }
    }
}
