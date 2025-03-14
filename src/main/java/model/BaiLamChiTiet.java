package model;

public class BaiLamChiTiet {
    private int id;
    private int baiLamID;
    private int cauHoiID;
    private int dapAnID;

    public BaiLamChiTiet() {}

    public BaiLamChiTiet(int id, int baiLamID, int cauHoiID, int dapAnID) {
        this.id = id;
        this.baiLamID = baiLamID;
        this.cauHoiID = cauHoiID;
        this.dapAnID = dapAnID;
    }

    // GETTER - SETTER
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getBaiLamID() { return baiLamID; }
    public void setBaiLamID(int baiLamID) { this.baiLamID = baiLamID; }
    public int getCauHoiID() { return cauHoiID; }
    public void setCauHoiID(int cauHoiID) { this.cauHoiID = cauHoiID; }
    public int getDapAnID() { return dapAnID; }
    public void setDapAnID(int dapAnID) { this.dapAnID = dapAnID; }
}
