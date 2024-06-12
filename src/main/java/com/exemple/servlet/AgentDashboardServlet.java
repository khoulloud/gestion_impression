package com.exemple.servlet;

import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.exemple.dao.TaskDao;
import com.exemple.model.Task;
import com.exemple.model.User;
import jakarta.servlet.http.HttpSession;


@WebServlet("/agent_dashboard")
public class AgentDashboardServlet extends HttpServlet {
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user != null && "agent".equals(user.getRole())) {
            TaskDao taskDao = new TaskDao(connection);
            try {
                List<Task> tasks = taskDao.getTasksByAgentId(user.getId());
                request.setAttribute("tasks", tasks);
                request.getRequestDispatcher("agent_dashboard.jsp").forward(request, response);
            } catch (SQLException e) {
                throw new ServletException(e);
            }
        } else {
            response.sendRedirect("login.jsp");
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
