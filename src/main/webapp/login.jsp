

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Include SweetAlert library -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    
    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: Arial, sans-serif;
            background-image: url("images/bcg1.jpg");
            /* Full height */
            height: 100%;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .card {
           max-width: 400px;
    padding: 20px;
    background: rgba(255, 255, 255, 0.2);
    backdrop-filter: blur(10px);
    border-radius: 10px; 
}
        }
        .card-title {
            text-align: center;
        }
        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 10px;
        }
        .mt-3 a {
            color: white; 
        }
    </style>
</head>
<body>

<div class="container">
    <div class="card">
        <div class="card-body">
            <h2 class="card-title">Login</h2>
            <div class="error-message">
                <% 
                    String errorMessage = (String) request.getAttribute("status");
                    if (errorMessage != null && errorMessage.equals("failed")) {
                %>
                Username and password incorrect.
                <% } %>
            </div>
            <form method="post" action="LoginServlet">
                <div class="mb-3">
                    <label for="email" class="form-label">Username:</label>
                    <input type="text" class="form-control" id="email" name="email" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password:</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <button type="submit" class="btn btn-primary">Login</button>
            </form>
            <p class="mt-3">Don't have an account? <a href="registration.jsp">Register</a></p>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>


<script type="text/javascript">
 
    var status = "<%= (String) request.getAttribute("status") %>";
    if (status === "failed") {
        Swal.fire({
            icon: 'error',
            title: 'Login Failed',
            text: 'Username and password incorrect',
        });
    }
</script>

</body>
</html>
