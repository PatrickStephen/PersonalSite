//alert() is a method built in to browsers that causes an unstylable popup
//alert("JavaScript is working!");

//Variables can change values and data types (JS is not typesafe)

let x = 10; //Declaration

//Use console.log() to view the value in the inspector
//This will NOT show up on the HTML document -- ONLY in the Console tab in the inspector

console.log(x);

x = 'Hello!'; //Assignment (Reassignment)

console.log(x);

//You can also create variables that are of type var

var z = 100;

//The difference between var and let:
// let is locally scoped -- only available inside of the scope where it is defined
// var is globally scoped -- available throughout the entire script. Var can also be re-declared


//Create a new Date object to display our copyright info
let currentDate = new Date(); //Empty constructor -- for Date objects, this defaults to today's date

console.log(currentDate + ' -- Current Date');

//Create a variable to take ONLY the year from our currentDate object
let currentYear = currentDate.getFullYear();

//Remember that JS is an Object Oriented language. This means that objects have properties (props) that
//are like nouns, as well as methods which are like verbs.
//Above, currentYear was created from the Date() constructor method, which means it can call methods
//in the Date class. The getFullYear() used above is an example of an instance method.

console.log(currentYear + ' -- Current Year');

//Use the value of currentYear as the content to <span id="copyright">
//Create a variable to capture the <span> from the HTML document
let copyright = document.getElementById('copyright');

console.log(copyright);

// To update the content of an element, we can use .textContent
copyright.textContent = currentYear;


// ----------------- ARRAYS -----------------//
// JS Arrays are LIFO --Last In First Out
// JS Arrays do NOT have a set size
// Arrays can be accessed like they would in C# -- with a 0-based index value

let colors = ['blue', 'brown', 'orange', 'pink', 'red', 'green'];

//To add an item to the array, we can use push()
colors.push('purple');

//To remove an item, we can use pop() -- removes the last item in the array()
//colors.pop();

//Select a color from the array and use it as the content for our <strong> tag

//Create a variable fo rhte <strong> tag
let colorStrong = document.getElementById('yourcolor');

//Use .textContent to give a value to the <strong> tag's content
colorStrong.textContent = colors[6];

//BONUS: To change the color of the <strong> tag, we can add inline styling with JS
colorStrong.style.color = colors[6];





// ----------------- Functions -----------------//

//FUnctions are declared with the 'funciton' keyword
//The code inside of ta function will ONLY run when called upon
//in reaction to an event (button click, keystroke, page load, etc.)

//This function will be called when the user submits their favorite color (but clicking a button)
function displayFavoriteColor() {

    //Create a variable to store the user input
    let userFavoriteColor = document.getElementById('tbFavColor').value; //Use .value to get ONLY the text content from the <input>

    //Create a variable for the <span> (output element)
    let colorMessage = document.getElementById('color-message');

    //Update the content of the <span> and display a message
    colorMessage.textContent = userFavoriteColor + ' is my favorite color!';

    //Use JS to add inline-styling to the <span>
    colorMessage.style.backgroundColor = userFavoriteColor;

}//end function displayFavoriteColor()

//Water Weight Function
function calcWaterWeight() {

    //Access the user input
    let nbrGallons = document.getElementById('tbNbrGallons').value;

    //Access output element
    let weightResult = document.getElementById('weight-result');

    //Display the total weight
    weightResult.textContent = nbrGallons + ' gallons of water weighs ' + (nbrGallons * 8.33).toFixed(2) + 'lbs';

}//end Function calcWaterWeight()


//EVENT LISTENER -- Can be used to wire up functions to events, similar to the 'onclick' attribute
//For this example, we removed the 'onclick' attribute from the button in our HTML and are using
//an event listener instead.

//onclick needs the parens after the function name, but addEventListener does not.

let btnCalcWeigth = document.getElementById('btnCalcWeight');
btnCalcWeigth.addEventListener('click', calcWaterWeight);


// ----------------- LOOPING -----------------//

//Systax is the same as C# for: for, while, and do while
//Use a for loop to display 1-10
let loopToTen = document.getElementById('loop-to-ten');

for (var i = 1; i <= 10; i++) {

    //.textContent excapes any HTML characters and prints the as plain text
    //To Render HTML, we can use .innerHTML

    loopToTen.innerHTML += i + '<br/>';

}//end for()


// ----------------- BRANCHING -----------------//

//Systax is the same as C# for if, if/else, and switch

//Create a function that uses a switch to check for milestones
function showSingleMilestone() {

    //User input
    let userAge = document.getElementById('tbUserAgeSingleMilestone').value;

    //Access output element
    let singleMilestone = document.getElementById('single-milestone')

    //Use a switch to check the user age and print a message accordingly

    switch (userAge) {

        case "13":
            singleMilestone.innerHTML = "You are now a <strong>teenager</strong>!";
            break;

        case "18":
            singleMilestone.innerHTML = "You are <em>technically</em> an adult.";
            break;

        case "":
            singleMilestone.innerHTML = "";
            break;

        case "25":
            singleMilestone.innerHTML = "You can <strong>rent</strong> a car!";
            break;

        case "55":
            singleMilestone.innerHTML = "You eligible for <em>AARP</em>.";
            break;

        default:
            singleMilestone.innerHTML = "<strong>Sorry, no milestones for you this year</strong>.";
            break;
    }//end switch

}//end Function

//Event listener to call the milestone function
let btnSingleMilestone = document.getElementById('btnSingleMilestone');
btnSingleMilestone.addEventListener('click', showSingleMilestone);


//Function that uses if/else to display multiple milestones
function showMultipleMilestones() {

    //User Input
    let userAge = document.getElementById('tbUserAgeMultiMilestone').value;

    //Access output element
    let multipleMilestone = document.getElementById('multiple-milestones')

    //If statements to check for milestones and add them to a list
    let listOfMilestones = "<ul>";

    if (userAge >= 55) {
        listOfMilestones += "<li>You are eligible for AARP!</li>";
    }

    if (userAge >= 25) {
        listOfMilestones += "<li>You can rent a car!</li>";
    }

    if (userAge >= 18) {
        listOfMilestones += "<li>You are technically an adult.</li>";
    }

    if (userAge >= 13) {
        listOfMilestones += "<li>You are/were a teenager!</li>";
    }

    if (userAge < 13) {
        listOfMilestones += "<li>Sorry, no milestones for you this year.</li>";
    }

    listOfMilestones += "</ul>";

    multipleMilestone.innerHTML = listOfMilestones;

}//end Function

//Event listener to call the milestone function
let btnMultiMilestones = document.getElementById('btnMultiMileStones');
btnMultiMilestones.addEventListener('click', showMultipleMilestones);


//BONUS: Event listeners with the "Enter" key

document.getElementById('tbUserAgeMultiMilestone').addEventListener('keyup', function (event) {

    //The event parameter is accepting all of the info about the event that occurred in the DOM 
    // 13 is the corresponding keyCode for the "Enter" key
    if (event.keyCode === 13) {
        event.preventDefault(); //prevents default behavior (things like submitting a form, reloading the page, etc.)
        showMultipleMilestones();
    }

});