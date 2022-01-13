function validateForm(event) {

    //Gather all of the HTML controls into a collection instead of creating a separate variable for each
    let controls = document.getElementsByClassName('form-control');

    //Gather all of our validation areas (<span>s) the same way
    let validationMessages = document.getElementsByClassName('invalid')

    //Regular Expression (RegExp) object for Email
    let rxpEmail = new RegExp(/^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/);

    //Regular Expression (RegExp) object for Name
    let rxpName = new RegExp(/^[A-Z]+$/i);

    //Check the length of ALL controls -- if any of them HAVE not been filled out, stop the form from submitting
    if (controls['name'].value.length == 0 || controls['email'].value.length == 0 || controls['subjects'].value.length == 0 ||
        controls['message'].value.length == 0 || !rxpEmail.test(controls['email'].value) || !rxpName.test(controls['name'].value)) {

        //Stop form from submitting
        event.preventDefault();

        //Check the individual controls and display and error message if needed

        //------------ NAME VALIDATION -------------//
        
        //LENGTH
        if (controls['name'].value.length == 0) {
            validationMessages['rfvName'].textContent = "* Name is required";
        }
        else {
            validationMessages['rfvName'].textContent = "";
        }
        //REGEXP
        if (!rxpName.test(controls['name'].value) && controls['name'].value.length > 0) {
            validationMessages['rfvName'].textContent = "* Name must only include alphabetical characters.";
        }
        if (rxpName.test(controls['name'].value) && controls['name'].value.length > 0) {
            validationMessages['rfvName'].textContent = "";
        }
        
        //------------ EMAIL VALIDATION -------------//

        //LENGTH
        if (controls['email'].value.length == 0) {
            validationMessages['rfvEmail'].textContent = "* Email is required";
        }
        else {
            validationMessages['rfvEmail'].textContent = "";
        }

        //REGEXP
        if (!rxpEmail.test(controls['email'].value) && controls['email'].value.length > 0) {
            validationMessages['rfvEmail'].textContent = "* Please enter a valid email address.";
        }
        if (rxpEmail.test(controls['email'].value) && controls['email'].value.length > 0) {
            validationMessages['rfvEmail'].textContent = "";
        }

        //------------ SUBJECT VALIDATION -------------//

        //LENGTH
        if (controls['subject'].value.length == 0) {
            validationMessages['rfvSubject'].textContent = "* Subject is required";
        }
        else {
            validationMessages['rfvSubject'].textContent = "";
        }

        //------------ MESSAGE VALIDATION -------------//

        //LENGTH
        if (controls['message'].value.length == 0) {
            validationMessages['rfvMessage'].textContent = "* Message is required";
        }
        else {
            validationMessages['rfvMessage'].textContent = "";
        }
 
    }

}