var fullName = document.querySelector('#fullName')
var username = document.querySelector('#userName')
var password = document.querySelector('#password')
var repassword = document.querySelector('#re-password')
var email = document.querySelector('#email')
var phone = document.querySelector('#phone')
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

    if(isEmptyError || isEmailError || isUserNameLengthError || isPasswordLengthError || isMatchError){
        return false
    }
    return true
}

