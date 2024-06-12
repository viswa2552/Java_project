<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Registration</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
   
    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: Arial, sans-serif;
            background-image: url("images/bcg1.jpg");
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
            <h2 class="card-title">Registration</h2>
            <div class="error-message">
                <% 
                    String errorMessage = (String) request.getAttribute("status");
                    if (errorMessage != null && errorMessage.equals("succes")) {
                %>
                Registration failed. Please try again.
                <% } %>
            </div>
            <form method="post" action="RegisterServlet">
            
            
              <div class="mb-3">
                    <label for="FirstName" class="form-label">First Name</label>
                    <input type="text" class="form-control" id="username" name="firstName" required>
                </div>
                
                 <div class="mb-3">
                    <label for="lastName" class="form-label">Last Name</label>
                    <input type="text" class="form-control" id="lastName" name="lastName" required>
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label">Email:</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                
                <div class="mb-3">
                    <label for="password" class="form-label">Password:</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                        
                <div class="mb-3">
                    <label for="contact" class="form-label">Contact:</label>
                    <input type="contact" class="form-control" id="contact" name="contact" required>
                </div>
                
                <button type="submit" class="btn btn-primary">Register</button>
            </form>
            <p class="mt-3">Already have an account? <a href="login.jsp">Login</a></p>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>



<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript">
   
    var status = "<%= (String) request.getAttribute("status") %>";
    if (status === "success") {
        Swal.fire({
            icon: 'success',
            title: 'Registration Successful',
            text: 'You have successfully registered!',
        }).then((result) => {
           
            if (result.isConfirmed) {
                window.location.href = "login.jsp";
            }
        });
    }
</script>


</body>
</html>
