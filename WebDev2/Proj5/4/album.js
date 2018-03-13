function Rand(lo, hi)
{
    return Math.floor(Math.random() * (hi - lo + 1)) + lo;
}

let selected;

function scatter(li)
{
    const x = Rand(0, 696);
    const y = Rand(0, 369);
    const alpha = Rand(0, 360);
    li.style.transform =  `translate3d(${x}px, ${y}px, 0px) rotate(${alpha}deg)`;
}

const arr = Array.from(document.querySelectorAll("ul > li"));
arr.forEach(li => {scatter(li)});

document.addEventListener('click', onClick);

function onClick(e)
{
    if (e.target.matches("img"))
    {
        if (selected)
        {
            selected.classList.remove("active");
            scatter(selected);
        }
        const li = e.target.parentNode;
        selected = li;
        li.style.transform = "";
        li.classList.add('active');
    }
}

document.addEventListener("keydown", onKeyPress);

function onKeyPress(e)
{
    // keyCode 37 39
    if (e.keyCode === 39)
    {
        let i = arr.findIndex(li => li === selected);
        i = (i + 1) % arr.length;

        if (selected)
        {
            selected.classList.remove("active");
            scatter(selected);
        }
        const li = arr[i];
        selected = li;
        li.style.transform = "";
        li.classList.add('active');
    }
}