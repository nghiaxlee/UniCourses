const a = [[3, 0, 0, 5, 0], [-1, 1, 4, 4, 0], [0, 0, 4, 2, -2], [3, 3, 10, -3, 1], [7, 9, 2, 2, 9]];

function TaskB(a)
{
    return a[0].filter(num => num != 0);
}

function TaskC(a)
{
    return Math.max(...[].concat(...a));
}