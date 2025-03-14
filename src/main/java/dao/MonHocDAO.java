package dao;

import model.MonHoc;
import util.DBConnect;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MonHocDAO {
    
    public List<MonHoc> getAllMonHoc() {
        List<MonHoc> list = new ArrayList<>();
        String query = "SELECT * FROM NTDH_MON_HOC";
        
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                MonHoc mh = new MonHoc(
                    rs.getInt("id"),
                    rs.getString("TenMon")
                );
                list.add(mh);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public void addMonHoc(MonHoc mh) {
        String query = "INSERT INTO NTDH_MON_HOC (TenMon) VALUES (?)";
        
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, mh.getTenMon());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void updateMonHoc(MonHoc mh) {
        String query = "UPDATE NTDH_MON_HOC SET TenMon = ? WHERE id = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, mh.getTenMon());
            ps.setInt(2, mh.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public MonHoc getMonHocById(int id) {
        String query = "SELECT * FROM NTDH_MON_HOC WHERE id = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new MonHoc(rs.getInt("id"), rs.getString("TenMon"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void deleteMonHoc(int id) {
        String query = "DELETE FROM NTDH_MON_HOC WHERE id = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
