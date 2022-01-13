<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 14/1/2022
  Time: 12:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        *
        {
            box-sizing: border-box;
        }

        body
        {
            background-color: #f1f1f1;
            padding: 20px;
            font-family: Arial;
        }

        /* Center website */
        .main
        {
            max-width: 1000px;
            margin: auto;
        }

        h1
        {
            font-size: 50px;
            word-break: break-all;
        }

        .row
        {
            margin: 8px -16px;
        }

        /* Add padding BETWEEN each column */
        .row,
        .row > .column
        {
            padding: 8px;
        }

        /* Create four equal columns that floats next to each other */
        .column
        {
            float: left;
            width: 25%;
        }

        /* Clear floats after rows */
        .row:after
        {
            content: "";
            display: table;
            clear: both;
        }

        /* Content */
        .content
        {
            background-color: white;
            padding: 10px;
        }

        /* Responsive layout - makes a two column-layout instead of four columns */
        @media screen and (max-width: 900px)
        {
            .column
            {
                width: 50%;
            }
        }

        /* Responsive layout - makes the two columns stack on top of each other instead of next to each other */
        @media screen and (max-width: 600px)
        {
            .column {
                width: 100%;
            }
        }
        .btn
        {
            background-color: DodgerBlue; /* Blue background */
            border: none; /* Remove borders */
            color: white; /* White text */
            padding: 10px 14px; /* Some padding */
            font-size: 12px; /* Set a font size */
            cursor: pointer; /* Mouse pointer on hover */
        }

        /* Darker background on mouse-over */
        .btn:hover
        {
            background-color: RoyalBlue;
        }
    </style>
</head>
<body>
<h1><%= "SalizaEja Cafe Crew" %>
</h1>
<br/>
<%--<a href="hello-servlet">Hello Servlet</a>--%>

<div class="main">
    <div class="row">
        <div class="column">
            <div class="content">
                <img src="workericon.jpg" style="width:100%">
                <h3>MANAGER</h3>
                <p>Name : </p>
                <button class="btn"><i class="fa fa-trash"></i> Delete</button>
            </div>
        </div>
        <div class="column">
            <div class="content">
                <img src="workericon.jpg" style="width:100%">
                <h3>COOKER</h3>
                <p>Name : </p>
                <button class="btn"><i class="fa fa-trash"></i> Delete</button>
            </div>
        </div>
        <div class="column">
            <div class="content">
                <img src="workericon.jpg" style="width:100%">
                <h3>CASHIER</h3>
                <p>Name : </p>
                <button class="btn"><i class="fa fa-trash"></i> Delete</button>
            </div>
        </div>
        <div class="column">
            <div class="content">
                <img src="workericon.jpg" style="width:100%">
                <h3>KITCHEN ASSIST</h3>
                <p>Name : </p>
                <button class="btn"><i class="fa fa-trash"></i> Delete</button>
            </div>
        </div>
        <!-- END GRID -->
    </div>
</div>
</body>
</html>
