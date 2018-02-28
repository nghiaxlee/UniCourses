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
        publisher: "P1"
    },
    {
        author: "Ng Nhat Anh",
        title: "Co gai den tu ngay hom qua",
        year: 1989,
        publisher: "P1"
    },
    {
        author: "Ng Nhat Anh",
        title: "Mat biec",
        year: 1990,
        publisher: "P1"
    },
    {
        author: "Ng Nhat Anh",
        title: "Cho toi xin mot ve ve tuoi tho",
        year: 2008,
        publisher: "P1"
    },
    {
        author: "Ng Nhat Anh",
        title: "Ngay xua co mot chuyen tinh",
        year: 1999,
        publisher: "P1"
    },
    {
        author: "Ng Nhat Anh",
        title: "Mah little angel",
        year: 1990,
        publisher: "P1"
    },
    {
        author: "Ng Nhat Anh",
        title: "Phong tro 3 nguoi",
        year: 1990,
        publisher: "P1"
    },
    {
        author: "Ng Nhat Anh",
        title: "Con chut gi de nho",
        year: 1989,
        publisher: "P1"
    }
];

$("#list").innerHTML = PrintList(catalogue);
$("#btnList")
    .addEventListener("click", onClick);

function BooksFromYear(catalogue, year)
{
    return catalogue
            .filter(book => book.year === year);
    // const out = [];
    // for(let i = 0; i < catalogue.length; ++i)
    // {
    //     if (catalogue[i].year === year)
    //     {
    //         out.push(catalogue[i]);
    //     }
    // }
    // return out;
}

function PrintList(books)
{
    return books
            .map(book => `<li>${book.title}</li>`)
            .join(' ');
    // let s = "";
    // for(let i = 0; i < books.length; ++i)
    // {
    //     s += `<li>${books[i].title}</li>`;
    // }
    // return s;
}

function onClick()
{
    const year = parseInt($("#year").value);
    const lists = BooksFromYear(catalogue, year);
    $("#list").innerHTML = PrintList(lists);
}