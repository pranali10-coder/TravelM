
/* all right reserved @Regex Technologies*/
function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}

/*Accept Only Password Validation*/
function Validate() {
    var password = document.getElementById("password").value;
    var con_password = document.getElementById("con_password").value;
    if (password != con_password) {
        alert("Passwords do not match.");
        $("#con_password").val("");
    	$("#con_password").focus();
        return false;
    }
    return true;
}

/*Accept Only Character Validation*/
function ValidateAlpha(evt)
{
    var keyCode = (evt.which) ? evt.which : evt.keyCode
    if ((keyCode < 65 || keyCode > 90) && (keyCode < 97 || keyCode > 123) && keyCode != 32)
     
    return false;
        return true;
}



