package dao.impl;

import dao.UserDao;
import domain.*;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import util.JDBCUtils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class UserDaoimpl implements UserDao {
    private JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());
    @Override
    public boolean find(String name) {
        try {
            String sql = "select * from user where username= ?";
            User user = template.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), name);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public void regist(User user) {
        if(user.getBirthday().length()==0)
        {
            Date date1 = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String date= sdf.format(date1);
            user.setBirthday(date);
        }
        String sql="insert into user(username,password,birthday,sex,telephone,email,registime) values(?,?,?,?,?,?,?)";
        template.update(sql,user.getUsername(),
                user.getPassword(),
                user.getBirthday(),
                user.getSex(),
                user.getTelephone(),
                user.getEmail(),
                user.getRegistime()
        );
    }

    @Override
    public User login(String username, String password) {
        try {
            String sql = "select * from user where username = ? and password = ?";
            User user = template.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), username, password);
            return user;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<Picture> findpersonpic(int uid) {
        String sql="select *from pictures where uid = ?";
        List<Picture> imgs=template.query(sql, new BeanPropertyRowMapper<Picture>(Picture.class),uid);
        return imgs;
    }

    @Override
    public void addPicture(Picture p) {
        String sql="insert into pictures(bewrite,picturepath,comcount,likecount,uid,username,date) values(?,?,?,?,?,?,?)";
        template.update(sql,p.getBewrite(),
                        p.getPicturepath(),
                        0,0,p.getUid(),p.getUsername(),p.getDate()
                        );
    }

    @Override
    public List<Picture> findallpic() {
        String sql="select *from pictures";
        List<Picture> imgs=template.query(sql, new BeanPropertyRowMapper<Picture>(Picture.class));
        return imgs;
    }

    @Override
    public void deletepic(int id) {
        String sql="delete from pictures where id= ?";
        String sql1="delete from likes where pid= ?";
        String sql2="delete from favour where id=?";
        template.update(sql,id);
        template.update(sql1,id);
        template.update(sql2,id);
    }

    @Override
    public Like islike(int id, int uid) {
        Like like=null;
        try{
        String sql="select *from likes where pid= ? and uid = ?";
        like=template.queryForObject(sql, new BeanPropertyRowMapper<Like>(Like.class),id,uid);
        } catch (DataAccessException e)
        {
        }
        return like;
    }

    @Override
    public int likecount(int id) {
        String sql="select count(*) from likes where pid=?";
        int i=template.queryForObject(sql,Integer.class,id);

        return i;
    }

    @Override
    public int comcount(int id) {
        String sql="select count(*) from comments where pid=?";
        int i=template.queryForObject(sql,Integer.class,id);
        return i;
    }

    @Override
    public int addlike(int pid, int uid) {
        String sql="insert into likes(pid,uid) values(?,?)";
        String sql2="update pictures set likecount =likecount+1 where id=?";
        template.update(sql,pid,uid);
        template.update(sql2,pid);
        String sql3="select likecount from pictures where id=?";
        int count=template.queryForObject(sql3,Integer.class,pid);
        return count;
    }

    @Override
    public int dellike(int pid, int uid) {
        String sql="delete from likes where pid= ? and uid= ?";
        template.update(sql,pid,uid);
        String sql2="update pictures set likecount =likecount-1 where id=?";
        template.update(sql2,pid);
        String sql3="select likecount from pictures where id=?";
        int count=template.queryForObject(sql3,Integer.class,pid);
        return count;
    }

    @Override
    public Favour isfavour(int id, int uid) {
        Favour favour=null;
        try{
            String sql="select *from favour where id= ? and uid = ?";
            favour=template.queryForObject(sql, new BeanPropertyRowMapper<Favour>(Favour.class),id,uid);
        } catch (DataAccessException e)
        {
            e.printStackTrace();
        }
        return favour;
    }

    @Override
    public void addfavour(int pid, int uid) {
        String sql="select *from pictures where id= ?";
        Picture pic=template.queryForObject(sql, new BeanPropertyRowMapper<Picture>(Picture.class),pid);
        Date date1 = new Date();

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String date= sdf.format(date1);
        String sql1="insert into favour(id,bewrite,picturepath,comcount,likecount,uid,date) values(?,?,?,?,?,?,?)";
        template.update(sql1,pid,pic.getBewrite(),pic.getPicturepath(),pic.getComcount(),pic.getLikecount(),uid,date);
    }

    @Override
    public void delfavour(int pid, int uid) {
        String sql="delete from favour where id= ? and uid= ?";
        template.update(sql,pid,uid);
    }

    @Override
    public List<Picture> findfavourpic(int uid) {
        String sql="select *from favour where uid= ?";
        List<Picture> imgs=template.query(sql, new BeanPropertyRowMapper<Picture>(Picture.class),uid);
        return imgs;
    }

    @Override
    public Picture findpic(int id) {
        try {
            String sql = "select * from pictures where id=?";
            Picture pic = template.queryForObject(sql, new BeanPropertyRowMapper<Picture>(Picture.class),id);
            return pic;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<Comment> findcomment(int pid) {
        String sql="select *from comments where pid = ?";
        List<Comment> comment=template.query(sql, new BeanPropertyRowMapper<Comment>(Comment.class),pid);
        return comment;
    }

    @Override
    public void addcomment(Comment c) {
        String sql="insert into comments(pid,uid,comment,date,username) values(?,?,?,?,?)";
        template.update(sql,c.getPid(),c.getUid(),c.getComment(),
                c.getDate(),c.getUsername()
        );
        String sql2="update pictures set comcount =comcount+1 where id=?";
        template.update(sql2,c.getPid());
    }

    @Override
    public void delcommen(int id, int pid) {
        String sql="delete from comments where id= ?";
        template.update(sql,id);
        String sql2="update pictures set comcount =comcount-1 where id=?";
        template.update(sql2,pid);
    }

    @Override
    public void updatepassword(String password,int uid) {
        String sql="update user set password =? where id=?";
        template.update(sql,password,uid);
    }
}
