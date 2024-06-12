<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Request Print</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container mt-5">
        <h1 class="mb-4">Request Print</h1>
        <form action="request_print" method="post">
            <div class="form-group">
                <label for="subject_id">Subject:</label>
                <select id="subject_id" name="subject_id" class="form-control">
                    <c:forEach var="subject" items="${requestScope.subjects}">
                        <option value="${subject.id}">${subject.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="pdf_document">PDF Document:</label>
                <input type="text" id="pdf_document" name="pdf_document" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="print_date">Print Date:</label>
                <input type="datetime-local" id="print_date" name="print_date" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="num_copies">Number of Copies:</label>
                <input type="number" id="num_copies" name="num_copies" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary">Request Print</button>
        </form>
    </div>
</body>
</html>
