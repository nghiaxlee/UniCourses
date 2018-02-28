function $(sel)
{
    return document.querySelector(sel);
}

function Rand(a, b)
{
    return Math.floor(Math.random() * (b - a + 1)) + a;
}

const ans = Rand(1, 100);
const guessed = [];
let isEnd = false;

$("#btn")
    .addEventListener("click", addNum);

function compare(a, b)
{
    if (a < b)
        return "is less than";
    if (a > b)
        return "is greater than";
    return "equals to";
}

function PrintRes(list)
{
    // return list
    //         .map(function(num) 
    //             {
    //                 if (num < ans)
    //                     return `<li>The answer is greater than ${num}</li>`;
    //                 if (num > ans)
    //                     return `<li>The answer is smaller than ${num}</li>`;
    //                 else
    //                     return `<li>${num} is the answer!!</li>`;

    //             }
    //         ).join(' ');
    return list
            .map(num => `<li>The answer ${compare(ans, num)} ${num}</li>`)
            .join(' ');
}

function addNum()
{
    //State(isEnd);
    let value = parseInt($("#num").value);
    isEnd = (value === ans);
    guessed.push(value);
    $("#list").innerHTML = PrintRes(guessed);
    $("#LMN").hidden = isEnd;
    $("#congratcontainer").hidden = !isEnd;
}
