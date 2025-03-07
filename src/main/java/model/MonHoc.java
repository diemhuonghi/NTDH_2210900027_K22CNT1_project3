package model;

public class MonHoc {
    private int maMH;
    private String tenMH;
    private boolean trangThai;

    public MonHoc(int maMH, String tenMH, boolean trangThai) {
        this.maMH = maMH;
        this.tenMH = tenMH;
        this.trangThai = trangThai;
    }

    public int getMaMH() {
        return maMH;
    }

    public void setMaMH(int maMH) {
        this.maMH = maMH;
    }

    public String getTenMH() {
        return tenMH;
    }

    public void setTenMH(String tenMH) {
        this.tenMH = tenMH;
    }

    public boolean isTrangThai() {
        return trangThai;
    }

    public void setTrangThai(boolean trangThai) {
        this.trangThai = trangThai;
    }
}
