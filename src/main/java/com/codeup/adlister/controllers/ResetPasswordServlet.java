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

@WebServlet(name = "controllers.ResetPasswordServlet", urlPatterns = "/reset-password")

public class ResetPasswordServlet extends HttpServlet{

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        User user = (User) request.getSession().getAttribute("user");
        String newPassword = request.getParameter("resetPassword");
        String confirmNewPassword = request.getParameter("confirmResetPassword");
        if(newPassword.equals(confirmNewPassword)){
            DaoFactory.getUsersDao().editPassword(user, newPassword);
            request.getSession().setAttribute("message", "Your password has been reset");
            request.getSession().setAttribute("reset", true);
            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
            request.getSession().setAttribute("reset", false);
        }else {
            request.getSession().setAttribute("message", "Your password must match");
            request.getSession().setAttribute("reset", true);
            request.getRequestDispatcher("/WEB-INF/reset-password.jsp").forward(request, response);
            request.getSession().setAttribute("reset", false);
        }
    }
}
