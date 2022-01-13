function toggleTheme() {

    //Find the bootstrap theme <link> tag
    let currentTheme = document.getElementById("theme");

    //Check if the flatly theme is currently in use
    if (currentTheme.getAttribute("href").includes("flatly")) {

        //If so, replace the href with the darkly theme css
        currentTheme.setAttribute("href", "css/bootstrap-darkly-theme.css");

    }
    else {

        //We are currently set to darkly, so toggle us back to flatly
        currentTheme.setAttribute("href", "css/bootstrap-flatly-theme.css");

    }

}//end ToggleTheme()


//Check to see if the browser's theme has been set previously using localstorage
if (localStorage.getItem("jspgtheme") != null) {
    setTheme(localStorage.getItem("jspgtheme"));
}

function setTheme(themeName) {

    let currentTheme = document.getElementById("theme");

    switch (themeName) {

        case "superhero":
            currentTheme.setAttribute("href", "css/bootstrap-superhero-theme.css");
            break;

        case "flatly":
            currentTheme.setAttribute("href", "css/bootstrap-flatly-theme.css");
            break;

        case "darkly":
            currentTheme.setAttribute("href", "css/bootstrap-darkly-theme.css");
            break;

        default:
            break;
    }// end Switch

    localStorage.setItem("jspgtheme", themeName);

}//end Settheme
