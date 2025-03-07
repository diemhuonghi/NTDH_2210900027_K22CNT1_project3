// DAO: DeThiDAO.java
package dao;

import model.DeThi;
import util.DBConnect;
import java.sql.*;
import java.util.*;

public class DeThiDAO {
    private Connection conn;
    
    public DeThiDAO() {
    	 try {
             conn = DBConnect.getConnection();
         } catch (Exception e) {
             e.printStackTrace(); // In lỗi nếu không kết nối được
         }
     }
    
    public List<DeThi> getAllDeThi() {
        List<DeThi> list = new ArrayList<>();
        String query = "SELECT * FROM NTDH_DE_THI";
        
        try (PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new DeThi(
                    rs.getInt("MaDe"),
                    rs.getString("TenDe"),
                    rs.getInt("MaMH"),
                    rs.getBoolean("TrangThai")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public void addDeThi(DeThi de) {
        String query = "INSERT INTO NTDH_DE_THI (TenDe, MaMH, TrangThai) VALUES (?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, de.getTenDe());
            ps.setInt(2, de.getMaMH());
            ps.setBoolean(3, de.isTrangThai());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void deleteDeThi(int maDe) {
        String query = "DELETE FROM NTDH_DE_THI WHERE MaDe = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, maDe);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}