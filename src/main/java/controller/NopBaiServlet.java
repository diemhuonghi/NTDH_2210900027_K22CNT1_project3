package controller;

import dao.BaiLamDAO;
import dao.CauHoiDAO;
import dao.DapAnDAO;
import dao.BaiLamChiTietDAO;
import model.BaiLam;
import model.BaiLamChiTiet;
import model.CauHoi;
import model.DapAn;
import model.HocSinh;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet("/user/NopBaiServlet")
public class NopBaiServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        HocSinh user = (HocSinh) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login-user.jsp");
            return;
        }

        int deThiID = Integer.parseInt(request.getParameter("deThiID"));
        List<CauHoi> dsCauHoi = new CauHoiDAO().getCauHoiByDethi(deThiID);
        BaiLamDAO baiLamDAO = new BaiLamDAO();
        DapAnDAO dapAnDAO = new DapAnDAO();

        BaiLam baiLam = new BaiLam(0, user.getId(), deThiID, 0, new Date());
        int baiLamID = baiLamDAO.luuBaiLam(baiLam);

        int soCauDung = 0;
        for (CauHoi ch : dsCauHoi) {
            int dapAnID = Integer.parseInt(request.getParameter("cauHoi_" + ch.getId()));
            boolean laDapAnDung = dapAnDAO.kiemTraDapAnDung(dapAnID);
            if (laDapAnDung) soCauDung++;

            BaiLamChiTiet chiTiet = new BaiLamChiTiet(0, baiLamID, ch.getId(), dapAnID);
            baiLamDAO.luuChiTietBaiLam(chiTiet);
        }

        float diem = (soCauDung * 10.0f) / dsCauHoi.size();
        baiLamDAO.capNhatDiem(baiLamID, diem);

        // Lưu điểm vào session
        session.setAttribute("diem", diem);

        response.sendRedirect(request.getContextPath() + "/user/xem-diem.jsp");

    }
}
