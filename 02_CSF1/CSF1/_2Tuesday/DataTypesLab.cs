using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _2Tuesday

{
    class DataTypesLab
    {
        static void Main(string[] args)
        {
            
            
            byte smallBox1 = 1;
            bool onlyOneWand = true;
            float smallFraction = .5f;
            char symbol = '$';
            char letter = 'A';
            short shortNbr = 2;
            int intNbr = 3;
            long longNbr = 4;

            string firstName = "Harry";
            string lastName = "Potter";
            Console.WriteLine(firstName + lastName + " only has " + smallBox1 + " wand.");

            Console.WriteLine("Harry only has 1 wand? " + onlyOneWand);

            Console.WriteLine("After Harry broke the elder wand it was in " + smallFraction + " parts.");

            Console.WriteLine("The symbol for money is " + symbol);

            Console.WriteLine("The first letter of apple is " + letter);

            Console.WriteLine("A couple is " + shortNbr);

            Console.WriteLine("A few is " + intNbr);

            Console.WriteLine("Multiple is " + longNbr);

            int maxInt = int.MaxValue;
            Console.WriteLine("Max Value " + maxInt);
            int minInt = int.MinValue;
            Console.WriteLine("Min Value " + minInt);
        }//end SVM
    }//end class
}//end namespace
