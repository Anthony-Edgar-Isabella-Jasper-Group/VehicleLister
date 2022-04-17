package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
import com.codeup.adlister.models.Vehicle;
import com.codeup.adlister.util.Password;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.CheckSecurityAnswerServlet", urlPatterns = "/security-answer-check")
public class CheckSecurityAnswerServlet extends HttpServlet{

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("forgotUser");
        String answer = request.getParameter("security-answer");

        boolean correctAnswer = Password.check(answer, user.getSecurityAnswer());
        if(correctAnswer){
            request.getRequestDispatcher("/WEB-INF/reset-password.jsp").forward(request, response);
        }else {
            request.getSession().setAttribute("incorrect", true);
            request.getRequestDispatcher("/WEB-INF/forgot-password.jsp").forward(request, response);
            request.getSession().setAttribute("incorrect", false);
        }
    }
}
