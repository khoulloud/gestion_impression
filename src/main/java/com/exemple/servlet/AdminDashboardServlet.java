package com.exemple.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.exemple.model.User;
import jakarta.servlet.http.HttpSession;


@WebServlet("/admin_dashboard")
public class AdminDashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user != null && "admin".equals(user.getRole())) {
            request.getRequestDispatcher("admin_dashboard.jsp").forward(request, response);
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}
