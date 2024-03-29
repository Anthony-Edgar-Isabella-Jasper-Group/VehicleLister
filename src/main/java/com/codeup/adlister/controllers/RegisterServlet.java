package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");
        String securityQuestion = request.getParameter("security-question");
        String securityAnswer = request.getParameter("security-answer");
        // validate input
        boolean inputHasErrors = username.isEmpty()
            || email.isEmpty()
            || password.isEmpty()
            || (! password.equals(passwordConfirmation));

        if (inputHasErrors) {
            request.getSession().setAttribute("registerUsername", username);
            request.getSession().setAttribute("registerEmail", email);
            response.sendRedirect("/register");
            return;
        } else {
            request.removeAttribute("registerUsername");
            request.removeAttribute("registerEmail");
        }

        // create and save a new user
        User user = new User(username, email, password, securityQuestion, securityAnswer);
        DaoFactory.getUsersDao().insert(user);
        response.sendRedirect("/login");
    }
}
