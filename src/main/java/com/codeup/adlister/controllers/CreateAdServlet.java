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
import java.util.ArrayList;

@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
public class CreateAdServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = (User) request.getSession().getAttribute("user");
        String year = request.getParameter("year");
        String mileage = request.getParameter("mileage");
        String price = request.getParameter("price");
        if (Validation.isValidShort(year) && Validation.isValidFloat(price) && Validation.isValidInt(mileage)) {
            Vehicle ad = new Vehicle(user.getUsername(), user.getEmail(), request.getParameter("make"), request.getParameter("model"), Short.parseShort(request.getParameter("year")), request.getParameter("color"), Float.parseFloat(request.getParameter("price")), Integer.parseInt(request.getParameter("mileage")), request.getParameter("type"), new ArrayList<>(),request.getParameter("description"));
            DaoFactory.getAdsDao().insert(ad);
            response.sendRedirect("/");
        } else {
            response.sendRedirect("/");
            request.getSession().setAttribute("invalid", true);
        }
    }
}

