package model;

public class MonHoc {
    private int id;
    private String tenMon;

    public MonHoc() {}

    public MonHoc(int id, String tenMon) {
        this.id = id;
        this.tenMon = tenMon;
    }

    // GETTER - SETTER
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getTenMon() { return tenMon; }
    public void setTenMon(String tenMon) { this.tenMon = tenMon; }
}
