<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Users</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container mt-5">
        <h1 class="mb-4">Manage Users</h1>
        <form action="manage_users" method="post" class="mb-4">
            <input type="hidden" name="action" value="create">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="role">Role:</label>
                <select id="role" name="role" class="form-control">
                    <option value="teacher">Teacher</option>
                    <option value="agent">Agent</option>
                    <option value="admin">Admin</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Create User</button>
        </form>
        <h2>Activate/Deactivate Users</h2>
        <form action="manage_users" method="post" class="mb-3">
            <input type="hidden" name="action" value="activate">
            <div class="form-group">
                <label for="user_id">User ID:</label>
                <input type="number" id="user_id" name="user_id" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-success">Activate User</button>
        </form>
        <form action="manage_users" method="post">
            <input type="hidden" name="action" value="deactivate">
            <div class="form-group">
                <label for="user_id">User ID:</label>
                <input type="number" id="user_id" name="user_id" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-danger">Deactivate User</button>
        </form>
    </div>
</body>
</html>
