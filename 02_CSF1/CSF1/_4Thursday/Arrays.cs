using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _4Thursday
{
    class Arrays
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Arrays!");
            /*
             * An array stores a fixed-size sequential collection of 
             * objects of the same type. 
             * 
             * An array is used to store a collection of 
             * data, but it is often more useful to think of an array as 
             * a collection of variables of the same type.
             * 
             * Standard Arrays: 
             * 
             * - Have a fixed size (can't change it programmatically)
             * - The size is called the Length (1-based counting)
             * - Uses 0-based counting for the positions of the indexes.
             * - Type safe
             * - Use the "new" keyword to call the "constructor" that builds the object
             */

            //One way to create an array: second way is on line 135
            //declare with a set Length (1-based counting!)
            string[] dresser = new string[4];
            //string array called dresser and assigned it the Length of 4.

            //Now initialize the values individually.
            //You must initialize before you can use them.
            //You can initialize in any order.
            dresser[0] = "shirts";//in the drawer with an index of 0, put "shirts"
            dresser[1] = "pants";
            dresser[3] = "socks";
            dresser[2] = "shorts";

            //Each of the indexes called by dresser[indexNumber]
            //is a variable that you can use in your program.

            Console.WriteLine($"{dresser[2]} are in the drawer with an index of 2");

            //MINI-LAB!
            //Write out the final index to the screen using string interpolation.

            Console.WriteLine($"{dresser[3]} are in the drawer with an index of 3");
            Console.WriteLine($"{dresser[dresser.Length - 1]} are in the drawer with the index of " +
                $" {dresser.Length - 1}");

            //You can reassign the drawers (indexes) of an array just like normal variables.
            dresser[3] = "t-shirts";
            Console.WriteLine($"{dresser[3]} are in the 4th drawer with an index of 3");

            Console.WriteLine("{0} is in index 1, and {1} is in index 2",
                dresser[1],
                dresser[2]);

            //To explore an object in intellisense, use a period.
            Console.WriteLine(dresser.Length + " is the length of the array.");
            //The first index is ALWAYS 0
            Console.WriteLine("The first item is " + dresser[0]);
            //The last index is ALWAYS 1 less than the Length
            Console.WriteLine("The last item is " + dresser[dresser.Length - 1]);

            //Another array, created the long way.
            //The long way is best if you don't know what all
            //you want to put in the boxes.
            //You must still know exactly how many boxes you need!

            decimal[] prices = new decimal[5];
            //Generally, collections have a pluralized name.

            prices[0] = 24.99m;
            prices[1] = 100;
            prices[2] = 50;
            prices[3] = 9.75m;
            //prices[6] = 200; // You will get a runtime error
            //for outside the bounds if you try to access or use
            //an index that cannot exist.
            prices[4] = 199;

            //Just like the string array, you can write a single index's value
            // to the screen for all array types.
            Console.WriteLine(prices[1]);

            //But you cannot write the entire collection from its name.
            Console.WriteLine(prices);// logic error System.Decimal[]

            //The compiler does not know how to format complex datatypes.
            //By default, attempting to print a complex datatype to the 
            //screen will result in an output of
            //namespace.className where that datatype is defined.

            //You can use each item in calculations.
            //decimal totalSale =
            //prices[0] + prices[1] + prices[3] + prices[4]; //This way is dumb and too long

            decimal totalSale = prices.Sum();//instance method

            Console.WriteLine($"Total Sale: {totalSale:c}");//c is currency formating

            Console.WriteLine($"\nPrices has {prices.Length} indexes." +
                $"\n1st index holds {prices[0]:c} and the last index holds " +
                $"{prices[prices.Length - 1]:c}");

            //Sort() is called from the Array class (static method)
            //It sorts the indexes of the specified array from the lowest
            //to highest value by number or from a-z for alphas. It
            //is referred as an "Ascending Sort", as it ascends from
            //losest to highest value.
            //SYNTAX: Array.Sort(arrayToSort)
            Array.Sort(prices);
            Console.WriteLine($"\nPrices has {prices.Length} indexes." +
                $"\n1st index holds {prices[0]:c} and the last index holds " +
                $"{prices[prices.Length - 1]:c}");

            Console.WriteLine();

            //To get a descending sort (highest to lowest)
            //There is no direct method.
            //You first have to Array.Sort()
            //and then run Array.Reverse() which flips the contents of the indexes

            Array.Reverse(prices);
            Console.WriteLine($"\nPrices has {prices.Length} indexes." +
                $"\n1st index holds {prices[0]:c} and the last index holds " +
                $"{prices[prices.Length - 1]:c}");

            //The second way to declare an array
            //Declare and initialize an array.
            //You must know all of the values that you
            //want to put into boxes first.
            //This is called "Collection Initialization" syntax
            string[] toolBox = {"wrenches",     //[0]
                                "screwdrivers", //[1]
                                "sockets",      //[2]
                                "hammers"};     //[3]

            //.NET will determine the Length based upon the number of items
            //being initialized and will put them into the indexes in order provided.

            int number = 42;
            int anotherNumber = 987;

            int[] numbers = { 50, number, 87, anotherNumber, 35, 15 };

            bool[] boolpen = { true, false, true, false };

            //Arrays are part of the Collections family, which we will dive into
            //more next week.
            //A string is a collection of chars!
            //As a collection, it will have a Length and it will have indexes just like an array.
            //This gives us some useful functionality.

            //The Substring method!
            string stringName = "Ben Kenobi";
            int location = stringName.IndexOf(" ");
            //the IndexOf() instance method gives us the index location
            //of a char in the string (3 in this case).
            //We could have just as easily picked the IndexOf("K") or "o"
            //if there are MORE THAN ONE identical chars
            //it will return the very first one in the string from left to right.
            string firstName = stringName.Substring(0, location);
            //We take the starting index and then tell it
            //how many characters to captrue after that point.
            //We used indexes 0 to 2 in this case, but
            //0 t0 3 would have given us the same result because
            //the value in index 3 is a blank space. (location + 1);
            Console.WriteLine(firstName);
            string lastName = stringName.Substring(location + 1);
            Console.WriteLine(lastName);

            //Arrays Lab
            // Ask the user for 5 scores (1 at a time)
            //Display the high, low and average score



        }//end SVM
    }//end class
}//end namespace
