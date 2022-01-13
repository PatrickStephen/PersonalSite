//Variables needed to keep track of the player, aliens, and keys

var ninja = {
    speed: 256
};

var alien = {

};

var aliensCaught = 0;

var keysDown = {

};

//                                            (e) is shorthand for event
document.addEventListener("keydown", function (e) {
    keysDown[e.keyCode] = true;

    //Stop the keys from scrolling the browser window
    e.preventDefault();
});

document.addEventListener("keyup", function (e) {
    delete keysDown[e.keyCode];

    //Stop the keys from scrolling the browser window
    e.preventDefault();
});

var gameboard = document.getElementById("gameboard");
var score = document.getElementById("score");

//Alien Element <img>
var alienElement = document.getElementById("alien");
alienElement.style.display = "inline-block";
alienElement.style.position = "absolute";

//Write a function to be called on reload/first load to grab the alien and place it on the game board
var reload =

    function () {
        alien.x = 32 + (Math.random() * (gameboard.offsetWidth - 64));
        alien.y = 32 + (Math.random() * (gameboard.offsetHeight - 64));

        alienElement.style.top = alien.y + "px";
        alienElement.style.left = alien.x + "px";

        score.textContent = aliensCaught;

    }

//Ninja Element <img>
var ninjaElement = document.getElementById("ninja");

//Write a function to set the ninja in the starting postition, then call the reload to place the alien
var set = function () {

    ninja.x = gameboard.offsetWidth / 2;
    ninja.y = gameboard.offsetHeight / 2;

    ninjaElement.style.left = ninja.x + "px";
    ninjaElement.style.top = ninja.y + "px";

    reload(); // This gets alien on the screen for the first time

}
//The var and set function above help us move the ninja around on the screen

//Write a function to update/"redraw" our ninja
var update = function (modifier) {

    //W (up)
    if (87 in keysDown) {
        ninja.y -= ninja.speed * modifier;
        ninjaElement.style.top = ninja.y + "px";
    }

    //A (left)
    if (65 in keysDown) {
        ninja.x -= ninja.speed * modifier;
        ninjaElement.style.left = ninja.x + "px";
        ninjaElement.style.transform = "scaleX(-1)"; //Make our Ninja face left
    }

    //S (down)
    if (83 in keysDown) {
        ninja.y += ninja.speed * modifier;
        ninjaElement.style.top = ninja.y + "px";
    }

    //D (right)
    if (68 in keysDown) {
        ninja.x += ninja.speed * modifier;
        ninjaElement.style.left = ninja.x + "px";
        ninjaElement.style.transform = "scaleX(1)"; //Make our Ninja face right
    }

    if (ninja.x <= (alien.x + 32) && alien.x <= (ninja.x + 32) && ninja.y <= (alien.y + 32) && alien.y <= (ninja.y + 32)) {
        ++aliensCaught;
        reload();
    }

}//end var function

//Write a function to calculate the movement and adjust accordingly
var main = function () {

    //Note the time
    var now = Date.now();
    var delta = now - then;

    update(delta / 1000);

    //Note the time
    then = now;

    //requestAnimationFrame is a function built into JS that helps execute animations in
    //an efficient and optimized manner. (smooth instead of jerky movements)
    requestAnimationFrame(main);

}

//Note the time
var then = Date.now();

set();
main();