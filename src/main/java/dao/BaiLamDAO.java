package dao;

import model.BaiLam;
import util.DBConnect;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BaiLamDAO {
    private Connection conn;

    public BaiLamDAO() {
    	try {
            conn = DBConnect.getConnection();
        } catch (Exception e) {
            e.printStackTrace(); // In lỗi nếu không kết nối được
        }
    }

    public List<BaiLam> getAllBaiLam() {
        List<BaiLam> list = new ArrayList<>();
        String query = "SELECT * FROM NTDH_BAI_LAM";
        
        try (PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(new BaiLam(
                    rs.getInt("MaBaiLam"),
                    rs.getInt("MaHS"),
                    rs.getInt("MaDe"),
                    rs.getTimestamp("ThoiGianNop"),
                    rs.getFloat("Diem")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public void addBaiLam(BaiLam baiLam) {
        String query = "INSERT INTO NTDH_BAI_LAM (MaHS, MaDe, ThoiGianNop, Diem) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, baiLam.getMaHS());
            ps.setInt(2, baiLam.getMaDe());
            ps.setTimestamp(3, baiLam.getThoiGianNop());
            ps.setFloat(4, baiLam.getDiem());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteBaiLam(int maBaiLam) {
        String query = "DELETE FROM NTDH_BAI_LAM WHERE MaBaiLam = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, maBaiLam);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
