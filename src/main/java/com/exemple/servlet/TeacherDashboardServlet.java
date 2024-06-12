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
import com.exemple.dao.SubjectDao;
import com.exemple.model.Subject;
import com.exemple.model.User;
import jakarta.servlet.http.HttpSession;

@WebServlet("/teacher_dashboard")
public class TeacherDashboardServlet extends HttpServlet {
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
        if (user != null && "teacher".equals(user.getRole())) {
            SubjectDao subjectDao = new SubjectDao(connection);
            try {
                List<Subject> subjects = subjectDao.getSubjectsByTeacherId(user.getId());
                System.out.println("Retrieved subjects: " + subjects); // Debugging line
                request.setAttribute("subjects", subjects);
                request.getRequestDispatcher("teacher_dashboard.jsp").forward(request, response);
            } catch (SQLException e) {
                e.printStackTrace(); // Debugging line
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