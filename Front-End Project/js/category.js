var path = `/../data/data.json`;


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

this.onload = getProducts('../data/data.json');// the url is from the port so you start from the root 'final project folder'
// console.log(products);





// show function 

function show(data) {

    var element = document.querySelector(".products_slider .col-lg-12");
    document.querySelector(".products_slider").innerHTML = "";
    document.getElementById("num-of-pruducts").innerText = data.length;
    for (let pro of data) {
        var card = `<div class="card " id="pro1">

        <img class="img-fluid" src="${pro.image}" alt="">
        
        <div class="ps-4">
          <h5 class="title mt-2 mb-2 fw-bold fs-2">${pro.title}</h5>
          <h3 class="price text-black-50 fw-lighter fs-3 lh-1">$${pro.price}</h3>
          <div class="product_text position-relative">
            <span class="addtocart text-uppercase" id="d${pro.id}" onclick="addToCart(this)" >+Add to Cart</span>
            <i class="fa-regular fa-heart " id="i${pro.id}" onclick="addToFav(this)""></i>
          </div>
        
        </div>
        
        </div>`
        col_lg_4_col_sm_6 = document.createElement("div");
        col_lg_4_col_sm_6.className = "col-lg-4 col-sm-6";
        col_lg_4_col_sm_6.innerHTML = card;
        document.querySelector(".products_slider").appendChild(col_lg_4_col_sm_6);
    }
    document.querySelector(".products_slider").appendChild(element);
}

window.addEventListener("load", function () {
    var t;
    if(localStorage.getItem('users')){
        show(products);
        clearInterval(t);
    }
    else {
      t=  setInterval(function(){
            alert("login to show our products");
            location.href= "login.html";
        },5000);
    }
});



// Pic all filters and go on 
function myFilter(data) {


    const categoryCheckboxes = Array.from(document.querySelectorAll('input[name="category"]')).filter(function (checkbox) {
        return checkbox.checked
    });
    const cateCheckedValues = categoryCheckboxes.map((checkbox) => checkbox.id);


    const colorCheckboxes = Array.from(document.querySelectorAll('input[name="color"]')).filter(function (checkbox) {
        return checkbox.checked
    });
    const colorCheckedValues = colorCheckboxes.map((checkbox) => checkbox.id);

    console.log(colorCheckedValues)
    console.log(typeof colorCheckedValues);
    var newData = [];
    for (let product of data) {
        if (colorCheckedValues.includes(product.color) || cateCheckedValues.includes(product.title)) {
            newData.push(product);
        }
    }
    console.log(newData)
    if (newData.length) {

        var idxSort = document.getElementById("my-select").value;
        if (idxSort === 2) {
            newData.sort((a,b)=>  a.price-b.price);
        }   

        else if (idxSort === 3){
            newData.sort((a,b)=>  a.rating-b.rating);
        }
    }
    console.log(newData)
    return newData;
}

document.getElementById('search_btn').onclick = function () {
    show(myFilter(products));
};