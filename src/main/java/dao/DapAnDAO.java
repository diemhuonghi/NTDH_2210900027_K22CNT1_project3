package dao;

import model.DapAn;
import util.DBConnect;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DapAnDAO {
    private Connection conn;

    public DapAnDAO() {
    	try {
            conn = DBConnect.getConnection();
        } catch (Exception e) {
            e.printStackTrace(); // In lỗi nếu không kết nối được
        }
    }

    public List<DapAn> getAllDapAn() {
        List<DapAn> list = new ArrayList<>();
        String query = "SELECT * FROM NTDH_DAP_AN";
        
        try (PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(new DapAn(
                    rs.getInt("MaDA"),
                    rs.getInt("MaCH"),
                    rs.getString("NoiDung"),
                    rs.getBoolean("LaDapAnDung")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public void addDapAn(DapAn da) {
        String query = "INSERT INTO NTDH_DAP_AN (MaCH, NoiDung, LaDapAnDung) VALUES (?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, da.getMaCH());
            ps.setString(2, da.getNoiDung());
            ps.setBoolean(3, da.isLaDapAnDung());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteDapAn(int maDA) {
        String query = "DELETE FROM NTDH_DAP_AN WHERE MaDA = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, maDA);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
