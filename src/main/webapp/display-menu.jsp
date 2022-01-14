<%--
  Created by IntelliJ IDEA.
  User: NADHIRAH
  Date: 15/1/2022
  Time: 3:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>DISPLAY MENU</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <style>
        * {
            box-sizing: border-box;
        }

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
        img {
            width:300px;
            height:230px;
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
        .btnaddtocart {
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 8px 13px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 2px 95px;
            cursor: pointer;
            border-radius: 4px;

        }
        .container {
            position: relative;
            text-align: center;
            color: white;
        }
    </style>
</head>
<body>
<!-- MAIN (Center website) -->
<div class="container">
    <img src="slideshow1.jpg" alt="Snow" style="width:100%; height:400px;">
    <h1>Cafe SalizaEja Enterprise</h1>
</div>

<div class="main">

    <a href="updateMenu.jsp">update menu</a>
    <a href="cart.jsp">cart</a>

    <h2 style="text-align: center; font-weight: bold; ;">WELCOME TO SALIZAEJA CAFE</h2>
    <h4 style="text-align: center;">All our menu are very delicious and recommended to the student and the price very comfordable to all students.</h4>
    <br><br>

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
                <img src="nasi-lemak-featured-1024x576.jpg" alt="Mountains">
                <h4>Nasi Lemak Ayam</h4>
                <p>RM 6.00</p>
                <br>
                <button class="btnaddtocart" value="AddToCart"> Add to Cart</button>
            </div>
        </div>

        <div class="column Food">
            <div class="content">
                <img src="mee_goreng.jpg" alt="Lights" >
                <h4>Mee Goreng</h4>
                <p>RM 5.00</p>
                <br>
                <button class="btnaddtocart" value="AddToCart"> Add to Cart</button>
            </div>
        </div>

        <div class="column Food">
            <div class="content">
                <img src="nasi goreng kampung.jpg" alt="Nature" >
                <h4>Nasi Goreng Kampung</h4>
                <p>RM 5.50</p>
                <br>
                <button class="btnaddtocart" value="AddToCart"> Add to Cart</button>
            </div>
        </div>

        <div class="column Food">
            <div class="content">
                <img src="kuey teow.jpeg" alt="Nature" >
                <h4> Kuew Teow Lakna</h4>
                <p>RM 7.00</p>
                <br>
                <button class="btnaddtocart" value="AddToCart"> Add to Cart</button>
            </div>
        </div>

        <div class="column Food">
            <div class="content">
                <img src="laksa penang.jpg" alt="Nature" >
                <h4>Laksa Penang</h4>
                <p>RM 5.00</p>
                <br>
                <button class="btnaddtocart" value="AddToCart"> Add to Cart</button>
            </div>
        </div>

        <div class="column Food">
            <div class="content">
                <img src="tomyam.jpg" alt="Nature" >
                <h4>Tomyam</h4>
                <p>RM 5.00</p>
                <br>
                <button class="btnaddtocart" value="AddToCart"> Add to Cart</button>
            </div>
        </div>

        <div class="column Beverage">
            <div class="content">
                <img src="teh o ice lemon.jpg" alt="Car" >
                <h4>Ice Lemon Tea</h4>
                <p>RM 3.00</p>
                <br>
                <button class="btnaddtocart" value="AddToCart"> Add to Cart</button>
            </div>
        </div>

        <div class="column Beverage">
            <div class="content">
                <img src="teh o ice.jpg" alt="Car" >
                <h4>Teh O Ice</h4>
                <p>RM 1.70</p>
                <br>
                <button class="btnaddtocart" value="AddToCart"> Add to Cart</button>
            </div>
        </div>


        <div class="column Beverage">
            <div class="content">
                <img src="teh ice.jpg" alt="Car">
                <h4>Teh Ice</h4>
                <p>RM 3.50</p>
                <br>
                <button class="btnaddtocart" value="AddToCart"> Add to Cart</button>
            </div>
        </div>

        <div class="column Beverage">
            <div class="content">
                <img src="sirap.jpg" alt="Car" >
                <h4>Sirap</h4>
                <p>RM 2.00</p>
                <br>
                <button class="btnaddtocart" value="AddToCart"> Add to Cart</button>
            </div>
        </div>

        <div class="column Beverage">
            <div class="content">
                <img src="sirap bandung.jpg" alt="Car">
                <h4>Sirap Bandung</h4>
                <p>RM 3.50</p>
                <br>
                <button class="btnaddtocart" value="AddToCart"> Add to Cart</button>
            </div>
        </div>

        <div class="column Beverage">
            <div class="content">
                <img src="ice coffee.jpg" alt="Car" >
                <h4>Ice Coffee</h4>
                <p>RM 3.00</p>
                <br>
                <button class="btnaddtocart" value="AddToCart"> Add to Cart</button>
            </div>
        </div>

        <div class="column Dessert">
            <div class="content">
                <img src="ice cream coklat.jpg" alt="Car" >
                <h4>Ice Cream Chocolate </h4>
                <p>RM 3.50</p>
                <br>
                <button class="btnaddtocart" value="AddToCart"> Add to Cart</button>
            </div>
        </div>

        <div class="column Dessert">
            <div class="content">
                <img src="ice cream strawberry.jpg" alt="Car" >
                <h4>Ice Cream Strawberry</h4>
                <p>RM 3.00</p>
                <br>
                <button class="btnaddtocart" value="AddToCart"> Add to Cart</button>
            </div>
        </div>

        <div class="column Dessert">
            <div class="content">
                <img src="ice cream vanila.jpg" alt="Car" >
                <h4>Ice Cream Vanilla</h4>
                <p>RM 5.00</p>
                <br>
                <button class="btnaddtocart" value="AddToCart"> Add to Cart</button>
            </div>
        </div>
        <!-- END GRID -->
    </div>

    <!-- END MAIN -->
</div>

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
