
function fillFav() {
    var fav = JSON.parse(localStorage.getItem('fav'));
    console.log(fav);
    for (product of fav) {

        var div = document.createElement("div");
        div.className ="product";
        var divhtml = `<img src="${product.image}" alt="">
        <div>
            <h4>${product.title}</h4>
            <button>Add To Cart</button>
            <span> ${product.price}</span>
        </div>`;

        
        div.innerHTML = divhtml;

        document.querySelector(".favourite").appendChild(div);
    }
}

window.onload = fillFav();