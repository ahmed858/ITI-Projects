
function fillCart() {
    var cart = JSON.parse(localStorage.getItem('cart'));
    console.log(cart);
    for (product of cart) {

        var div = document.createElement("div");

        var divhtml = `            
    
    <p>product</p>
    <hr>
    <div class="card1  d-flex justify-content-between align-items-center">
        <div class="div1">
            <div class="image_details d-flex align-items-center">
                <img src="${product.image}" alt="image 1">
               <div class="d-flex flex-column">
                    <h3 class="fs-3 mx-4">${product.title}</h3>
                    <p class="price fs-4 mx-4 text-danger">${product.price} L.E</p>
               </div>
            </div>
    
        </div>
       
        <div class="total_price fs-4 ">
            <h4>Total</h4>
            <span>${product.price}</span>
        </div>
    </div>
    `;
        div.innerHTML = divhtml;

        document.querySelector(".cart .container").appendChild(div);
    }
}

window.onload = fillCart();