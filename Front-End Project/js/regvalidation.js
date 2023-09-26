var required = document.getElementsByClassName("required");
for (var i = 0; i < required.length; i++) {
  required[i].style.display = "none";
}

// UserName Validation
var userName = document.getElementById("userName");
userName.addEventListener("focus", input);
userName.addEventListener("blur", validateUserNameInput);

// Password Validation
var password = document.getElementById("password");
password.addEventListener("focus", input);
password.addEventListener("blur", validatePasswordInput);

// Name Validation
var Name = document.getElementById("name");
Name.addEventListener("focus", input);
Name.addEventListener("blur", validateNameInput);

// Email Validation
var email = document.getElementById("email");
email.addEventListener("focus", input);
email.addEventListener("blur", validateEmailInput);


// Repeat Password Validation
var password = document.getElementById("repassword");
password.addEventListener("focus", input);
password.addEventListener("blur", validateRepeatPasswordInput);

// input function to all inputs that make border red and display * after input
function input(eve) {
  this.style.border = "solid 1px red";
  this.nextElementSibling.style.color = "red";
  this.nextElementSibling.style.display = "inline";
}

// validate user name input function to run on blur event
function validateUserNameInput() {
  var userNamenameRegex = new RegExp(/^[A-Za-z][A-Za-z0-9_]{7,29}$/);
  var input = this;
  if (!userNamenameRegex.test(input.value)) {
    var required = input.nextElementSibling.nextElementSibling;
    required.innerHTML = "pleas enter a valid user name that start with letter and more than 7 letter";
    input.nextElementSibling.style.color = "red";
    required.style.color = "red";
    required.style.fontSize = "10px";
    input.style.marginBottom = "10";
    input.focus();
    input.select();
  } else {
    input.nextElementSibling.style.display = "none";
    input.style.border = "1px solid #fff";
    input.style.marginBottom = "20px";
    var required = input.nextElementSibling.nextElementSibling;
    required.innerHTML = "";
  }
}

// validate user name input function to run on blur event
function validateNameInput() {
  var NamenameRegex = new RegExp(/^[a-zA-Z]+$/);
  var input = this;
  if (!NamenameRegex.test(input.value)) {
    var required = input.nextElementSibling.nextElementSibling;
    required.innerHTML = "Please enter a valid name that contains only letters";
    input.nextElementSibling.style.color = "red";
    required.style.color = "red";
    required.style.fontSize = "10px";
    input.style.marginBottom = "10";
    input.focus();
    input.select();
  } else {
    input.nextElementSibling.style.display = "none";
    input.style.border = "1px solid #fff";
    input.style.marginBottom = "20px";
    var required = input.nextElementSibling.nextElementSibling;
    required.innerHTML = "";
  }
}

// validate email input function to run on blur event
function validateEmailInput() {
  var emailRegex = new RegExp(/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/g);
  var input = this;
  if (!emailRegex.test(input.value)) {
    var required = input.nextElementSibling.nextElementSibling;
    required.innerHTML = "Please enter a valid E-mail";
    input.nextElementSibling.style.color = "red";
    required.style.color = "red";
    required.style.fontSize = "10px";
    input.style.marginBottom = "10";
    input.focus();
    input.select();
  } else {
    input.nextElementSibling.style.display = "none";
    input.style.border = "1px solid #fff";
    input.style.marginBottom = "20px";
    var required = input.nextElementSibling.nextElementSibling;
    required.innerHTML = "";
  }
}

// validate password input function to run on blur event
function validatePasswordInput() {
  var passwordRegex = new RegExp(/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/);
  var input = this;
  if (!passwordRegex.test(input.value)) {
    var required = input.nextElementSibling.nextElementSibling;
    required.innerHTML = "Please enter a strong password atleast 8 charcters letters and numbers";
    input.nextElementSibling.style.color = "red";
    required.style.color = "red";
    required.style.fontSize = "10px";
    input.style.marginBottom = "10";
    input.focus();
    input.select();
  } else {
    input.nextElementSibling.style.display = "none";
    input.style.border = "1px solid #fff";
    input.style.marginBottom = "20px";
    var required = input.nextElementSibling.nextElementSibling;
    required.innerHTML = "";
  }
}


// validate repeat password input function to run on blur event
function validateRepeatPasswordInput() {
  var input = this;
  var password = document.getElementById("password").value;
  var rePssword = input.value;
  if (password !== rePssword) {
    var required = input.nextElementSibling.nextElementSibling;
    required.innerHTML = "repeated password not match with password";
    input.nextElementSibling.style.color = "red";
    required.style.color = "red";
    required.style.fontSize = "10px";
    input.style.marginBottom = "10";
    input.focus();
    input.select();
  } else {
    input.nextElementSibling.style.display = "none";
    input.style.border = "1px solid #fff";
    input.style.marginBottom = "20px";
    var required = input.nextElementSibling.nextElementSibling;
    required.innerHTML = "";
  }
}

// submit handling for registration
var registration = document.getElementById("registration-form");

registration.addEventListener("click", (e) => {
  var username = document.getElementById("userName");
  var Name = document.getElementById("name");
  var email = document.getElementById("email");
  var password = document.getElementById("password");
  var repassword = document.getElementById("repassword");
  var terms = document.getElementById("checkbox");

  if (username.value == "" || Name.value == "" || email.value == "" || password.value == "" || repassword.value == "" || terms.checked == 0) {
    e.preventDefault();
  } else {
    window.location = this.href;
  }
});

var loginForm = document.getElementById("login-form");

// loginForm.addEventListener("submit", (e) => {
//   var username = document.getElementById("userName");  var password = document.getElementById("password");

//   if (username.value == "" ||password.value == "") {
//     e.preventDefault();
//    } else {
//     window.location = this.href;
//   }
// });

var users = [];
document.getElementById("register-btn").onmouseup = function () {
  var username = document.getElementById("userName").value;
  var name = document.getElementById("name").value;
  var email = document.getElementById("email").value;
  var pass = document.getElementById("password").value;
  var user = {
    username: username,
    name: name,
    email: email,
    password: pass
  };
  console.log(user);
  users.push(user);
  console.log(users);

  let old = false;
  if (JSON.parse(localStorage.getItem('users'))) {
    var oldusers = JSON.parse(localStorage.getItem('users'));
    for (let u of oldusers) {
      if (u.username == username) {
        old = true;
      }
    }
    if (old) {
      alert("Used username -_-");
      location.href = "register.html"
    }
    else {
      localStorage.setItem("users", JSON.stringify(users));
      alert("Suc Register ")
      location.href = "login.html";
    }
  }
  else {
    localStorage.setItem("users", JSON.stringify(users));
    alert("Suc Register ")
    location.href = "login.html";
  }
}
