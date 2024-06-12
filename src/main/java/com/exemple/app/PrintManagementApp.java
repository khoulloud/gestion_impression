package com.exemple.app;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

import com.exemple.dao.SubjectDao;
import com.exemple.dao.UserDao;
import com.exemple.model.Subject;
import com.exemple.model.User;

public class PrintManagementApp {
    public static void main(String[] args) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/print_management?useSSL=false&serverTimezone=UTC&useLegacyDatetimeCode=false";
            Connection connection = DriverManager.getConnection(url, "root", "");

            UserDao userDao = new UserDao(connection);
            User user = userDao.getUserByUsername("admin");
            if (user != null) {
                System.out.println("User: " + user.getUsername() + ", Role: " + user.getRole());
            }

            SubjectDao subjectDao = new SubjectDao(connection);
            List<Subject> subjects = subjectDao.getSubjectsByTeacherId(1);
            for (Subject subject : subjects) {
                System.out.println("Subject: " + subject.getName());
            }

            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
