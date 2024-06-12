package com.exemple.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import com.exemple.dao.UserDao;
import com.exemple.model.User;
import jakarta.servlet.http.HttpSession;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
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
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDao userDao = new UserDao(connection);
        try {
            User user = userDao.getUserByUsername(username);
            if (user != null && user.getPassword().equals(password)) {
                HttpSession session = request.getSession();
                ((HttpSession) session).setAttribute("user", user);
                if ("teacher".equals(user.getRole())) {
                    response.sendRedirect("teacher_dashboard.jsp");
                } else if ("agent".equals(user.getRole())) {
                    response.sendRedirect("agent_dashboard.jsp");
                } else if ("admin".equals(user.getRole())) {
                    response.sendRedirect("admin_dashboard.jsp");
                }
            } else {
                response.sendRedirect("login.jsp?error=1");
            }
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
