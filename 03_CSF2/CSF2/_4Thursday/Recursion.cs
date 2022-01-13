using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _4Thursday
{
    class Recursion
    {
        static void Main(string[] args)
        {
            /*
             * * Recursion is similar to looping. It allows work             * to be performed repeatedly until a condition             * is no longer being met.             * Simple definition: "recursion is a method that calls              * on itself until some condition is met".
             * 
             * * In the example below, we will create a method that              * counts down from a value that the user defines. We              * then will call the recursive method, passing in the              * user-defined parameter.
             * 
             * * If the value the user passes in is not 0, the              * RecursiveCountdown() will return the              * RecursiveCountdown() method (calling its action              * again), but this time with the user passed value              * being 1 less than its previous value.
             */

            Console.Write("Enter a value that you would like to count down from: ");

            RecursiveCountdown(int.Parse(Console.ReadLine()));
            //We are parsing this to an int so we can pass it to the method.

        }//end main
        
        private static int RecursiveCountdown(int value)
        {
            if (value == 0)
            {
                Console.WriteLine("Value is finally " + value);
                return value;
            }//end if
            else
            {
                Console.WriteLine("RecursiveCountdown() is called and " +
                    "the current value is " + value);
                return RecursiveCountdown(value - 1);
            }//end else
        }//end RecursiveCountdown()

    }//end class

}//end svm
