function $(sel)
{
    return document.querySelector(sel);
}

$("#btnLink")
    .addEventListener("click", onClick);

function onClick()
{
    const link = $("#link").value;
    console.log(link);
    $("#list").innerHTML += `<li><img src=${link}></li>`;
}