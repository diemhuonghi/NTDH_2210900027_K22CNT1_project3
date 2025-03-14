package model;

public class GiaoVien {
    private int id;
    private String hoTen;
    private String taiKhoan;
    private String matKhau;
    private String email;
    private boolean trangThai;
    private String role;

    public GiaoVien() {}

    public GiaoVien(int id, String hoTen, String taiKhoan, String matKhau, String email, boolean trangThai) {
        this.id = id;
        this.hoTen = hoTen;
        this.taiKhoan = taiKhoan;
        this.matKhau = matKhau;
        this.email = email;
        this.trangThai = trangThai;
    }

    // GETTER - SETTER
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getHoTen() { return hoTen; }
    public void setHoTen(String hoTen) { this.hoTen = hoTen; }
    public String getTaiKhoan() { return taiKhoan; }
    public void setTaiKhoan(String taiKhoan) { this.taiKhoan = taiKhoan; }
    public String getMatKhau() { return matKhau; }
    public void setMatKhau(String matKhau) { this.matKhau = matKhau; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getRole() {return role;}
    public void setRole(String role){this.role = role;}
    public boolean isTrangThai() { return trangThai; }
    public void setTrangThai(boolean trangThai) { this.trangThai = trangThai; }
}
