using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using SignaturesLibrary;//added for Header()
using System.Threading;

namespace _3Wednesday
{
    class ConsoleColorPicker
    {
        static void Main(string[] args)
        {
            Signature.Header("Colors and Enums");

            #region Exploring ConsoleColors & Enums
            //Enums restrict selection to a specific list of values.
            //They don't contain any functionality, but instead are used
            //to set or modify functionality elsewhere in the application

            //let's use an enum to change the text color:
            Console.ForegroundColor = ConsoleColor.Green;
            Console.WriteLine("Text is now green!");
            //We have to use the values available in the ConsoleColor enum

            //Let's Change the background color.
            Console.BackgroundColor = ConsoleColor.Magenta;
            Console.WriteLine("The background color is Magenta!");

            Console.ResetColor();
            #endregion

            Console.WriteLine("Pick your text color: Green, Blue, Dark Red, Cyan");
            String textColor = Console.ReadLine().ToUpper();

            ConsoleColor iLikeTurtles = ConsoleColor.Green;

            switch (textColor)
            {
                case "G":
                case "Green":
                    Console.ForegroundColor = iLikeTurtles;
                    break;

                case "B":
                case "BLUE":
                    Console.ForegroundColor = ConsoleColor.Blue;
                    break;

                case "DR":
                case "DARKRED":
                    Console.ForegroundColor = ConsoleColor.DarkRed;
                    break;

                case "C":
                case "CYAN":
                    Console.ForegroundColor = ConsoleColor.Cyan;
                    break;

                default:
                    Console.WriteLine("Input not recognized. Resetting color...");
                    Console.ResetColor();
                    break;
            }//end of Switch
            Console.WriteLine("Here is what your text looks like now!");

            //MINI-LAB
            //Now ask them to choose from 2-3 colors for the background
            Console.WriteLine("Pick your background color: dark gray, dark yellow, green");
            String backGroundColor = Console.ReadLine().ToUpper();

            switch (backGroundColor)
            {
                case "DG":
                case "DARKGRAY":
                case "DARKGREY":
                    Console.BackgroundColor = ConsoleColor.DarkGray;
                        break;
                case "DY":
                case "DARYYELLOW":
                    Console.BackgroundColor = ConsoleColor.DarkYellow;
                        break;
                case "G":
                case "GREEN":
                    Console.BackgroundColor = ConsoleColor.Green;
                        break;
                default:
                    break;
            }
            Console.WriteLine("Your background has changed color!");

            //This change only affects output written to individual character cells.
            //To chagne the color of the entire console's background, FIRST, set the color.
            //THEN call the Clear()
            Console.BackgroundColor = ConsoleColor.DarkRed;
            Console.Clear();

            Console.WriteLine("And now, and new console background!");

            //Beep is a static method called from the Console class.
            //It accepts two arguments - an int for the frequency and an
            //int for the duration in milliseconds

            Console.WriteLine("Console Beeps and Sleeps!");
            Console.Beep(360, 125);

            Console.Beep(360, 125);

            /*
             * You can use the Sleep() to pause the execution of the next line
             * of code for a specified number of milliseconds. The Sleep() is part of
             * the "Thread" class in the System namespace. We don't
             * have the Thread class available to use from the FCL by default, so
             * we have to add a using statemnet for System.Threading to access it.
             * (using System.Threading;)
             */

            Thread.Sleep(500);
            Thread.Sleep(167);
            Console.Beep(523, 125);
            Console.Beep(659, 125);
            Thread.Sleep(125);
            Console.Beep(784, 125);
            Thread.Sleep(350);
            Console.Beep(392, 125);
            Thread.Sleep(350);
            Console.Beep(523, 125);
            Thread.Sleep(200);
            Console.Beep(392, 125);
            Thread.Sleep(200);
            Console.Beep(330, 125);
            Thread.Sleep(200);
            Console.Beep(440, 125);
            Thread.Sleep(100);
            Console.Beep(494, 125);
            Thread.Sleep(100);
            Console.Beep(466, 125);
            Thread.Sleep(42);
            Console.Beep(440, 125);
            Thread.Sleep(125);
            Console.Beep(392, 125);
            Thread.Sleep(100);
            Console.Beep(659, 125);
            Thread.Sleep(100);
            Console.Beep(784, 125);
            Thread.Sleep(100);
            Console.Beep(880, 125);
            Thread.Sleep(100);
            Console.Beep(698, 125);
            Console.Beep(784, 125);
            Thread.Sleep(100);
            Console.Beep(659, 125);
            Thread.Sleep(100);
            Console.Beep(523, 125);
            Thread.Sleep(100);
            Console.Beep(587, 125);
            Console.Beep(494, 125);
            Thread.Sleep(100);
            Console.Beep(523, 125);
            Thread.Sleep(250);
            Console.Beep(392, 125);
            Thread.Sleep(250);
            Console.Beep(330, 125);
            Thread.Sleep(250);
            Console.Beep(440, 125);
            Thread.Sleep(125);
            Console.Beep(494, 125);
            Thread.Sleep(125);
            Console.Beep(466, 125);
            Thread.Sleep(42);
            Console.Beep(440, 125);
            Thread.Sleep(125);
            Console.Beep(392, 125);
            Thread.Sleep(125);
            Console.Beep(659, 125);
            Thread.Sleep(125);
            Console.Beep(784, 125);
            Thread.Sleep(125);
            Console.Beep(880, 125);
            Thread.Sleep(125);
            Console.Beep(698, 125);
            Console.Beep(784, 125);
            Thread.Sleep(125);
            Console.Beep(659, 125);
            Thread.Sleep(125);
            Console.Beep(523, 125);
            Thread.Sleep(125);
            Console.Beep(587, 125);
            Console.Beep(494, 125);
            Thread.Sleep(375);
            Console.Beep(784, 125);
            Console.Beep(740, 125);
            Console.Beep(698, 125);
            Thread.Sleep(42);
            Console.Beep(622, 125);
            Thread.Sleep(125);
            Console.Beep(659, 125);
            Thread.Sleep(167);
            Console.Beep(415, 125);
            Console.Beep(440, 125);
            Console.Beep(523, 125);
            Thread.Sleep(125);
            Console.Beep(440, 125);
            Console.Beep(523, 125);
            Console.Beep(587, 125);
            Thread.Sleep(250);
            Console.Beep(784, 125);
            Console.Beep(740, 125);
            Console.Beep(698, 125);
            Thread.Sleep(42);
            Console.Beep(622, 125);
            Thread.Sleep(125);
            Console.Beep(650, 125);
            Thread.Sleep(167);
            Console.Beep(1050, 125);
            Thread.Sleep(125);
            Console.Beep(1050, 125);
            Console.Beep(1050, 125);
            Thread.Sleep(625);
            Console.Beep(784, 125);
            Console.Beep(740, 125);
            Console.Beep(698, 125);
            Thread.Sleep(42);
            Console.Beep(622, 125);
            Thread.Sleep(125);
            Console.Beep(659, 125);
            Thread.Sleep(167);
            Console.Beep(415, 125);
            Console.Beep(440, 125);
            Console.Beep(523, 125);
            Thread.Sleep(125);
            Console.Beep(440, 125);
            Console.Beep(523, 125);
            Console.Beep(587, 125);
            Thread.Sleep(250);
            Console.Beep(622, 125);
            Thread.Sleep(250);
            Console.Beep(587, 125);
            Thread.Sleep(250);
            Console.Beep(523, 125);



        }
    }
}
