package dao;

import model.BaiLamChiTiet;
import util.DBConnect;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BaiLamChiTietDAO {
    private Connection conn;

    public BaiLamChiTietDAO() {
    	try {
            conn = DBConnect.getConnection();
        } catch (Exception e) {
            e.printStackTrace(); // In lỗi nếu không kết nối được
        }
    }

    public List<BaiLamChiTiet> getAllBaiLamChiTiet() {
        List<BaiLamChiTiet> list = new ArrayList<>();
        String query = "SELECT * FROM NTDH_BAI_LAM_CHI_TIET";

        try (PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(new BaiLamChiTiet(
                    rs.getInt("MaChiTiet"),
                    rs.getInt("MaBaiLam"),
                    rs.getInt("MaCauHoi"),
                    rs.getInt("MaDapAn"),
                    rs.getBoolean("IsCorrect")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public void addBaiLamChiTiet(BaiLamChiTiet blct) {
        String query = "INSERT INTO NTDH_BAI_LAM_CHI_TIET (MaBaiLam, MaCauHoi, MaDapAn, IsCorrect) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, blct.getMaBaiLam());
            ps.setInt(2, blct.getMaCauHoi());
            ps.setInt(3, blct.getMaDapAn());
            ps.setBoolean(4, blct.isCorrect());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteBaiLamChiTiet(int maChiTiet) {
        String query = "DELETE FROM NTDH_BAI_LAM_CHI_TIET WHERE MaChiTiet = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, maChiTiet);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
