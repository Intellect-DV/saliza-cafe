<%--
  Created by IntelliJ IDEA.
  User: NADHIRAH
  Date: 15/1/2022
  Time: 3:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Menu</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <style>
        body {
            background-color: white;
            font-family: Arial, "Times New Roman";
        }
        * {
            box-sizing: border-box;
        }
        /* Center website */
        .main {
            max-width: 1000px;
            margin: auto;
        }

        h1 {
            font-size: 50px;
            word-break: break-all;

        }

        .row {
            margin: 10px -16px;
        }

        /* Add padding BETWEEN each column */
        .row,
        .row > .column {
            padding: 8px;
        }

        /* Create three equal columns that floats next to each other */
        .column {
            float: left;
            width: 33.33%;
            display: none; /* Hide all elements by default */
        }

        /* Clear floats after rows */
        .row:after {
            content: "";
            display: table;
            clear: both;
        }

        /* Content */
        .content {
            background-color: white;
            padding: 10px;
            border: 2px solid #f1f1f1;
        }

        /* The "show" class is added to the filtered elements */
        .show {
            display: block;
        }

        /* Style the buttons */
        .btn {
            border: none;
            outline: none;
            padding: 12px 16px;
            background-color: white;
            cursor: pointer;
            border-radius: 5px;


        }

        .btn:hover {
            background-color: #ddd;
        }

        .btn.active {
            background-color: #FFA500;
            color: white;
        }
        /* The popup form - hidden by default */
        .form-popup {
            display: none;
            bottom: 0;
            right: 50px;
            border: 3px solid #f1f1f1;
            z-index: 9;
        }
        .submit {
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 8px 18px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 4px;
        }
        .btnCancel {
            background-color: red;
            border: none;
            color: white;
            padding: 8px 18px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 4px;
        }
        form {
            border: 2px solid #0a0e0a;
            border-radius: 5px;
            background-color:  rgba(198, 164, 198, 0.73);
            padding: 20px;
        }
        input[type=text] {
            width: 50%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .container {
            position: relative;
            text-align: center;
            color: white;
        }
    </style>
</head>
<body>



<div class="container">
    <img src="slideshow1.jpg" alt="Snow" style="width:100%;height:50%;">
    <h1>Cafe SalizaEja Enterprise</h1>
</div>
<div class="main">

    <a href="index.jsp">homepage</a>
    <a href="cart.jsp">cart</a>

    <h2 style="text-align: center; font-weight: bold; ;">OUR MENU</h2>
    <h4 style="text-align: center;">All our menu are very delicious and recommended to the student and the price very comfordable to all students.</h4>
    <br><br>

    <button style="float:right;" class="submit" onclick="openCreateForm()">Create Menu</button><br>

    <div style=" border:2px solid #FFA500; margin: auto;width: 60%;padding: 10px;cursor: pointer;" id="myBtnContainer">
        <button class="btn active" onclick="filterSelection('All Menu')"> All Menu</button>
        <button class="btn" onclick="filterSelection('Food')"> Food</button>
        <button class="btn" onclick="filterSelection('Beverage')"> Beverage</button>
        <button class="btn" onclick="filterSelection('Dessert')"> Dessert</button>
        <button class="btn" onclick="filterSelection('Others')"> Other</button>
    </div>

    <!-- Menu List Grid -->
    <div class="row">

        <div class="column Food">
            <div class="content">
                <img src="nasi goreng kampung.jpg" alt="NGK" style="width:100%; height:40%">
                <h4>Nasi Goreng Kampung</h4>
                <p>RM 6.00</p>
                <br>
                <button class="submit" onclick="openUpdateForm()">Update</button>
                <button class="btnCancel"><i class="fa fa-trash"></i> Delete</button>
            </div>
        </div>

        <div class="column Food">
            <div class="content">
                <img src="nasi-lemak-featured-1024x576.jpg" alt="NLA" style="width:100%; height:40%">
                <h4>Nasi Lemak Ayam</h4>
                <p>RM 6.00</p>
                <br>
                <button class="submit" onclick="openUpdateForm()">Update</button>
                <button class="btnCancel"><i class="fa fa-trash"></i> Delete</button>
            </div>
        </div>

        <div class="column Food">
            <div class="content">
                <img src="laksa penang.jpg" alt="LP" style="width:100%; height:40%">
                <h4>Laksa Penang</h4>
                <p>RM 5.50</p>
                <br>
                <button class="submit" onclick="openUpdateForm()">Update</button>
                <button class="btnCancel"><i class="fa fa-trash"></i> Delete</button>
            </div>
        </div>

        <div class="column Food">
            <div class="content">
                <img src="nasi goreng kampung.jpg" alt="NGK" style="width:100%; height:40%">
                <h4>Nasi Goreng Kampung</h4>
                <p>RM 6.00</p>
                <br>
                <button class="submit" onclick="openUpdateForm()">Update</button>
                <button class="btnCancel"><i class="fa fa-trash"></i> Delete</button>
            </div>
        </div>

        <div class="column Food">
            <div class="content">
                <img src="nasi-lemak-featured-1024x576.jpg" alt="NLA" style="width:100%; height:40%">
                <h4>Nasi Lemak Ayam</h4>
                <p>RM 6.00</p>
                <br>
                <button class="submit" onclick="openUpdateForm()">Update</button>
                <button class="btnCancel"><i class="fa fa-trash"></i> Delete</button>
            </div>
        </div>

        <div class="column Food">
            <div class="content">
                <img src="laksa penang.jpg" alt="LP" style="width:100%; height:40%">
                <h4>Laksa Penang</h4>
                <p>RM 5.50</p>
                <br>
                <button class="submit" onclick="openUpdateForm()">Update</button>
                <button class="btnCancel"><i class="fa fa-trash"></i> Delete</button>
            </div>
        </div>

    </div>
</div>

<div class="form-popup" id="CreateMenuForm">
    <form style=" text-align: center; width: 50%; margin: auto;" name="CreateMenuForm" method="post" action="updateMenu.jsp">
        <h1>Create Menu</h1>
        <br>

        Menu Picture  :  <div style=" border: 2px solid #0a0e0a;text-align: center; width: 40%;height: 20%; margin: auto;"> <br><input type="file" id="myFile" name="filename"><br><br></div> <br>
        Menu Id       :  <br><input type="text" name="myName" placeholder="Your name"> <br>
        Menu Name     :  <br><input type="text" name="myAge" placeholder="Your age"> <br>
        Price         :  <br><input type="text" name="myHobbies" placeholder="Your hobby"> <br>
        Description   :  <br><input type="text" name="myBirthDate" placeholder="dd-mm-yyyy"> <br>

        <br>

        <button type="submit" class="submit" value="Submit"> Confirm</button>
        <button type="btnCancel" class="btnCancel" onclick="closeForm()"> Cancel</button>

    </form><br>
</div>

<div class="form-popup" id="UpdateForm">
    <form style=" text-align: center; width: 50%; margin: auto;" name="updateMenuForm" method="post" action="updateMenu.jsp">
        <h1>Update Menu</h1>
        <br>

        Menu Picture  :  <div style=" border: 2px solid #0a0e0a;text-align: center; width: 40%;height: 20%; margin: auto;"> <br><input type="file" id="myFile" name="filename"><br><br></div> <br>
        Menu Id       :  <br><input type="text" name="myName" placeholder="Your name"> <br>
        Menu Name     :  <br><input type="text" name="myAge" placeholder="Your age"> <br>
        Price         :  <br><input type="text" name="myHobbies" placeholder="Your hobby"> <br>
        Description   :  <br><input type="text" name="myBirthDate" placeholder="dd-mm-yyyy"> <br>

        <br>

        <button type="submit" class="submit" value="Submit"> Update</button>
        <button type="btnCancel" class="btnCancel" onclick="closeForm()"> Cancel</button>

    </form><br>
</div>

<script>
    function openUpdateForm() {
        document.getElementById("UpdateForm").style.display = "block";
    }

    function closeUpdateForm() {
        document.getElementById("UpdateForm").style.display = "none";
    }

    function openCreateForm() {
        document.getElementById("CreateMenuForm").style.display = "block";
    }

    function closeCreateForm() {
        document.getElementById("CreateMenuForm").style.display = "none";
    }
</script>

<%! String getMessage()
{
    return "Session Created in declaration";
}
%>

<%
    String mytext = request.getParameter("myName");

    if(mytext == null)
    {

    }
    else
    {
        session.setAttribute("MyName", request.getParameter("myName"));
        session.setAttribute("MyAge", request.getParameter("myAge"));
        session.setAttribute("MyHobbies", request.getParameter("myHobbies"));
        session.setAttribute("MyBirthDate", request.getParameter("myBirthDate"));
        session.setAttribute("MyFavColor", request.getParameter("myFavColor"));



    }
%>


<script>
    filterSelection("All Menu")
    function filterSelection(c) {
        var x, i;
        x = document.getElementsByClassName("column");
        if (c == "All Menu") c = "";
        for (i = 0; i < x.length; i++) {
            w3RemoveClass(x[i], "show");
            if (x[i].className.indexOf(c) > -1) w3AddClass(x[i], "show");
        }
    }

    function w3AddClass(element, name) {
        var i, arr1, arr2;
        arr1 = element.className.split(" ");
        arr2 = name.split(" ");
        for (i = 0; i < arr2.length; i++) {
            if (arr1.indexOf(arr2[i]) == -1) {element.className += " " + arr2[i];}
        }
    }

    function w3RemoveClass(element, name) {
        var i, arr1, arr2;
        arr1 = element.className.split(" ");
        arr2 = name.split(" ");
        for (i = 0; i < arr2.length; i++) {
            while (arr1.indexOf(arr2[i]) > -1) {
                arr1.splice(arr1.indexOf(arr2[i]), 1);
            }
        }
        element.className = arr1.join(" ");
    }


    // Add active class to the current button (highlight it)
    var btnContainer = document.getElementById("myBtnContainer");
    var btns = btnContainer.getElementsByClassName("btn");
    for (var i = 0; i < btns.length; i++) {
        btns[i].addEventListener("click", function(){
            var current = document.getElementsByClassName("active");
            current[0].className = current[0].className.replace(" active", "");
            this.className += " active";
        });
    }
</script>
</body>
</html>
