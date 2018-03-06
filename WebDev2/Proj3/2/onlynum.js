function $(sel)
{
    return document.querySelector(sel);
}

$("#num")
    .addEventListener("keydown", checkNum1);

document.addEventListener("keydown", onDocPress);

function onDocPress(e)
{
    if (e.target.matches(".num"))
    {
        console.log(e.target);
        checkNum1(e);
    }
}

function checkNum1(e)
{
    const exceptionArr = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "Backspace", "F5", "Enter", "."];
    console.log(e.key);
    const key = e.key;
    if (exceptionArr.includes(key))
        return;
    e.preventDefault();
}