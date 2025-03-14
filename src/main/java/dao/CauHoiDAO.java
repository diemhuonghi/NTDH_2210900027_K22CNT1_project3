package dao;

import model.CauHoi;
import util.DBConnect;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CauHoiDAO {

    // 🔹 Lấy danh sách tất cả câu hỏi
    public List<CauHoi> getAllCauHoi() {
        List<CauHoi> list = new ArrayList<>();
        String query = "SELECT * FROM NTDH_CAU_HOI";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                CauHoi ch = new CauHoi(
                    rs.getInt("id"),
                    rs.getString("NoiDung"),
                    rs.getInt("DoKho"),
                    rs.getInt("DeThiID")
                );
                list.add(ch);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // 🔹 Thêm câu hỏi mới
    public void addCauHoi(CauHoi ch) {
        String query = "INSERT INTO NTDH_CAU_HOI (NoiDung, DoKho, DeThiID) VALUES (?, ?, ?)";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, ch.getNoiDung());
            ps.setInt(2, ch.getDoKho());
            ps.setInt(3, ch.getDeThiID());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public List<CauHoi> getCauHoiByDethi(int deThiID) {
        List<CauHoi> list = new ArrayList<>();
        String query = "SELECT * FROM NTDH_CAU_HOI WHERE deThiID = ?";

        try (Connection conn = DBConnect.getConnection();
            PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, deThiID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CauHoi ch = new CauHoi(
                    rs.getInt("id"),
                    rs.getString("noiDung"),
                    rs.getInt("doKho"),
                    rs.getInt("deThiID")
                );
                list.add(ch);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
    // 🔹 Lấy câu hỏi theo ID
    public CauHoi getCauHoiById(int id) {
        String query = "SELECT * FROM NTDH_CAU_HOI WHERE id = ?";
        CauHoi ch = null;

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                ch = new CauHoi(
                    rs.getInt("id"),
                    rs.getString("NoiDung"),
                    rs.getInt("DoKho"),
                    rs.getInt("DeThiID")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ch;
    }

    // 🔹 Cập nhật câu hỏi
    public void updateCauHoi(CauHoi ch) {
        String query = "UPDATE NTDH_CAU_HOI SET NoiDung = ?, DoKho = ?, DeThiID = ? WHERE id = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, ch.getNoiDung());
            ps.setInt(2, ch.getDoKho());
            ps.setInt(3, ch.getDeThiID());
            ps.setInt(4, ch.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 🔹 Xóa câu hỏi theo ID
    public void deleteCauHoi(int id) {
        String query = "DELETE FROM NTDH_CAU_HOI WHERE id = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
