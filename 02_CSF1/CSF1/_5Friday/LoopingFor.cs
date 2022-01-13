using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _5Friday
{
    class LoopingFor
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Looping with FOR");
            Console.Title = "-========= LOOPING WITH FOR =========- ";

            /*
             * FOR LOOP SYNTAX
             * 
             * for (COUNTER; CONDITION; UPDATE)
             * {
             *      //code to run
             * }
             * 
             * Some books refer to COUNTER as INITIALIZER
             * //! Mnemonic device: ICU 
             * 
             * Counter - the starting point where you initailize a 
             * variable that is used to check the condition. The 
             * counter gets updated after each pass through the loop.
             *
             * Condition - A Boolean statement that tells the loop
             * when to stop. It is checked before each pass.
             * 
             * Update - the change to the counter after each 
             *          pass of the loop (increment, decrement, etc.)
             * 
             * Remember: a for loop is best used when you know exactly 
             *           how many times you want to run the code
             *           
             * For loops are common and useful in many algorithms 
             * and methods in the C# language
             */

            for (int candyBar = 1; candyBar <= 7; candyBar++)//unary operator
            {
                Console.WriteLine("Yum! You have had {0} candy bar{1}",
                    candyBar,
                    candyBar ==1 ? "" : "s");//ternary operator
            }// end FOR LOOP

            //start with 3 grapes and eat until you have had 15
            //eat 3 at at time.
            //candyBar++ == candyBar += 1 == candyBar = candyBar + 1
            for (int grapes = 3; grapes <= 15; grapes += 3)
            {
                //could have written the update as
                //grapes = grapes + 3
                Console.WriteLine("You ate 3 grapes and have now had " + grapes);
            }//end of FOR LOOP

            //count to 20, but skip 13
            for (int count = 1; count <= 20; count++)
            {
                if (count != 13)
                {
                    Console.WriteLine(count);
                }
                
            }//end FOR LOOP

            //the continue keyword stops the current iteration of the loop
            //and moves on to the the next iteration.
            //Let's do the same example above, but with continue:

            for (int count = 1; count <= 20; count++)                
            {
                if (count == 13)
                {
                    continue;
                }
                Console.WriteLine(count);
            }//end FOR LOOP

            //From user input
            Console.Clear();
            Console.Write("\nHow many cookies do you want? ");
            int userCookies = int.Parse(Console.ReadLine());

            for (int cookie = 1; cookie <= userCookies; cookie++)
            {
                Console.WriteLine("You ate a cookie! " + cookie);
            }//end FOR LOOP


            //Running Total Variables
            //Create a variable in an outer scope. This allows you
            //to use it and make changes to it inside of an inner scope.

            //start by creating a running total varaiable.
            //This can be a numeric type, or a string that you just
            //tack info onto.

            string listOfNames = ""; //empty string

            Console.WriteLine("\n\nREGISTRACTION\n");
            Console.Write("How many people would you like to " +
                "register for Comic Con? ");
            int totalReg = Convert.ToInt32(Console.ReadLine());

            for (int reg = 0; reg < totalReg; reg++)
            {
                Console.Write("Please enter a name: ");
                listOfNames += Console.ReadLine() + "\n";
            }//end

            Console.WriteLine($"\nYou have registered:\n{listOfNames}");

            //another example
            decimal[] prices = { 15.95m, 9.99m, 20, 10, 9.75m };

            for (int i = 0; i < prices.Length; i++)
            {
                Console.WriteLine("At the index of {0} is {1:c}",
                i,
                prices[i]);
            }//end FOR LOOP

            Console.WriteLine("The total is: {0:c}", prices.Sum());


            

            Console.WriteLine();
        }//end svm
    }//end class
}//end namespace
