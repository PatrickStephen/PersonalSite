using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _5Friday
{
    class LoopingWhile
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Looping While!");

            /*While loop - best for when you want to run code             * an indeterminable number of times             * (0 to ???)             *              * COUNTER             *              * while (CONDITION)             * {             *      //code to run             *      UPDATE             * }             */
            int cookie = 1;//COUNTER

            while (cookie <= 5)//CONDITION -- NO SEMICOLONS
            {
                //code to run
                Console.WriteLine("Yum! You have eaten " + cookie);
                //update
                cookie++;//UPDATE
            }//end WHILE

            //long number = 1;//COUNTER

            //while (number > 0)//CONDITION
            //{
            //    Console.WriteLine(number);
            //    number++;//UPDATE
            //}//end WHILE
            //Because you can set the update conditionally,
            //it is easy to forget it... or to accidentally
            //create and infinite loop by using a bad condition

            //virtually every tim eyou have an infinite loop,
            //you wrote the condition wrong.

            //MINI-LAB!
            //Write a while loop that starts with 10 bags of groceries
            //and counts down as they are unloaded until there are non remaining.

            //COUNTER

            //while(CONDITION)
            //{
            //UPDATE
            //}

            int groceryBag = 10;
            while (groceryBag > 0)
            {
                Console.WriteLine("You have {0} bags left. ", groceryBag);
                groceryBag--;
            }//end WHILE

            //IT is most common to use a while loop with a BOOL
            //for a counter as this allows us to conditionally
            //chage the bool for when we want to exit the loop.

            bool moreBags = true;//COUNTER

            while (moreBags)
            {
                Console.WriteLine("\nYou have succesfully unloaded some groceries. ");
                //ask the user if they have more bags.
                //if not, we are done.
                Console.Write("Do you have any more bags? Y/N: ");
                ConsoleKey userAnswer = Console.ReadKey(false).Key;

                if (userAnswer == ConsoleKey.N)
                {
                    moreBags = false;//UPDATE
                }//end IF
            }//end WHILE
            Console.WriteLine("\nGood job unloading those groceries, Bass.");

            //PROGRAMMER REAL WORLD EXAMPLE            //for Loops are great for a specific number of times to loop            //They are ideal when you know the COUNT            //While loops are great for an indeterminable number of times            //They are ideal when you know the CONDITION

            Console.Write("Would you like to play a game? Y/N:");
            ConsoleKey runProgram = Console.ReadKey(false).Key;//COUNTER

            while (runProgram == ConsoleKey.Y)
            {
                Console.WriteLine("\nYou win!!");

                Console.Write("Play again? Y/N: ");
                runProgram = Console.ReadKey(false).Key;//UPDATE
            }//end WHILE
            Console.WriteLine();

            Console.WriteLine();
        }//end svm
    }//end class
}//end namespace
