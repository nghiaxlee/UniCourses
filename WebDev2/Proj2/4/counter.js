function $(sel)
{
    return document.querySelector(sel);
}

$("#inc").addEventListener('click', function(e)
    {
        onButtonPress(+1);
    }
);
$("#dec").addEventListener('click', function(e)
    {
        onButtonPress(-1);
    }
);

function onButtonPress(delta)
{
    let value = parseInt($("#counter").value);
    value += delta;
    $("#counter").value = value;
    $("#inc").disabled = value > 10;
    $("#dec").disabled = value <= 0;
}

$("#counter").value = 5;