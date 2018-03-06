// TODO: b)

function $(sel)
{
    return document.querySelector(sel);
}

const catalogue = 
[
    {
        author: "Ng Nhat Anh",
        title: "I am Beto",
        year: 2007,
        length: 100
    },
    {
        author: "Ng Nhat Anh",
        title: "Co gai den tu ngay hom qua",
        year: 1989,
        length: 100
    },
    {
        author: "Ng Nhat Anh",
        title: "Mat biec",
        year: 1990,
        length: 100
    },
    {
        author: "Ng Nhat Anh",
        title: "Cho toi xin mot ve ve tuoi tho",
        year: 2008,
        length: 100
    },
    {
        author: "Ng Nhat Anh",
        title: "Ngay xua co mot chuyen tinh",
        year: 1999,
        length: 100
    },
    {
        author: "Ng Nhat Anh",
        title: "Mah little angel",
        year: 1990,
        length: 100
    },
    {
        author: "Ng Nhat Anh",
        title: "Phong tro 3 nguoi",
        year: 1990,
        length: 100
    },
    {
        author: "Ng Nhat Anh",
        title: "Con chut gi de nho",
        year: 1989,
        length: 100
    }
];

$("#list").innerHTML = PrintList(catalogue);
$("#title")
    .addEventListener("keyup", onKeyPress);

function onKeyPress(e)
{
    console.log(e.target.value);
    const key = e.target.value;
    const lists = MoviesWithTitle(catalogue, key);
    $("#list").innerHTML = PrintList(lists);
}

function MoviesWithTitle(catalogue, key)
{
    return catalogue
            .filter(movie => movie.title.includes(key));
}

function PrintList(movies)
{
    return movies
            .map(movie => `<li>${movie.title}</li>`)
            .join(' ');
}