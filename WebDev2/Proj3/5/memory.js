function $(sel)
{
    return document.querySelector(sel);
}

// Data
const cardNumbers = [
    [1, 2, 3],
    [2, 3, 1]
];

const cards = makeCards(cardNumbers);

function makeCards(cardNumbers)
{
    return cardNumbers
            .map(row => row.map(n => 
            ({
                value: n,
                selected: false,
                solved: false
            })));
}

$("#container").addEventListener("click", onClick);

function xyCoord(td) {
    const x =  td.cellIndex;
    const tr = td.parentNode;
    const y =  tr.sectionRowIndex;
    return {
      x: x,
      y: y
    };
}

function onClick(e)
{
    if (e.target.matches("td"))
    {
        const td = e.target;
        //const coords = xyCoord(td);
        // const x = coords.x;
        // const y = coords.y;
        //const {x, y} = coords;
        const {x, y} = xyCoord(td);
        cards[y][x].selected = !cards[y][x].selected;

        draw();
    }    
}

// Draw table

draw();

function draw()
{
    $("#container").innerHTML = genTable(cards);
}

function genTable(cards)
{
    return `   
        <table>
            ${cards.map(row => `  
                 <tr>
                    ${row.map(card => ` 
                        <td>
                            ${card.selected ? card.value : ''}
                        </td>
                    `).join('')}
                </tr>
            `).join('')}
        </table>
    `;
}