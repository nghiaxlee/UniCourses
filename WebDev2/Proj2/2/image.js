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
    // $("#img").id = "hey";
    // $("#hey").src = link;
    $("#img").src = link;
}