<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Update Account</title>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mali" />
        <style>
            body {
                font-family: 'Mali', sans-serif;
            }
        </style>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
            integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
        />
    </head>
    <body>
        <nav class="w3-bar w3-deep-orange">
            <!-- LEFT NAVIGATION -->
            <a href="#" class="w3-bar-item" style="text-decoration: none">
                <i class="fas fa-coffee"></i>
                <b>Saliza Cafe</b>
            </a>

            <!-- RIGHT NAVIGATION -->
            <!-- User Icon - (Change Profile, Logout) -->
            <div class="w3-dropdown-hover w3-right">
                <button class="w3-button w3-deep-orange w3-hover-text-deep-orange w3-hover-white">
                    <i class="fas fa-user"></i>
                    Profile
                </button>
                <div class="w3-dropdown-content w3-bar-block w3-card-4" style="right: 0%">
                    <a href="#" class="w3-bar-item w3-button">Update Profile</a>
                    <a href="#" class="w3-bar-item w3-button">Logout</a>
                </div>
            </div>

            <!-- Cart Button - Open cart -->
            <a href="#" class="w3-bar-item w3-button w3-hover-text-deep-orange w3-hover-white w3-right">
                <i class="fas fa-shopping-cart"></i>
                Cart
            </a>

            <!-- Home Button - (Go to homepage) -->
            <a href="#" class="w3-bar-item w3-button w3-hover-text-deep-orange w3-hover-white w3-right">
                <i class="fas fa-home"></i>
                Home
            </a>
        </nav>

        <!-- Main Content -->
        <main class="w3-container w3-card w3-display-middle w3-padding-large w3-padding-48">
            <!-- User Icon -->
            <div class="w3-center">
                <i class="fas fa-user" style="font-size: 100px"></i>
            </div>

            <h3 class="w3-center">Update Profile</h3>

            <!-- Form -->
            <form action="#" method="post" class="w3-center" style="font-size: 16px; max-width: 500px">
                <input type="text" class="w3-margin-bottom" name="username" placeholder="Username" autocomplete="off" required />
                <input type="text" class="w3-margin-bottom" name="phone" placeholder="Phone" autocomplete="off" required />
                <input type="password" class="w3-margin-bottom" name="old_password" placeholder="Old Password" autocomplete="off" required />
                <input type="password" class="w3-margin-bottom" name="new_password" placeholder="New Password" autocomplete="off" required />
                <input type="text" class="w3-margin-bottom" name="email" placeholder="Email" autocomplete="off" required />

                <!-- Submit button -->
                <div class="w3-margin">
                    <button type="submit" class="w3-button w3-green" style="min-width: 30%">Save Change</button>
                </div>

                <!-- Back to previous page -->
                <div class="w3-margin">
                    <a href="#" class="w3-button w3-red" style="min-width: 30%"> Cancel </a>
                </div>
            </form>
        </main>
    </body>
</html>
