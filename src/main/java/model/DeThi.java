// Model: DeThi.java
package model;

public class DeThi {
    private int maDe;
    private String tenDe;
    private int maMH;
    private boolean trangThai;

    public DeThi(int maDe, String tenDe, int maMH, boolean trangThai) {
        this.maDe = maDe;
        this.tenDe = tenDe;
        this.maMH = maMH;
        this.trangThai = trangThai;
    }

    public int getMaDe() { return maDe; }
    public void setMaDe(int maDe) { this.maDe = maDe; }
    
    public String getTenDe() { return tenDe; }
    public void setTenDe(String tenDe) { this.tenDe = tenDe; }
    
    public int getMaMH() { return maMH; }
    public void setMaMH(int maMH) { this.maMH = maMH; }
    
    public boolean isTrangThai() { return trangThai; }
    public void setTrangThai(boolean trangThai) { this.trangThai = trangThai; }
}