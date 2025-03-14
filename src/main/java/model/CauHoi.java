package model;

public class CauHoi {
    private int id;
    private String noiDung;
    private int doKho;
    private int deThiID;

    public CauHoi() {}

    public CauHoi(int id, String noiDung, int doKho, int deThiID) {
        this.id = id;
        this.noiDung = noiDung;
        this.doKho = doKho;
        this.deThiID = deThiID;
    }

    // GETTER - SETTER
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getNoiDung() { return noiDung; }
    public void setNoiDung(String noiDung) { this.noiDung = noiDung; }
    public int getDoKho() { return doKho; }
    public void setDoKho(int doKho) { this.doKho = doKho; }
    public int getDeThiID() { return deThiID; }
    public void setDeThiID(int deThiID) { this.deThiID = deThiID; }
}
