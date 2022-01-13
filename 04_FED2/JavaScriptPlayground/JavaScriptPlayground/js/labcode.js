//******* MAD LIBS *******//
function madLibsAnswers() {
    //User Input
    let foreignCountry = document.getElementById('tbForeignCountry').value;
    let adjective = document.getElementById('tbAdjective').value;
    let animal = document.getElementById('tbAnimal').value;
    let verb = document.getElementById('tbVerb').value;
    let place = document.getElementById('tbPlace').value;
    let typeOfLiquids = document.getElementById('tbTypeOfLiquids').value;

    //Output
    let madLib = document.getElementById('mad-lib');

    //Display
    madLib.textContent = 'If you are traveling in ' + foreignCountry + ' and find yourself having to cross a piranha-filled river, here"s is how to do it safely. Piranhas are more ' + adjective + ' during the day, so cross the river at night. Avoid areas with netted ' + animal + ' traps - piranhas may be waiting there looking to ' + verb + ' them! Piranhas are attracted to fresh ' + typeOfLiquids + ' and will migrate to it as often as possible. Whatever you do, if you have an open wound, try to find another way to get back to the ' + place;
}

let btnMadLibAnswers = document.getElementById('btnMadLibAnswers');
btnMadLibAnswers.addEventListener('click', madLibsAnswers);

//******* MAD LIBS *******//
let multiplesOfSeven = document.getElementById('multiples-of-seven');

//******* Multiples *******//
for (var i = 1; i <= 30; i++) {
    multiplesOfSeven.innerHTML += i * 7 + '<br/>';
}//end for


//******* CELCIUS CONVERSION *******//

//Water Weight Function
function calcCToF() {

    //Access the user input
    let nbrCelsius = document.getElementById('tbCelsiusConverter').value;

    //Access output element
    let tempResult = document.getElementById('celsius-coverter');
    console.log(tempResult)

    //Display the total weight
    tempResult.innerHTML = nbrCelsius + 'C&#176; is ' + (nbrCelsius * 9 / 5 + 32) + '&#176;F';

}//end Function calcWaterWeight()

let btnCelsiusConverter = document.getElementById('btnCelsiusConverter');
btnCelsiusConverter.addEventListener('click', calcCToF);
