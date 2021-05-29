package web;

import domain.Picture;
import domain.User;
import org.apache.commons.beanutils.BeanUtils;
import service.UserService;
import service.impl.UserServiceimpl;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

@WebServlet("/showPersonPicServlet")
public class showPersonPicServlet extends HttpServlet {
    UserService service=new UserServiceimpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        User u=(User)session.getAttribute("user");
        int uid=u.getId();
        List<Picture> pic=service.findpersonpic(uid);
        for(Picture i:pic)
        {
            i.setPicturepath("imgs/"+i.getPicturepath());
            i.setLikeflag(islike(i.getId(),request));
            i.setComcount(comcount(i.getId()));
        }
        System.out.println(pic);
        request.setAttribute("pic",pic);
        request.setAttribute("perpiclength",pic.size());
        request.getRequestDispatcher("/person.jsp").forward(request,response);
    }
    public boolean islike(int id,HttpServletRequest request){
        User user=(User)request.getSession().getAttribute("user");
        int uid=user.getId();
        boolean flag=service.islike(id,uid);
        return flag;
    }
    public int likecount(int id)
    {
        return service.likecount(id);
    }
    public int comcount(int id)
    {
        return service.comcount(id);
    }
    @Override
    protected void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
