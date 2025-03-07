package dao;

import model.CauHoi;
import util.DBConnect;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CauHoiDAO {
    private Connection conn;

    public CauHoiDAO() {
    	try {
            conn = DBConnect.getConnection();
        } catch (Exception e) {
            e.printStackTrace(); // In lỗi nếu không kết nối được
        }
    }

    // Lấy danh sách tất cả câu hỏi
    public List<CauHoi> getAllCauHoi() {
        List<CauHoi> list = new ArrayList<>();
        String query = "SELECT * FROM NTDH_CAU_HOI";
        try (PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(new CauHoi(
                    rs.getInt("MaCauHoi"),
                    rs.getString("NoiDung"),
                    rs.getInt("MaDe"),
                    rs.getInt("DoKho")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Thêm câu hỏi
    public void addCauHoi(CauHoi ch) {
        String query = "INSERT INTO NTDH_CAU_HOI (NoiDung, MaDe, DoKho) VALUES (?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, ch.getNoiDung());
            ps.setInt(2, ch.getMaDe());
            ps.setInt(3, ch.getDoKho());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Xóa câu hỏi
    public void deleteCauHoi(int maCauHoi) {
        String query = "DELETE FROM NTDH_CAU_HOI WHERE MaCauHoi = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, maCauHoi);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Lấy câu hỏi theo ID
    public CauHoi getCauHoiById(int maCauHoi) {
        String query = "SELECT * FROM NTDH_CAU_HOI WHERE MaCauHoi = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, maCauHoi);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new CauHoi(
                    rs.getInt("MaCauHoi"),
                    rs.getString("NoiDung"),
                    rs.getInt("MaDe"),
                    rs.getInt("DoKho")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Cập nhật câu hỏi
    public void updateCauHoi(CauHoi ch) {
        String query = "UPDATE NTDH_CAU_HOI SET NoiDung = ?, MaDe = ?, DoKho = ? WHERE MaCauHoi = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, ch.getNoiDung());
            ps.setInt(2, ch.getMaDe());
            ps.setInt(3, ch.getDoKho());
            ps.setInt(4, ch.getMaCauHoi());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
