$(document).ready(function () {
    const thModal = new bootstrap.Modal('#thuongHieu');

    $("#quick_create_th").submit(function (event) {
        event.preventDefault();
        ajaxPostLoai("thuonghieu");
    });

    function ajaxPostLoai(loai) {
        var loai2 = ["", ""]
        loai2[0] = "th"
        loai2[1] = "TH"
        var data = {
            ten: $("#quick_create_" + loai2[0] + " #ten" + loai2[1]).val().trim(),
            trangThai: $("#quick_create_" + loai2[0] + " input[name='trangThai']:checked").val()
        };
        console.log(data)
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "http://localhost:8080/" + loai + "/api/add",
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                console.log("-------------test get data---------------");
                console.log(result.data)
                if (result.status == "success") {
                    console.log("-------------post---------------");
                    console.log(data);
                    thModal.hide();
                    alert("Success")
                    var select = document.getElementById("form_" + loai2[0]);
                    var newOption = document.createElement("option");
                    var newOptionVal = document.createTextNode(result.data.ten);
                    newOption.setAttribute("value", result.data.id);
                    newOption.appendChild(newOptionVal);
                    select.insertBefore(newOption, select.firstChild);
                } else {
                    alert("Fail")
                    console.log("fail");
                }
                console.log(result);
            },
            error: function (e) {
                alert("Error!")
                console.log("ERROR: ", e);
            }
        });
    }
})
