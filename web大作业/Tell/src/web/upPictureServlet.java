package web;

import com.jspsmart.upload.*;
import com.jspsmart.upload.File;
import domain.Picture;
import domain.User;
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
import java.io.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
@WebServlet("/upPictureServlet")
public class upPictureServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = null;
        String fileName = null;
        Picture picture = new Picture();
        UserService service = new UserServiceimpl();

        SmartUpload su = new SmartUpload();
        su.initialize(this.getServletConfig(), request, response);
        //处理上传过程
        try {
            su.upload();
        } catch (ServletException e) {
            // TODO 自动生成的 catch 块
            e.printStackTrace();
        } catch (IOException e) {
            // TODO 自动生成的 catch 块
            e.printStackTrace();
        } catch (SmartUploadException e) {
            // TODO 自动生成的 catch 块
            e.printStackTrace();
        }
        Files fs = su.getFiles();
        com.jspsmart.upload.File f = fs.getFile(0);
        //获取上传的文件名称
        path = System.currentTimeMillis() + f.getFileName();
        try {
            f.saveAs("imgs/" + path);
        } catch (IOException e) {
            // TODO 自动生成的 catch 块
            e.printStackTrace();
        } catch (SmartUploadException e) {
            // TODO 自动生成的 catch 块
            e.printStackTrace();
        }
        String bewrite = request.getParameter("bewrite");
        picture.setBewrite(bewrite);
        picture.setPicturepath(path);
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        int i = u.getId();
        String username = u.getUsername();
        picture.setUid(i);
        picture.setUsername(username);
        Date date1 = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String date = sdf.format(date1);
        picture.setDate(date);

        service.addPicture(picture);
        response.sendRedirect(request.getContextPath() + "/showPersonPicServlet");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
