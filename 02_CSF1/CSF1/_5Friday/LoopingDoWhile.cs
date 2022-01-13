using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _5Friday
{
    class LoopingDoWhile
    {
        static void Main(string[] args)
        {
            Console.WriteLine("The DO WHILE Loop");

            /* Do While Loop - best for when you want to run code
             * an indeterminable number of times BUT
             * at least once!!!
             * (1 to ???)
             * 
             * COUNTER
             * 
             * do
             * {
             *      //code to run
             *      UPDATE
             *      
             * } while (CONDITION);
             */
            int cookie = 1;//COUNTER

            do
            {
                Console.WriteLine("Yum! You have had " + cookie);
                cookie++;//UPDATE
            } while (cookie <=5);//Condition, don't forget the semicolon ;

            //A bad do while
            Console.WriteLine("\nDo you want to run this program?");
            string runProgram = Console.ReadLine().ToUpper();

            do
            {
                Console.WriteLine("Success!! Program is running");
                //could be hundreds of lines of code.

                Console.WriteLine("Keep going? ");
                runProgram = Console.ReadLine().ToUpper();
            } while (runProgram == "Y" || runProgram == "YES");
            //end WHILE

            //The ABOVE program is a logic error! A do while will
            //always run once. The example should have been a WHILE loop not  a DO WHILE loop.

            //Real world Ex:
            bool repeat = true;
            //Generally, you write a while or do while to run forever,
            //and you just deal with when the user wants to stop.
            //The above bool is our counter.

            do
            {
                //Because they always run once, Do whiles are best for menus!
                Console.WriteLine("-= Wekk Ant Eeru Phone Company =-");
                Console.WriteLine(@"
B) Bill
P) Payment
S) Service
X) Exit
");
                string userChoice = Console.ReadLine().ToLower();

                //clear console after input
                Console.Clear();

                switch (userChoice)
                {
                    case "b":
                    case "bill":
                        Console.WriteLine("Your balance is $500.00\n\n");
                        break;

                    case "p":
                    case "payment":
                        Console.WriteLine("Your payment is pending...\n\n");
                        break;

                    case "s":
                    case "service":
                        Console.WriteLine("We will be there in 1-30 days. " +
                            "Someone must be present when we arrive.\n\n");
                        break;

                    case "x":
                    case "e":
                    case "exit":
                        Console.WriteLine("Thank you for calling.");

                        //stop the loop                        
                        repeat = false;//update
                        break;

                    default:
                        Console.WriteLine("That was not a valid option.\n" +
                            "A $5 invalid option fee has been applied to your bill.");
                        break;
                }//end SWITCH
            } while (repeat);

        Console.WriteLine();
        }//end svm
    }//end class
}//end namespace
