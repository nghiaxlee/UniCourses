function $(sel)
{
    return document.querySelector(sel);
}

$("#listl")
    .addEventListener("click", onClick);

function onClick(e)
{
    // if (e.target.tagName === 'A')
    if (!e.target.matches('a[href*="elte.hu"]'))
    {
        // if (!e.target.href.includes("elte.hu")) 
            e.preventDefault();
    }
}
