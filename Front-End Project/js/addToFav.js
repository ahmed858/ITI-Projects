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

//-------------------//-------------------//-------------------//-------------------//-------------------

var favlist = [];

function addToFav(element){
    if(JSON.parse(localStorage.getItem('users'))){
    console.log(element);
    var productNumber = element.id.slice(1) ;
    console.log(productNumber);

    product = products.find( p => p.id == productNumber);
    console.log(product);
    favlist.push(product);
    localStorage.setItem('fav', JSON.stringify(favlist));
    }
    else {
        alert('login first');
    }
}
// console.log(localStorage.getItem('cart'));