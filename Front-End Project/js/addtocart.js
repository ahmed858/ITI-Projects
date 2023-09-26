// JSON With AJAX from Web API

var products;

function getProducts(URL) {
    var xhr = new XMLHttpRequest();
    xhr.open("GET", URL, true);

    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {

            var responseInJSON = JSON.parse(xhr.responseText);
            products = responseInJSON.products;
            console.log(products);
        }
        else {
            console.log("errroer")
        }
    };

    xhr.send();// API Parameters to be sent as parameter in send() function in case of POST Request.
    // console.log(products);
}

this.onload = getProducts('../data/data.json');
//---------------------------------------------------------------------------------------------------------


var addToCartSpans= document.getElementsByClassName("addtocart");
console.log(addToCartSpans);
var cart =[];


function addToCart(element){
    
    if(JSON.parse(localStorage.getItem('users'))){

        
    console.log(element);
    var productNumber = element.id.slice(1) ;
    console.log(productNumber);

    product = products.find( p => p.id == productNumber);
    console.log(product);
    cart.push(product);
    localStorage.setItem('cart', JSON.stringify( cart))
    alert('One product added');
    }
    else 
    alert('login first');
}
// console.log(localStorage.getItem('cart'));