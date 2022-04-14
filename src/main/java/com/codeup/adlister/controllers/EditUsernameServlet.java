package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.models.Vehicle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.EditUsernameServlet", urlPatterns = "/edit-username")
public class EditUsernameServlet extends HttpServlet{

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = (User) request.getSession().getAttribute("user");
        String newUsername = request.getParameter("newUsername");


        User updatedUser = DaoFactory.getUsersDao().editUsername(user, newUsername);
        request.getSession().setAttribute("user", updatedUser);
        response.sendRedirect("/profile");
    }
}
