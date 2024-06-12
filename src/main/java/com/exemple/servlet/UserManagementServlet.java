package com.exemple.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


import com.exemple.dao.UserDao;
import com.exemple.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/manage_users")
public class UserManagementServlet extends HttpServlet {
    private Connection connection;

    @Override
    public void init() throws ServletException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/print_management", "root", "");
        } catch (ClassNotFoundException | SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        UserDao userDao = new UserDao(connection);

        try {
            if ("create".equals(action)) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String role = request.getParameter("role");

                User user = new User();
                user.setUsername(username);
                user.setPassword(password);
                user.setRole(role);

                userDao.addUser(user);
            } else if ("activate".equals(action)) {
                int userId = Integer.parseInt(request.getParameter("user_id"));
                userDao.activateUser(userId);
            } else if ("deactivate".equals(action)) {
                int userId = Integer.parseInt(request.getParameter("user_id"));
                userDao.deactivateUser(userId);
            }

            response.sendRedirect("admin_dashboard.jsp");
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    public void destroy() {
        try {
            if (connection != null) {
				connection.close();
			}
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
