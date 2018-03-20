let canvas = document.querySelector("#canvas");
const aircraft =
{
    width: 24,
    x: canvas.width / 2,
    height: 42,
    y: canvas.height - 42,
    velocity: 100, // px/s
    dir: 0,
}
let isEnd = false;
let asteroids = [];
const images = {
    "asteroid": new Image()
};
images.asteroid.src = "asteroide-junon.jpg";

let contxt = canvas.getContext("2d");
let lastTimeStamp = performance.now();

// Helper
function Rand(a, b)
{
    return Math.floor(Math.random() * (b - a + 1)) + a;
}
//

gameloop();

function gameloop(timeStamp)
{
    const dt = (timeStamp - lastTimeStamp) / 1000; //ms -> s
    lastTimeStamp = timeStamp;
    if (!isEnd)
        requestAnimationFrame(gameloop);
    if (!isNaN(dt))
    {
        update(dt);
        draw();
    }
}

function update(dt)
{
    // spaceship
    // TODO: Out Of Bound
    tmp = aircraft.x + aircraft.velocity * dt * aircraft.dir;
    if (0 <= tmp && tmp <= canvas.width - aircraft.width)
        aircraft.x = tmp;
    // add an asteroid
    if (Math.random() < 1/60)
    {
        asteroids.push(
            {
                x: Rand(0, canvas.width),
                y: -100,
                width: Rand(24, 42),
                height: Rand(24, 42),
                vx: 0,
                vy: Rand(24, 42),
            }
        );
    }
    // move the asteroids
    asteroids = asteroids.filter(obj => obj.y < canvas.height)
    asteroids
        .forEach(obj => {
            obj.x += obj.vx * dt;
            obj.y += obj.vy * dt;
            if (isCollided(obj, aircraft))
            {
                isEnd = true;
            }
        });
}

function draw()
{
    // clear the canvas
    contxt.fillStyle = "black";
    contxt.fillRect(0, 0, canvas.width, canvas.height);
    // spaceship
    contxt.fillStyle = isEnd ? "red" : "lightblue";
    contxt.fillRect(aircraft.x, aircraft.y, aircraft.width, aircraft.height);
    // asteroids
    contxt.fillStyle = "white";
    asteroids.forEach(obj => {
        contxt.fillRect(obj.x, obj.y, obj.width, obj.height);
        contxt.drawImage(images.asteroid, obj.x, obj.y, obj.width, obj.height);
    });
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

// Event handler

document.addEventListener("keydown", onKeyDown);

function onKeyDown(e)
{
    //console.log(e); // 37 39
    if (e.keyCode === 37)
    {
        aircraft.dir = e.keyCode - 38;
    }
    if (e.keyCode === 39)
    {
        aircraft.dir = e.keyCode - 38;            
    }
}

document.addEventListener("keyup", onKeyUp);

function onKeyUp(e)
{
    //console.log(e); // 37 39
    aircraft.dir = 0;
}