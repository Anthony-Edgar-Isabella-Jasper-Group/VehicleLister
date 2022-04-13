package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
import com.codeup.adlister.models.Vehicle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
public class CreateAdServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = (User) request.getSession().getAttribute("user");
        String year = request.getParameter("editYear");
        String mileage = request.getParameter("editMileage");
        String price = request.getParameter("editPrice");
        if(Validation.isValidShort(year) && Validation.isValidFloat(price) && Validation.isValidInt(mileage)){
            Vehicle ad = new Vehicle(user.getUsername(), user.getEmail(), request.getParameter("make"), request.getParameter("model"), Short.parseShort(request.getParameter("year")), request.getParameter("color"), Float.parseFloat(request.getParameter("price")), Integer.parseInt(request.getParameter("mileage")), request.getParameter("type"), request.getParameter("description"));
            DaoFactory.getAdsDao().insert(ad);
            response.sendRedirect("/");
        }else{
            response.sendRedirect("/");
            request.getSession().setAttribute("invalid", true);
        }
    }
}

