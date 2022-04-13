package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
import com.codeup.adlister.models.Vehicle;
import com.mysql.cj.Session;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "controllers.EditVehicleServlet", urlPatterns = "/edit-vehicle")
public class EditVehicleServlet extends HttpServlet{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/profile").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = (User) request.getSession().getAttribute("user");
        String id = request.getParameter("editVehicleID");
        long longID = Long.parseLong(id);
        String year = request.getParameter("editYear");
        String mileage = request.getParameter("editMileage");
        String price = request.getParameter("editPrice");
       if(Validation.isValidShort(year) && Validation.isValidFloat(price) && Validation.isValidInt(mileage)){
           Vehicle ad = new Vehicle(Long.parseLong(request.getParameter("editVehicleID")), request.getParameter("editUsername"), request.getParameter("editEmail"), request.getParameter("editMake"), request.getParameter("editModel"), Short.parseShort(request.getParameter("editYear")), request.getParameter("editColor"), Float.parseFloat(request.getParameter("editPrice")), Integer.parseInt(request.getParameter("editMileage")), request.getParameter("editType"), request.getParameter("editDescription"));
           DaoFactory.getAdsDao().edit(ad);
           response.sendRedirect("/profile");
       }else{
           response.sendRedirect("/profile");
           request.getSession().setAttribute("invalid", true);
       }
    }

}









//@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
//public class CreateAdServlet extends HttpServlet {
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        User user = (User) request.getSession().getAttribute("user");
//        String year = request.getParameter("editYear");
//        String mileage = request.getParameter("editMileage");
//        String price = request.getParameter("editPrice");
//        if(Validation.isValidShort(year) && Validation.isValidFloat(price) && Validation.isValidInt(mileage)){
//            Vehicle ad = new Vehicle(Long.parseLong(request.getParameter("editVehicleID")), request.getParameter("editUsername"), request.getParameter("editEmail"), request.getParameter("editMake"), request.getParameter("editModel"), Short.parseShort(request.getParameter("editYear")), request.getParameter("editColor"), Float.parseFloat(request.getParameter("editPrice")), Integer.parseInt(request.getParameter("editMileage")), request.getParameter("editType"), request.getParameter("editDescription"));
//            DaoFactory.getAdsDao().edit(ad);
//            response.sendRedirect("/");
//        }else{
//            response.sendRedirect("/");
//            request.getSession().setAttribute("invalid", true);
//        }
//    }
//}
