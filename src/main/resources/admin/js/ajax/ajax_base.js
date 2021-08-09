// var url = window.location.href.split("/")
// const URL_HTTP = url[0] + "/" + "/" + url[2] + "/"+url[3]+"/"
// const URL_HTTP = url[0] + "/" + "/" + url[2] + "/"
// console.log(window.location.href.split("/"))
const URL_API = "api/v1/public/";
$(function () {
    viewNumberCart()
});

// kiểm tra xem trong local storage có key user k
// k có sẽ bắt login*/
function checkLogin() {
    let user = getItemLocalStorage("user");
    if (user != null) {
        let html = `
        <a href="admin" class="d-block" id="text-name-user" style="text-transform: capitalize">${user.data.name}</a>
        `;
        $("#idBlockSidebar").html(html)
    } else {
        window.location.href = "admin-login"
    }
}

//copy to clipboard
function copyToClipboard(id) {
    console.log(id)
    let copyText = document.getElementById(id);
    console.log(copyText)
    copyText.select();
    copyText.setSelectionRange(0, 99999)
    navigator.clipboard.writeText(copyText.value).then(() => {
        alertSuccess("Đã coppy vào clipboard")
    }).catch((error) => {
        alert(`Copy failed!`)
    })
}

//view số lượng giỏ hàng
function viewNumberCart() {
    let list = getItemLocalStorage("listIdProduct");
    let lenght;
    if (list !== null) {
        lenght = list.length;
    } else {
        lenght = 0;
    }
    $("#numberCart").html(lenght);
}

/*Đăng xuất ra khỏi tk*/
function logOut() {
    localStorage.removeItem("user");
    window.location.href = "admin-login";
}

// validate input text
function validateTextInput(data) {
    let fieldData = data;
    if (fieldData.length == 0 || fieldData == "" || fieldData == undefined)
        return false;
    else return true; //Submits form
}

// validate input number
function validateNumberInput(number) {
    if (isNaN(number))
        return check = false;
    else return check = true;
}

/*notify để custom alert */
//alert notify
//***************alter
function alertSuccess(text, time = 2000) {
    $.notify({
        icon: 'far fa-check-circle',
        message: text
    }, {
        delay: time,
        offset: {x: 15, y: 15},
        type: 'success',
        animate: {
            enter: 'animated fadeInDown',
            exit: 'animated fadeOutUp'
        },
        z_index: 1031000000000,

    });
}

function alertInfo(text, time = 2000) {
    $.notify({
        icon: 'fas fa-info-circle',
        message: text
    }, {
        delay: time,
        offset: {x: 15, y: 15},
        type: 'info',
        animate: {
            enter: 'animated fadeInDown',
            exit: 'animated fadeOutUp'
        },
        z_index: 1031000000000,

    });
}

function alertWarning(text, time = 2000) {
    $.notify({
        icon: 'fas fa-exclamation',
        message: text
    }, {
        delay: time,
        offset: {x: 15, y: 15},
        type: 'warning',
        animate: {
            enter: 'animated fadeInDown',
            exit: 'animated fadeOutUp'
        },
        z_index: 1031000000000,

    });
}

function alertDanger(text, time = 2000) {
    $.notify({
        icon: 'fas fa-exclamation-triangle',
        message: text
    }, {
        timer: 1000,
        delay: time,
        offset: {x: 15, y: 15},
        type: 'danger',
        animate: {
            enter: 'animated fadeInDown',
            exit: 'animated fadeOutUp'
        },
        z_index: 1031000000000,

    });
}

/*get data*/
async function ajaxCallGet(url) {
    let rs = null;
    await $.ajax({
        type: 'GET',
        dataType: "json",
        url: URL_API + url,
        timeout: 30000,
        success: function (result) {
            rs = result;

        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(errorThrown);
        }
    })

    return rs;
}

/*get data*/
async function ajaxCallGetHasAsyn(url) {
    let rs = null;
    await $.ajax({
        type: 'GET',
        dataType: "json",
        url: URL_API + url,
        async: false,
        timeout: 30000,
        success: function (result) {
            rs = result;
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(errorThrown);
        }
    })
    return rs;
}

/*upload file, image....*/
async function ajaxCallUploadFile(url, file) {
    let data;
    await $.ajax({
        type: "POST",
        // url: "http://spec.edu.vn/api/v1/public/upload/upload-image",
        // url: URL_API+ "upload/upload-image",
        url: URL_API + url,
        data: file,
        cache: false,
        contentType: false,
        enctype: 'multipart/form-data',
        processData: false,
        success: function (result) {
            data = result.data;
        },
        error: function (err) {
            console.log(err);
        }
    });
    return data;
}

/*post data*/
async function ajaxCallPost(url, dataUser) {
    let rs = null;
    await $.ajax({
        type: 'POST',
        data: JSON.stringify(dataUser),
        url: URL_API + url,
        timeout: 30000,
        contentType: "application/json",
        success: function (result) {
            rs = result
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(errorThrown);
        }
    })
    return rs;
}

/*set key-val để lưu vào local storage*/
function setItemLocalStorage(key, val) {
    localStorage.setItem(key, JSON.stringify(val));
}/*get key-val để lưu vào local storage*/
function getItemLocalStorage(key) {
    return JSON.parse(localStorage.getItem(key));
}

//format input type number
function formatNumber(nStr, decSeperate, groupSeperate) {
    nStr += '';
    x = nStr.split(decSeperate);
    x1 = x[0];
    x2 = x.length > 1 ? '.' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1)) {
        x1 = x1.replace(rgx, '$1' + groupSeperate + '$2');
    }
    return x1 + x2;
}

//format input type number
function formatFees(nStr, decSeperate, groupSeperate) {
    let arr = nStr.split(",");
    if (arr.length > 0) {
        // nếu phần chuỗi sau dính dấu "," nó sẽ cắt bỏ đi rồi mới gán
        arr = arr.toString().replaceAll(",", "")
        nStr = arr
    }
    nStr += '';
    x = nStr.split(decSeperate);
    x1 = x[0];
    x2 = x.length > 1 ? ',' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1)) {
        x1 = x1.replace(rgx, '$1' + groupSeperate + '$2');
    }
    return x1 + x2;
}