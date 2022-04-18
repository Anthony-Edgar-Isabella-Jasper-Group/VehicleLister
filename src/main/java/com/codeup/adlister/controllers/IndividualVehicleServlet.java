package com.codeup.adlister.controllers;

import javax.servlet.http.HttpServlet;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.dao.Vehicles;
import com.codeup.adlister.models.User;
import com.codeup.adlister.models.Vehicle;
import com.codeup.adlister.util.Password;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.jar.JarOutputStream;

@WebServlet(name = "controllers.IndividualVehicleServlet", urlPatterns = "/vehicle")
public class IndividualVehicleServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String vehicleAdId = request.getParameter("id");
        Vehicle vehicle = DaoFactory.getAdsDao().findByVehicle_id(Integer.parseInt(vehicleAdId));
        request.setAttribute("vehicle", vehicle);
        request.getRequestDispatcher("/WEB-INF/ads/vehicle.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

    }
}
