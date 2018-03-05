function $(sel)
{
    return document.querySelector(sel);
}

/*$("#num")
    .addEventListener("input", checkNum);*/
$("#num")
    .addEventListener("keydown", checkNum1);

const exceptionArr = [8, 9, 46, 13, 27, 190];

function checkNum()
{
    console.log(this.value);
}

function checkNum1(e)
{
    /*
        8 backspace
        9 tab
        46 delete
        13 enter
        27 esc
        190 .
    */
    console.log(e.keyCode);
    if (exceptionArr.indexOf(e.keyCode) !== -1)
        return
    if (e.keyCode < 48 || e.keyCode > 57)
        e.preventDefault();
}