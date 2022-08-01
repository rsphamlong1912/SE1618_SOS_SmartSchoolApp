var fullName = document.querySelector('#fullName')
var username = document.querySelector('#userName')
var password = document.querySelector('#password')
var repassword = document.querySelector('#re-password')
var email = document.querySelector('#email')
var phone = document.querySelector('#phone')
var compName = document.querySelector('#compName')
var compAddress = document.querySelector('#compAddress')

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
var question = document.querySelector("#question");
var form = document.querySelector('form')

//Lost and Found Post
var titlePost = document.querySelector("#title");
var descriptionPost = document.querySelector("#descriptionPost");
var postImg = document.querySelector("#postImg");

//Profile User
var nameUser = document.querySelector('#nameUser')
var phoneUser = document.querySelector('#phoneUser')
var emailUser = document.querySelector('#emailUser')


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

function employerValidate() {
    let isEmptyError = checkEmptyError([fullName, username, password, repassword, email, phone,compName,compAddress])
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
    console.log(question)
    let questionm = document.getElementById("newinput").getElementsByClassName('questionm')[0];
    let isEmptyQuestionM = true;
    isEmptyQuestionM = checkEmptyErrorOneParam(questionm);
    
    let questionm2 = document.getElementById("newinput").getElementsByClassName('questionm')[1];
    let isEmptyQuestionM2 = true;
    isEmptyQuestionM2  = checkEmptyErrorOneParam(questionm2) 
    
        let questionm3 = document.getElementById("newinput").getElementsByClassName('questionm')[2];
    let isEmptyQuestionM3 = true;
    isEmptyQuestionM3  = checkEmptyErrorOneParam(questionm3) 
    
        let questionm4 = document.getElementById("newinput").getElementsByClassName('questionm')[3];
    let isEmptyQuestionM4 = true;
    isEmptyQuestionM4  = checkEmptyErrorOneParam(questionm4) 
    
        let questionm5 = document.getElementById("newinput").getElementsByClassName('questionm')[4];
    let isEmptyQuestionM5 = true;
    isEmptyQuestionM5  = checkEmptyErrorOneParam(questionm5)   
    
    let questionm6 = document.getElementById("newinput").getElementsByClassName('questionm')[5];
    let isEmptyQuestionM6 = true;
    isEmptyQuestionM6  = checkEmptyErrorOneParam(questionm6) 
    
        let questionm7 = document.getElementById("newinput").getElementsByClassName('questionm')[6];
    let isEmptyQuestionM7 = true;
    isEmptyQuestionM7  = checkEmptyErrorOneParam(questionm7) 
    
        let questionm8 = document.getElementById("newinput").getElementsByClassName('questionm')[7];
    let isEmptyQuestionM8 = true;
    isEmptyQuestionM8  = checkEmptyErrorOneParam(questionm8) 
    
        let questionm9 = document.getElementById("newinput").getElementsByClassName('questionm')[8];
    let isEmptyQuestionM9 = true;
    isEmptyQuestionM9  = checkEmptyErrorOneParam(questionm9) 
    
        let questionm10 = document.getElementById("newinput").getElementsByClassName('questionm')[9];
    let isEmptyQuestionM10 = true;
    isEmptyQuestionM10  = checkEmptyErrorOneParam(questionm10) 
    
//    questionm.forEach(element => console.log(element));
    if (isEmptyError || isNegative || isNegativeSalary || isEmptyQuestionM || isEmptyQuestionM2 || isEmptyQuestionM3 ||
            isEmptyQuestionM4|| isEmptyQuestionM5|| isEmptyQuestionM6||isEmptyQuestionM7||isEmptyQuestionM8 || isEmptyQuestionM9 || isEmptyQuestionM10) {
        return false
    }
    return true
}

function validatePost() {
    let isEmpty = checkEmptyError([titlePost, descriptionPost, postImg])
    if (isEmpty ) {
        return false
    }
    return true
}

function validateProfile() {
    let isEmpty = checkEmptyError([nameUser, phoneUser, emailUser])
    if (isEmpty ) {
        return false
    }
    return true
}

