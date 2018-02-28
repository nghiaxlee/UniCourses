/* 3 types
p (call by tag)
{
}

.important (call by class)
{        
}
    
#radius (call by id)
{       
}
*/

function $(sel)
{
    return document.querySelector(sel);
}

$("#btnCalc")
    .addEventListener("click", onClick);

function Circumference(r)
{
    return r * 2 * Math.PI;
}

function onClick()
{
    // input
    const r = $("#radius").value;
    // processing
    const res = Circumference(r);
    // output
    $("#output").innerHTML = res;
    console.log(res);
}