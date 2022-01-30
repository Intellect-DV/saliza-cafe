<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 30/1/2022
  Time: 1:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device=width, initial-scale=1.0">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/Payment.css">
<title>Payment Method</title>
</head>
<body>

<div class="stage w3-center" style="height: 100px">
    <button class="btn" onclick="payment('credit')"><i class="fab fa-cc-visa"></i></button>
    <button class="btn " onclick="payment('master')"><i class="fab fa-cc-mastercard"></i></button>
    <button class="btn" onclick="payment('fpx')"><i class="fas fa-file-invoice-dollar"></i></button>
</div>

<div id="credit" class="pay">

    <div class="container">
        <form action="">
            <h3> Visa Card </h3>
            <div class="inputBox">
                <span>Card Number</span>
                <input type="text" maxlength="16" class="card-number-input">
            </div>
            <div class="inputBox">
                <span>Card Holder</span>
                <input type="text" class="card-holder-input">
            </div>
            <div class="flexbox">
                <div class="inputBox">
                    <span>Expiration mm</span>
                    <select name="" id="month" class="month-input">
                        <option value="month" selected disabled>month</option>
                        <option value="01">01</option>
                        <option value="01">02</option>
                        <option value="01">03</option>
                        <option value="01">04</option>
                        <option value="01">05</option>
                        <option value="01">06</option>
                        <option value="01">07</option>
                        <option value="01">08</option>
                        <option value="01">09</option>
                        <option value="01">10</option>
                        <option value="01">11</option>
                        <option value="01">12</option>
                    </select>
                </div>
                <div class="inputBox">
                    <span>Expiration yy</span>
                    <select name="" id="year" class="year-input">
                        <option value="year" selected disabled>month</option>
                        <option value="2022">2022</option>
                        <option value="2023">2023</option>
                        <option value="2024">2024</option>
                        <option value="2025">2025</option>
                        <option value="2026">2026</option>
                        <option value="2027">2027</option>
                        <option value="2028">2028</option>
                        <option value="2029">2029</option>
                        <option value="2030">2030</option>
                    </select>
                </div>
                <div class="inputBox">
                    <span>cvv</span>
                    <input type="text" maxlength="4" class="cvv-input">
                </div>
            </div>
            <input type="submit" value="Submit Payment >>>" class="submit-btn" onclick="myButton()">
        </form>
    </div>
</div>
<div id="master" class="pay" style="display:none">
    <div class="container">
        <form action="">
            <h3> Master Card </h3>
            <div class="inputBox">
                <span>Card Number</span>
                <input type="text" maxlength="16" class="card-number-input">
            </div>
            <div class="inputBox">
                <span>Card Holder</span>
                <input type="text" class="card-holder-input">
            </div>
            <div class="flexbox">
                <div class="inputBox">
                    <span>Expiration mm</span>
                    <select name="" id="month1" class="month-input">
                        <option value="month" selected disabled>month</option>
                        <option value="01">01</option>
                        <option value="01">02</option>
                        <option value="01">03</option>
                        <option value="01">04</option>
                        <option value="01">05</option>
                        <option value="01">06</option>
                        <option value="01">07</option>
                        <option value="01">08</option>
                        <option value="01">09</option>
                        <option value="01">10</option>
                        <option value="01">11</option>
                        <option value="01">12</option>
                    </select>
                </div>
                <div class="inputBox">
                    <span>Expiration yy</span>
                    <select name="" id="year1" class="year-input">
                        <option value="year" selected disabled>month</option>
                        <option value="2022">2022</option>
                        <option value="2023">2023</option>
                        <option value="2024">2024</option>
                        <option value="2025">2025</option>
                        <option value="2026">2026</option>
                        <option value="2027">2027</option>
                        <option value="2028">2028</option>
                        <option value="2029">2029</option>
                        <option value="2030">2030</option>
                    </select>
                </div>
                <div class="inputBox">
                    <span>cvv</span>
                    <input type="text" maxlength="4" class="cvv-input">
                </div>
            </div>
            <input type="submit" value="Submit Payment >>>" class="submit-btn" onclick="myButton()">
        </form>
    </div>
</div>
<div id="fpx" class="pay" style="display:none">
    <div class="container">
        <form action="" class="form-fpx">
            <h3> Online Banking </h3>
            <label class="cont"><img class="image"  src="img/maybank.jpg">
                <input type="radio" checked="checked" name="radio">
                <span class="checkmark"></span>
            </label>
            <label class="cont"><img class="image" src="img/BankIslam.png">
                <input type="radio" name="radio">
                <span class="checkmark"></span>
            </label>
            <label class="cont"><img class="image" src="img/BSN.png">
                <input type="radio" name="radio">
                <span class="checkmark"></span>
            </label>
            <label class="cont"><img class="image" src="img/affinbank.png">
                <input type="radio" name="radio">
                <span class="checkmark"></span>
            </label>
            <label class="cont"><img class="image" src="img/RHB.png">
                <input type="radio" name="radio">
                <span class="checkmark"></span>
            </label>
            <label class="cont"><img class="image" src="img/cimb.png">
                <input type="radio" name="radio">
                <span class="checkmark"></span>
            </label>
            <input type="submit" value="Submit Payment >>>" class="submit-btn" onclick="myButton()">
        </form>
    </div>
</div>

<script>
    function myButton() {
        alert("Your payment has been completed successfully.");
    }
</script>
<script>
    function payment(iconName) {
        var i;

        var x = document.getElementsByClassName("pay");
        for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
        }
        document.getElementById(iconName).style.display = "block";
    }
</script>
</body>
</html>
