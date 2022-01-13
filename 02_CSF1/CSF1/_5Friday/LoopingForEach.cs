using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _5Friday
{
    class LoopingForEach
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Looping for FOREACH");
            Console.Title = "LOOPING WITH FOREACH";

            /* FOREACH is a specialized loop made for collections.
             * It provides READONLY access
             * You can see the values in the collection, but you
             * can NOT change them in a foreach.
             * 
             * foreach (DATATYPE MADEUPNAME in COLLECTION)
             * {
             *      //code to run with MADEUPNAME
             * }
             * 
             * This is the easiest, least error-prone loop. 
             * It is preferred in many program contexts,
             * but we lose some flexibility with it.
             * 
             * The foreach-loop is versatile.
             * We will end up using them in strings,
             * string arrays, and even DataTables.
             */

            string[] colors = { "red", "blue", "green", "purple", "black", "pink" };
            foreach (string color in colors)
            {
                Console.WriteLine(color);
                //color = "red";
                //READONLY. You cannot change the values in a foreach.
            }//end FOREACH


            int[] gradeScores = { 100, 80, 42, 75, 2 };

            //gradeScores.ToString() == System.Int32[]
            foreach (int score in gradeScores)
            {
                Console.WriteLine(score);
            }//end FOREACH

            decimal[] cartPrices = { 12.99m, 2, 9.99m, 10, 20 };
            //MINI-LAB!
            //print out each price with a foreach structure using currency formatting

            foreach (decimal price in cartPrices)
            {
                Console.WriteLine($"The price of the item is {price:c}");// or "the price of the item is " + price.ToString("c")
            }//end FOREACH

            //Let's total up all of the prices in the cart.
            //Create a running total variable so we can
            //pring out the total AFTER the FOREACH

            decimal totalSale = 0;//ALWAYS give a running total variable a default or starting value

            Console.WriteLine("\nThank you for purchasing from WeRPRogrammers\n");
            foreach (decimal price in cartPrices)
            {
                totalSale += price;
                //totalSale = totalSale + price;
                //either of the above works... but only choose one
                Console.WriteLine($"After adding {price:c}, the total is now: {totalSale:c}");

            }//end FOREACH

            Console.WriteLine($"\nYour total purchase is: {totalSale:c}");

            //remember, a string is a COLLECTION of characters (chars)
            string letters = "abcdefghijklmnopqrstuvwxyz";

            foreach (char letter in letters)
            {
                Console.WriteLine(letter);
            }//end FOREACH
            Console.WriteLine(letters.Length + " total letters");

            Console.WriteLine();
        }//end svm
    }//end class
}//end namespace
