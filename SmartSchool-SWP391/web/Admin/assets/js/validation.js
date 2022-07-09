/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var cateName = document.querySelector('#cateName')
var cateDesc = document.querySelector('#cateDesc')
var cateImg = document.querySelector('#cateImage')
var editCateName = document.querySelector('#EditCateName')
var editCateDesc = document.querySelector('#EditCateDesc')
var editCateImg = document.querySelector('#EditCateImage')


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
    if (myValue <= 0) {
        isNegative = true;
        showError(input, "Giá trị không hợp lệ!")
    }
    return isNegative
}

function checkImageUrl(input) {
    const regexImgUrl =
            /(https:\/\/)([^\s(["<,>/]*)(\/)[^\s[",><]*(.png|.jpg)(\?[^\s[",><]*)?/;
    input.value = input.value.trim()
    let isUrlError = !regexImgUrl.test(input.value)
    if (regexImgUrl.test(input.value)) {
        showSuccess(input)
    } else {
        showError(input, 'Đường dẫn hình ảnh không hợp lệ !')
    }

    return isUrlError
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

function validateAddCategory() {
    let isEmptyError = checkEmptyError([cateName, cateDesc, cateImg]);
    let isCorrectImgUrl = checkImageUrl(cateImg);
    if (isEmptyError || isCorrectImgUrl) {
        return false;
    }
    return true;
}


function validateEditCategory() {
    let isEmptyError = checkEmptyError([editCateName, editCateDesc, editCateImg])
    if (isEmptyError) {
        return false
    }
    let isCorrectImgUrl = checkImageUrl(editCateImg)
    if (isCorrectImgUrl) {
        return false
    }
    return true
}





