function $(sel)
{
    return document.querySelector(sel);
}

let todoList = [];

$("#btnAdd")
    .addEventListener("click", Add);
$("#list")
    .addEventListener("click", onClick);;

function onClick(e)
{
    if (e.target.matches("button"))
    {
        //console.log(e.target.getAttribute("data-id")[2]);
        let id = parseInt(e.target.getAttribute("data-id")[2]);
        console.log(id);
        todoList = todoList
                        .filter(item => item.id != id);
        Print(todoList);
    }
}

function Add()
{
    const text = $("#item").value;
    todoList.push(
        {
            id: todoList.length + 1,
            text: text,
        }
    );
    Print(todoList);
}

function Print(a)
{
    $("#list").innerHTML = genList(a);
}

function genList(a)
{
    return a
            .map(item => `<li>${item.text} <button data-id="id${item.id}">X</button></li>`)
            .join(' ');
}

