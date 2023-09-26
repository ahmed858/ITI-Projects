

document.getElementById("login-btn").onclick = function () {
    var username = document.getElementById("userName").value;
    var pass = document.getElementById("password").value;

    if (JSON.parse(localStorage.getItem('users'))) {


        var oldusers = JSON.parse(localStorage.getItem('users')) ;
        for (let u of oldusers) {
            if (u.username == username && u.password == pass) {
                old = true;
            }
        }

        if (!old) {
            alert("Register first -_-");
        }
        else {

            alert("Suc login ");
            location.href = "home.html";
        }
    }
    else 
    alert("Register first -_-");

}


