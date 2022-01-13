using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _1Monday
{
    class Variables
    {
        static void Main(string[] args)
        {
            // Adding // at the start of a line allows you to write a single line comment, which will be ignored by the compiler.

            //The Main() = The Main"method" is where a C# console application starts to execute.
            //It is the entry point.

            /*
                 * In Visual Studio, the solution is a collection / portfolio of projects. The projects are like a roadmap detailing how things relate to one another.
                 * 
                 * .NET supports 3 kinds of applications:
                 * 1. Windows- Console applications are what we'll be using in CSF
                 * 2. Web Applications - This is where most of your track will focus.
                 * 3. Web Services - These are distributed applications.
                 * 
                 * 3 steps to running a program
                 * 1. Save (CTRL + S)
                 * 2. Build (CTRL + SHIFT + B)
                 * 3. Run (CTRL + F5)
                 * Fortunately, (CTRL + F5) does all 3 steps at once!
             */

            Console.WriteLine("Hello, World!");

            /*
                 C# ignores whitespace EXCEPT for inside of a string (red words in ""), whics meand you CANNOT intuitively break a string into 2 lines.

                 VARIABLES:
                 A variable is just a container to hold info. Just like any other container, its contents can be changed. Since C# is a type-safe language, all variables must have an assigned datatype.
                 The datatype cannot be changed in the code (programmatically).

                Decleration: Creating the variable. This requires a datatype and a name.

                Assignment: Giving a variable a value, or changing the value.

                Initialization: Assigning the value the FIRST time.
             */

            int firstExample; // Declaration
            
            //string firstExample; cannot uses 2 in 1 curly bracket

            firstExample = 1;   // Initialization

            firstExample = 2;   // Assignment

            //Often, we can declare and initialize in the same line

            string name = "Harry Potter";

            Console.WriteLine(name);

            name = "Prime Minister";    // (Re) assignment

            Console.WriteLine(name);

            int bigNbr; // Declared a new variable

            bigNbr = 55321;
            //Don't use commas for numbers

            Console.WriteLine(bigNbr);
            Console.WriteLine(55321);
            Console.WriteLine("55321");

            //All 3 display the same result, but they are all different.

            Console.WriteLine("Add two ints");
            Console.WriteLine(17 + 25);

            Console.WriteLine("Add two strings");
            Console.WriteLine("17" + "25");
            //String Concatenation - Adding (pasting) two strings together.

            int kuBasketballPts = 1068;
            int muBasketballPts = 1003;

            Console.WriteLine("KU Scored " + kuBasketballPts + " points in 15 games.");
            Console.WriteLine("Total KU & MU Points: "
                + (kuBasketballPts + muBasketballPts));

            /*
             * The () around the numeric calculation trumps the default order of operations and makes sure the concatenation happens AFTER the calculation
             */

            #region Variable Name Requirements
            /*
             * Variable names can ONLY begin with alphabetic characters or underscores_
             * 
             * AFTER the first character, you can use alpha, numeric, or underscores with the following limitations:
             * - They cannot contain spaces
             * - They must contain at least 1 alpha or numeric character
             * - They cannot be a C# reserved keyword (blue font)
             * - They MUST be unique within their scope {}
             */
            #endregion

            //int kuBasketballPts = 1168;
            // The previous line is no good!

            //EITHER:
            //A. You were trying to create a new variable with the same name
            //B. You were trying to reassign kuBasketballPts with a new value.

            kuBasketballPts = 1168;

            //Constants are like variables whose value never change.
            //They must have a value assigned at declaration. That Value cannot be changed later in the code(programatically)

            const int MEANING_OF_LIFE = 42;
            //MEANING_OF_LIFE = 43;
            //You can still use constants just like variables:

            Console.WriteLine("The answer to life is " + MEANING_OF_LIFE);

            //If you're creaing multiple variables, some syntax works better than others.

            //Declare several variables and then initialize them individually.
            int steves, endermen, pigs, creepers, zombies;
            //datatype, then the names of the variables of that type comma seperated.

            steves = 1;
            zombies = 2;
            endermen = 5;
            pigs = 12;
            creepers = 6;
            // initaialized out of order, that's okay.

            //Declare several variables, and initialize just one (or all of them)
            int coaches = 2, players = 53, cheerleaders = 16;
            //When declaring multiple variables, you CANNOT mix datatypes
            //int mlsTeams = 19, mlsChampions = "Sporting KC";
            //int mlsTeams = 19, string mlsChampions = "Sporting KC";
            int mlsTeams = 19; string mlsChampions = "Sporting KC";

            //MINI-LAB! --Write a sentence to the console using both variables from the line above with Concatenation.

            Console.WriteLine("There is " + mlsTeams + " mls teams with " +  coaches + " coaches each");
            Console.WriteLine("The number of mls teams is " + mlsTeams + " And the mls champions are " +  mlsChampions);

        }// end Main()
    }// end Class
}// end Namespace
