let canvas = document.querySelector("#canvas");
let contxt = canvas.getContext("2d");
let lastTimeStamp = performance.now();

const targetObj =
{
    width: 50,
    x: 0,
    height: 50,
    y: 0,
    velocity: 200, // px/s
}

const bullet =
{
    width: 5,
    x: canvas.width / 2,
    height: 10,
    y: canvas.height - 10,
    velocity: 0, // px/s
}

let isEnd = false;

gameloop();

function gameloop(timeStamp)
{
    const dt = (timeStamp - lastTimeStamp) / 1000;
    lastTimeStamp = timeStamp;
    if (!isEnd)
        requestAnimationFrame(gameloop);
    if (!isNaN(dt))
    {
        update(dt);
        draw();
    }
}

function isCollided(a, b) // Check dict :))
{
    return !(
        b.y + b.height < a.y ||
        b.x > a.x + a.width ||
        b.y > a.y + a.height ||
        b.x + b.width < a.x
    );
}

function update(dt)
{
    tmp = targetObj.x + targetObj.velocity * dt;
    if (tmp >= canvas.width)
        tmp = 0;
    targetObj.x = tmp;
    tmp = bullet.y - bullet.velocity * dt;
    if (tmp <= 0)
    {
        tmp = canvas.height - bullet.height;
        bullet.velocity = 0;
    }
    bullet.y = tmp;
    if (isCollided(bullet, targetObj))
        isEnd = true;
}

function draw()
{
    contxt.fillStyle = "black";
    contxt.fillRect(0, 0, canvas.width, canvas.height);
    contxt.fillStyle = isEnd ? "red" : "lightgreen";
    contxt.fillRect(targetObj.x, targetObj.y, targetObj.width, targetObj.height);
    contxt.fillStyle = "yellow";
    contxt.fillRect(bullet.x, bullet.y, bullet.width, bullet.height);
}

// Event handler
document.addEventListener("keyup", onKeyUp);

function onKeyUp(e)
{
    //console.log(e);
    if (e.code === "Space")
    {
        bullet.velocity = 200;
    }
}