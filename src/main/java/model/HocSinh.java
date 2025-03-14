package model;

public class HocSinh {
    private int id;
    private String hoTen;
    private String taiKhoan;
    private String matKhau;
    private String email;
    private String lopHoc;
    private boolean trangThai;

    public HocSinh() {}

    public HocSinh(int id, String hoTen, String taiKhoan, String matKhau, String email, String lopHoc, boolean trangThai) {
        this.id = id;
        this.hoTen = hoTen;
        this.taiKhoan = taiKhoan;
        this.matKhau = matKhau;
        this.email = email;
        this.lopHoc = lopHoc;
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
    public String getLopHoc() { return lopHoc; }
    public void setLopHoc(String lopHoc) { this.lopHoc = lopHoc; }
    public boolean isTrangThai() { return trangThai; }
    public void setTrangThai(boolean trangThai) { this.trangThai = trangThai; }
}
