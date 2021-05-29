package domain;

public class Favour {
    private int pid;
    private int uid;
    public int getPid() {
        return pid;
    }

    public int getUid() {
        return uid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    @Override
    public String toString() {
        return "Like{" +
                "pid=" + pid +
                ", uid=" + uid +
                '}';
    }
}
