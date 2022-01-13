using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _1Monday
{
    class DataTypes
    {
        static void Main(string[] args)
        {
            Console.WriteLine("DataTypes: Bob Sure Is Loving");

            //To get this to run, we have to set the start-up object.
            //Right Click on the project and go to properties.
            //Under startup object, select the proper class file.

            //declare
            byte byteNbr;

            //initialize
            byteNbr = 0;

            //reassign
            byteNbr = 255;

            //declare and initialize
            short shortNbr = -1234;
            int intNbr = 12392823;
            long longNbr = 23499033389034;

            //The name of the variable can be anything you want.
            //However, good convention says that variable names are descriptive of what you are storing or how the variable will be used.
            //Ex: store shoes in a box called shoebox

            //use C# lesser used integer variants
            sbyte sbyteNbr = -7;

            //ushort, uint, ulong
            //MINI-LAB! Declare and initialize a ushort, uint, and ulong

            ushort ushortNbr = 7;
            uint uintNbr = 7;
            ulong ulongNbr = 7;

            //int someInt = 23.7;
            //Without casting, we can't put this value into an int
            //With casting, it would truncate into a whole number
            //(chop off the decimal value)

            //FLOATING POINT TYPES:

            //Floating point types support decimal values
            float smallFraction = 12.2f;//32 bits, 45 digits after the decimal
            double mediumFraction = 22.9;//64 bits, 324 digits after the decimals
            decimal largeFraction = 932.7m;//128 bits, 29 digits after the decimals
            //Decimal is considered the highest accuracy

            //Float - use the f suffix. Can be f or F, .NET has a shortcut for both
            //Decimal - only works with m or M (MONEY)
            //Double - no suffix needed, because .NET sees a floating point value as a double by default

            Console.WriteLine("Calculation Result: " +
                (smallFraction / 2));

            //Boolean (bool) accepts only values of true or false
            // no quotes... quotes are for a string

            bool isTheDoctor = false;

            Console.WriteLine("Are you the doctor? " + isTheDoctor);

            isTheDoctor = true;
            //reassigned!

            Console.WriteLine("Are you the doctor? " + isTheDoctor);

            //The Char datatype accepts only a single type-able character value in single quotes 'c'
            char letter = 'A';
            //char someLetter = "A";  //No Double Quotes
            //char someLetters = 'abc';  // No Multi characters
            char symbol = '%';

            Console.WriteLine("symbol is: " + symbol + " and letter is " + letter);

            //strings - accept any number of characters in double quotes
            string firstName = "James";
            Console.WriteLine(firstName);

            string lastName = "Bond";
            Console.WriteLine(lastName);

            //with some creative concatenation we can do a little formatting of our string outputs
            Console.WriteLine(firstName + " " + lastName);
            Console.WriteLine(firstName + ' ' + lastName);

            //MINI-LAB! Use concatenation to write out James Bond's signature introduction

            Console.WriteLine("The name's " + lastName +". " + firstName + " " + lastName + "!");



        }//end svm
    }//end class
}//end namespace
