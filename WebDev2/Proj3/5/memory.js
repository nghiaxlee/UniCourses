// Helper
function $(sel)
{
    return document.querySelector(sel);
}

function xyCoord(td) {
    const x =  td.cellIndex;
    const tr = td.parentNode;
    const y =  tr.sectionRowIndex;
    return {
      x: x,
      y: y
    };
}

// Data
const cardNumbers = [
    [1, 2, 3],
    [2, 3, 1]
];

const cards = makeCards(cardNumbers);
let isEnd = false;

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

function selectCard(x, y)
{
    if (cards[y][x].selected)
        return;
    const selectedCards = cards.reduce(
        (res, row) => res.concat(row.filter(card => card.selected)),
        []
    );
    const n = selectedCards.length;
    if (n === 0)
    {
        cards[y][x].selected = true;
    } else if (!cards[y][x].selected)
    {
        if (n === 1)
        {
            cards[y][x].selected = !cards[y][x].selected;
            const prev = selectedCards[0]; // Assign reference
            const current = cards[y][x];    // const mean const pointer
            if (prev.value === current.value)
            {
                prev.solved = current.solved = true;
                isEnd = cards.every(row => row.every(card => card.solved)); 
            }
        } else // Can avoid this using timeout?
        {
            const card0 = selectedCards[0];
            const card1 = selectedCards[1];
            card0.selected = card1.selected = false;
            cards[y][x].selected = true;
        }
    }
}

$("#container").addEventListener("click", onClick);

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
        
        selectCard(x, y);

        draw();
    }    
}

// Draw table

draw();

function draw()
{
    $("#container").innerHTML = `
        ${isEnd ? "<h3>Too young to dumb to realize</h3>" : ""} 
        ${genTable(cards)}
    `;
}

function genTable(cards)
{
    return `   
        <table>
            ${cards.map(row => `  
                 <tr>
                    ${row.map(card => ` 
                        <td style="${card.solved ? "background:green" : ""}">
                            ${card.selected || card.solved ? card.value : ""}
                        </td>
                    `).join('')}
                </tr>
            `).join('')}
        </table>
    `;
}