function $(sel)
{
    return document.querySelector(sel);
}

$("#listl")
    .addEventListener("click", onClick);

function onClick(e)
{
    if (e.target.tagName === 'A')
    {
        if (e.target.href.indexOf("elte.hu") === -1) 
            e.preventDefault();
    }
}
