package model;

public class DapAn {
    private int id;
    private int cauHoiID;
    private String noiDung;
    private boolean dapAnDung;

    public DapAn() {}

    public DapAn(int id, int cauHoiID, String noiDung, boolean dapAnDung) {
        this.id = id;
        this.cauHoiID = cauHoiID;
        this.noiDung = noiDung;
        this.dapAnDung = dapAnDung;
    }

    // GETTER - SETTER
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getCauHoiID() { return cauHoiID; }
    public void setCauHoiID(int cauHoiID) { this.cauHoiID = cauHoiID; }
    public String getNoiDung() { return noiDung; }
    public void setNoiDung(String noiDung) { this.noiDung = noiDung; }
    public boolean isDapAnDung() { return dapAnDung; }
    public void setDapAnDung(boolean dapAnDung) { this.dapAnDung = dapAnDung; }
}
