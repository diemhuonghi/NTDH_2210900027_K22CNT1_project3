package dao;

import model.BaiLam;
import model.BaiLamChiTiet;
import util.DBConnect;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BaiLamDAO {

    // 🟢 Lấy tất cả bài làm
    public List<BaiLam> getAllBaiLam() {
        List<BaiLam> list = new ArrayList<>();
        String query = "SELECT * FROM NTDH_BAI_LAM";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                BaiLam bl = new BaiLam(
                    rs.getInt("id"),
                    rs.getInt("HocSinhID"),
                    rs.getInt("DeThiID"),
                    rs.getFloat("Diem"),
                    rs.getTimestamp("ThoiGianNop")
                );
                list.add(bl);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // 🟠 Lấy bài làm theo ID
    public BaiLam getBaiLamById(int id) {
        String query = "SELECT * FROM NTDH_BAI_LAM WHERE id = ?";
        
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new BaiLam(
                    rs.getInt("id"),
                    rs.getInt("HocSinhID"),
                    rs.getInt("DeThiID"),
                    rs.getFloat("Diem"),
                    rs.getTimestamp("ThoiGianNop")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // 🔵 Thêm bài làm
    public void addBaiLam(BaiLam bl) {
        String query = "INSERT INTO NTDH_BAI_LAM (HocSinhID, DeThiID, Diem, ThoiGianNop) VALUES (?, ?, ?, CURRENT_TIMESTAMP)";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, bl.getHocSinhID());
            ps.setInt(2, bl.getDeThiID());
            ps.setFloat(3, bl.getDiem());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public int luuBaiLam(BaiLam baiLam) {
        String query = "INSERT INTO NTDH_BAI_LAM (hocSinhID, deThiID, diem, thoiGianNop) VALUES (?, ?, ?, ?)";
        int baiLamID = -1;
        try (Connection conn = DBConnect.getConnection();
        PreparedStatement ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, baiLam.getHocSinhID());
            ps.setInt(2, baiLam.getDeThiID());
            ps.setFloat(3, baiLam.getDiem());
            ps.setTimestamp(4, new Timestamp(baiLam.getThoiGianNop().getTime()));

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    baiLamID = rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return baiLamID;
    }
    public void capNhatDiem(int baiLamID, float diem) {
        String query = "UPDATE NTDH_BAI_LAM SET diem = ? WHERE id = ?";
        try (Connection conn = DBConnect.getConnection();
        PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setFloat(1, diem);
            ps.setInt(2, baiLamID);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 🟡 Sửa bài làm
    public void updateBaiLam(BaiLam bl) {
        String query = "UPDATE NTDH_BAI_LAM SET HocSinhID = ?, DeThiID = ?, Diem = ?, ThoiGianNop = ? WHERE id = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, bl.getHocSinhID());
            ps.setInt(2, bl.getDeThiID());
            ps.setFloat(3, bl.getDiem());
            ps.setDate(4, new java.sql.Date(bl.getThoiGianNop().getTime()));
            ps.setInt(5, bl.getId());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void luuChiTietBaiLam(BaiLamChiTiet chiTiet) {
        String query = "INSERT INTO NTDH_BAI_LAM_CHI_TIET (baiLamID, cauHoiID, dapAnID) VALUES (?, ?, ?)";
        try  (Connection conn = DBConnect.getConnection();
        PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, chiTiet.getBaiLamID());
            ps.setInt(2, chiTiet.getCauHoiID());
            ps.setInt(3, chiTiet.getDapAnID());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    // 🔴 Xóa bài làm
    public void deleteBaiLam(int id) {
        String query = "DELETE FROM NTDH_BAI_LAM WHERE id = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
