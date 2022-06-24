var fullName = document.querySelector('#fullName')
var username = document.querySelector('#userName')
var password = document.querySelector('#password')
var repassword = document.querySelector('#re-password')
var email = document.querySelector('#email')
var phone = document.querySelector('#phone')

//Feedback
var feedback = document.querySelector('#feedback');

//Change Password
var oldPassword = document.querySelector('#oldPassword');
var newPassword = document.querySelector('#newPassword');
var confirmNewPassword = document.querySelector('#confirmNewPassword');

//Employer Upload
var titleJob = document.querySelector("#titleJob");
var description = document.querySelector("#floatingTextarea2");
var amount = document.querySelector("#amount");
var salary = document.querySelector("#salary");
var question = document.querySelectorAll()

var form = document.querySelector('form')


function showError(input, message) {
    let parent = input.parentElement;
    let small = parent.querySelector('small')
    small.innerText = message
}

function showSuccess(input) {
    let parent = input.parentElement;
    let small = parent.querySelector('small')
    small.innerText = ''
}

function checkEmptyErrorOneParam(input) {
    let isEmptyError = false;
    input.value = input.value.trim()
    if (!input.value) {
        isEmptyError = true
        showError(input, 'Không được để trống !')
    } else {
        showSuccess(input)
    }
    return isEmptyError
}

function checkEmptyError(listInput) {
    let isEmptyError = false;
    listInput.forEach(input => {
        input.value = input.value.trim()

        if (!input.value) {
            isEmptyError = true
            showError(input, 'Không được để trống !')
        } else {
            showSuccess(input)
        }
    });
    return isEmptyError
}

function checkNegativeValue(input) {
    let isNegative = false;
    let myValue = parseInt(input.value);
    if(myValue <= 0) {
        isNegative = true;
        showError(input, "Giá trị không hợp lệ!")
    }
    return isNegative
}

function checkEmailError(input) {
    const regexEmail =
            /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
    input.value = input.value.trim()
    let isEmailError = !regexEmail.test(input.value)
    if (regexEmail.test(input.value)) {
        showSuccess(input)
    } else {
        showError(input, 'Email không hợp lệ !')
    }

    return isEmailError
}

function checkLengthError(input, min, max) {
    input.value = input.value.trim()

    if (input.value.length < min) {
        showError(input, `Phải có ít nhất ${min} ký tự !`)
        return true
    }
    if (input.value.length > max) {
        showError(input, `Không quá ${max} ký tự !`)
        return true
    }
    return false
}

function checkMatchPasswordError(passwordInput, repasswordInput) {
    if (passwordInput.value !== repasswordInput.value) {
        showError(repasswordInput, 'Xác nhận mật khẩu chưa trùng khớp !')
        return true
    }
    return false
}

// form.addEventListener('submit', function (e) {
//     e.preventDefault()
//     let isEmptyError = checkEmptyError([fullName, username, password, repassword, email, phone])
//     let isEmailError = checkEmailError(email)
//     let isUserNameLengthError = checkLengthError(username, 4, 30)
//     let isPasswordLengthError = checkLengthError(password, 4, 30)
//     let isMatchError = checkMatchPasswordError(password, repassword)

//     if(isEmptyError || isEmailError || isUserNameLengthError || isPasswordLengthError || isMatchError){

//     }else {

//     }
// })

function validate() {
    let isEmptyError = checkEmptyError([fullName, username, password, repassword, email, phone])
    let isEmailError = checkEmailError(email)
    let isUserNameLengthError = checkLengthError(username, 4, 30)
    let isPasswordLengthError = checkLengthError(password, 4, 30)
    let isMatchError = checkMatchPasswordError(password, repassword)

    if (isEmptyError || isEmailError || isUserNameLengthError || isPasswordLengthError || isMatchError) {
        return false
    }
    return true
}

function validateFeedback() {
    let isFeedbackEmpty = checkEmptyErrorOneParam(feedback)
    if (isFeedbackEmpty) {
        return false
    }
    return true
}

function validateChangePassword() {
    let isPasswordEmpty = checkEmptyError([oldPassword, newPassword, confirmNewPassword])
    let isPasswordMatchError = checkMatchPasswordError(newPassword, confirmNewPassword)
    if (isPasswordEmpty || isPasswordMatchError) {
        return false
    }
    return true
}

function validateEmployerUpload() {
    let isEmptyError = checkEmptyError([titleJob, description, question])
    let isNegative = checkNegativeValue(amount)
    let isNegativeSalary = checkNegativeValue(salary)
    if (isEmptyError || isNegative || isNegativeSalary) {
        return false
    }
    return true
}

