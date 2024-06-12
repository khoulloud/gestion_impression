package com.exemple.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.exemple.dao.PrintRequestDao;
import com.exemple.model.PrintRequest;
import com.exemple.model.User;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;

@SuppressWarnings("serial")
@WebServlet("/request_print")
public class PrintRequestServlet extends HttpServlet {
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
        HttpSession session = request.getSession();
        User user = (User) ((HttpSession) session).getAttribute("user");
        if (user != null && "teacher".equals(user.getRole())) {
            int subjectId = Integer.parseInt(request.getParameter("subject_id"));
            String pdfDocument = request.getParameter("pdf_document");
            String printDateStr = request.getParameter("print_date");
            int numCopies = Integer.parseInt(request.getParameter("num_copies"));

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            try {
                java.util.Date printDate = dateFormat.parse(printDateStr);
                LocalDateTime localDateTime = printDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();

                PrintRequest printRequest = new PrintRequest();
                printRequest.setTeacherId(user.getId());
                printRequest.setSubjectId(1);
                printRequest.setPdfDocument(pdfDocument);
                printRequest.setPrintDate(localDateTime);
                printRequest.setNumCopies(numCopies);

                PrintRequestDao printRequestDao = new PrintRequestDao(connection);
                printRequestDao.addPrintRequest(printRequest);

                response.sendRedirect("teacher_dashboard.jsp");
            } catch (ParseException | SQLException e) {
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
