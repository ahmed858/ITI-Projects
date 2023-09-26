// Registration form submission handler
// var user;
// function register() {
//   Get form inputs
//   var name = document.getElementById('name').value;
//   var email = document.getElementById('email').value;
//   var password = document.getElementById('password').value;

//   Create user object
//    user = {
//     name: name,
//     email: email,
//     password: password
//   };

//   Store user object in local storage
//   localStorage.setItem(email, JSON.stringify(user));
//   console.log(user);
// }





// display none for * that after all onput
var required = document.getElementsByClassName("required");
for (var i = 0; i < required.length; i++) {
     required[i].style.display = "none";
}

// login 
function input(eve) {
  this.style.border = "solid 1px red";
  this.nextElementSibling.style.color = "red";
  this.nextElementSibling.style.display = "inline";
}
// UserName Validation
var userName = document.getElementById("userName");
userName.addEventListener("focus", input);
userName.addEventListener("blur", validateUserNameInput);

// Password Validation
var password = document.getElementById("password");
password.addEventListener("focus", input);
password.addEventListener("blur", validatePasswordInput);



// input function to all inputs that make border red and display * after input

// validate user name input function to run on blur event
function validateUserNameInput() {
  var userNamenameRegex = new RegExp(/^[A-Za-z][A-Za-z0-9_]{5,29}$/);
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
    required.innerHTML="";
  }
}





// validate password input function to run on blur event
function validatePasswordInput() {
  var passwordRegex = new RegExp(/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{5,}$/);
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
    required.innerHTML="";
  }
}


var loginForm = document.getElementById("login-form");

loginForm.addEventListener("submit", (e) => {
  var username = document.getElementById("userName"); 
   var password = document.getElementById("password");

  if (username.value == "" ||password.value == "") {
    e.preventDefault();
   } else {
    window.location = this.href;
  }
});

// // User Name And Name Validation
// var userName = document.getElementById("userName");
// userName.addEventListener("focus",input);
// userName.addEventListener("blur",validatName);
// var Name = document.getElementById("name");
// Name.addEventListener("focus",input);
// Name.addEventListener("blur",validatName);

// // input function to all inputs that make border red and display * after input
// function input(eve){
//   this.style.border = "solid 1px red";
//   this.nextElementSibling.style.color = "red";
//   this.nextElementSibling.style.display = "inline";
// }

// // 
// function validatName(eve) {
//   var nameRegex = new RegExp(/^[a-zA-Z]{3,}$/);
//   var Name = this.value;
//   if (!nameRegex.test(Name)) {
//     required[0].nextElementSibling.innerHTML = "Pleas Enter Valid Input";
//     required[0].nextElementSibling.style.color = "red";
//     this.style.margin=0;
//     this.focus();
//     this.select();
//   } else {
//     required[0].nextElementSibling.innerHTML = "";
//     required[0].style.display = "none";
//     this.style.border = "1px solid #fff ";
//     this.marginBottom = "20px";
//   }
// }






