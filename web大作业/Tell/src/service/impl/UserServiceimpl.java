package service.impl;

import dao.UserDao;
import dao.impl.UserDaoimpl;
import domain.*;
import service.UserService;

import java.util.List;

public class UserServiceimpl implements UserService {
    private UserDao dao=new UserDaoimpl();
    @Override
    public void regist(User user) {
        dao.regist(user);
    }

    @Override
    public boolean find(String name) {
        return dao.find(name);
    }

    @Override
    public User login(User user){
        return dao.login(user.getUsername(),user.getPassword());
    }

    @Override
    public List<Picture> findpersonpic(int uid) {
        return dao.findpersonpic(uid);
    }

    @Override
    public void addPicture(Picture picture) {
        dao.addPicture(picture);
    }

    @Override
    public List<Picture> findallpic() {
        return dao.findallpic();
    }

    @Override
    public void deletepic(String id) {
        dao.deletepic(Integer.parseInt(id));
    }

    @Override
    public boolean islike(int id, int uid) {
        Like like=dao.islike(id,uid);
        return like !=null;
    }

    @Override
    public int likecount(int id) {
        return dao.likecount(id);
    }

    @Override
    public int comcount(int id) {
        return dao.comcount(id);
    }

    @Override
    public int addlike(String pid, int uid) {
        return dao.addlike(Integer.parseInt(pid),uid);
    }

    @Override
    public int dellike(String pid, int uid) {
        return dao.dellike(Integer.parseInt(pid),uid);
    }

    @Override
    public boolean isfavour(int id, int uid) {
        Favour favour=dao.isfavour(id,uid);
        return favour !=null;
    }

    @Override
    public void addfavour(String pid, int uid) {
        dao.addfavour(Integer.parseInt(pid),uid);
    }

    @Override
    public void delfavour(String pid, int uid) {
        dao.delfavour(Integer.parseInt(pid),uid);
    }

    @Override
    public List<Picture> findfavourpic(int uid) {
        return dao.findfavourpic(uid);
    }

    @Override
    public Picture findpic(String pid) {
        return dao.findpic(Integer.parseInt(pid));
    }

    @Override
    public List<Comment> findcomment(String pid) {
        return dao.findcomment(Integer.parseInt(pid));
    }

    @Override
    public void addcomment(Comment comment) {
        dao.addcomment(comment);
    }

    @Override
    public void delcommen(String id, String pid) {
        dao.delcommen(Integer.parseInt(id),Integer.parseInt(pid));
    }

    @Override
    public void updatepassword(String password,int uid) {
        dao.updatepassword(password,uid);
    }
}
