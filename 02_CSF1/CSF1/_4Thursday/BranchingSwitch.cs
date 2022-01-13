using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _4Thursday
{
    class BranchingSwitch
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Branching: Switch Statements");
            /*
             * Switches are the other form of branching.
             * Not as flexible as IF (don't handle ranges well)
             * But GREAT at exact matching.
             * 
             * SYNTAX:
             * 
             * switch (valueToCheck)
             * {
             *      case TEST:
             *          //code
             *          break;
             *          
             *      default:
             *          //code
             *          break;
             * }
             * 
             * if (valueToCheck == case TEST)
             * else ifs = multiple cases
             * else = default             *
             */
            Console.WriteLine("Enter a number: ");
            short userNumber = short.Parse(Console.ReadLine());

            switch (userNumber)
            {
                case 1:
                    //code
                    Console.WriteLine("You typed 1");
                    break;
                case 2:
                case 3:
                case 4:
                case 5:
                case 42:
                    Console.WriteLine("You typed a 2-5 or 42");
                    //treats multiple cases like ||
                    break;

                default:
                    //optional, has no test, it is like an else
                    Console.WriteLine("You picked something else");
                    break;
            }//end switch

            //IF YOU SEE THE ERROR "CANNOT FALL OUT"
            //You missed a break; (Break the fall)

            //NOTE: Although we did "ranges" (kind of) above, this should
            //indicate that ranges do NOT work well with switches.

            //switches are commonly used for menus!
            Console.WriteLine(@"
Please choose a program to run.
1) Numbers
2) Drawing
3) Water
4) Change
");
            string userOption = Console.ReadLine().ToUpper();

            switch (userOption)
            {
                case "1":
                case "NUMBERS":
                case "N":
                    Console.WriteLine("1,2,3,4,5,6,7, ah, ah, ah");
                    break;

                case "2":
                case "DRAWING":
                case "D":
                    //code to run, could be hundreds of lines of code
                    Console.WriteLine(@"Lookie! I made a sword!

                        o=={::::::::::::::::::::>

                    ");
                    break;//break the fall

                case "3":
                case "WATER":
                case "W":
                    Console.Clear();
                    Console.WriteLine("Water Lab!");
                    //you can copy and paste all of your code
                    //from INSIDE of the svm() for your water lab
                    //into this spot.
                    break;

                case "4":
                case "CHANGE":
                case "C":
                    Console.Clear();
                    Console.WriteLine("Change Lab");
                    //same with water, paste the code from the svm() in change lab
                    break;

                default:
                    Console.WriteLine("Input unrecognized. Please restart the program and try again.");
                    break;

            }//end swith

            Console.WriteLine();
        }//end svm
    }//end class
}//end namespace
