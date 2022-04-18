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

@WebServlet(name = "controllers.ForgotPasswordServlet", urlPatterns = "/forgot-password")
public class ForgotPasswordServlet extends HttpServlet{

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String email = request.getParameter("userEmailForPassword");
        User user = DaoFactory.getUsersDao().findByEmail(email);
        if(user != null){
            request.getSession().setAttribute("forgotUser", user);
            request.getSession().setAttribute("securityQuestion", user.getSecurityQuestion());
            request.getRequestDispatcher("/WEB-INF/forgot-password.jsp").forward(request, response);
        }else {
            request.getSession().setAttribute("message", "There is no user with that email.");
            request.getSession().setAttribute("username", "");
            request.getSession().setAttribute("alert", true);
            response.sendRedirect("/login");
        }




    }
}
