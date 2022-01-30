<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cart | SalizaEja Cafe</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/cart.css">
</head>
<body>

<div id="cart" class="w3-container shop">
    <h1 class="w3-center">CART</h1>
    <table class="center">
        <thead>
        <tr>
            <th>NAME</th>
            <th>PRICE</th>
            <th>QUANTITY</th>
            <th> </th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td></td>
            <td></td>
            <td>
                <div class="wrapper">
                    <span class="minus">-</span>
                    <span class="num">01</span>
                    <span class="plus">+</span>
                </div>
            </td>
            <td>
                <button class="w3-button w3-large w3-red">Delete</button>
            </td>
        </tr>
        </tbody>
        <tr class="tr-line">
            <td colspan="3"><h2 style="text-align: right">Total - RM100</h2></td>
        </tr>
        <tr class="tr-line">
            <td><a href="display-menu.jsp" class="btn-shopping"><<< Continue Shopping</a></td>
            <td colspan="3"><a href="Payment.jsp" class="btn-checkout">Checkout >>></a></td>
        </tr>
    </table>
</div>


<!-- Counter -->
<script>
    const plus = document.querySelector(".plus"),
        minus = document.querySelector(".minus"),
        num= document.querySelector(".num");

    let a = 1;

    plus.addEventListener("click",()=>{
        a++;
        a=(a<10) ? "0" + a : a;
        num.innerText = a;
        console.log(a)
    });

    minus.addEventListener("click",()=>{
        if(a>1){
            a--;
            a=(a<10) ? "0" + a : a;
            num.innerText = a;
        }
    });
</script>

</body>
</html>
