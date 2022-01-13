using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3Wednesday
{
    class WaterLab
    {
        static void Main(string[] args)
        {
            //WATER LAB:

            //Write a program that will:

            //- Assume that a gallon of water weighs 8.33 pounds
            //- Prompt the user to enter a number of gallons
            //- Display the total weight of the water in pounds

            //* Test with something simple like 2 to start.

            Console.WriteLine("Water Lab!");

            //Console.Write("How many gallons of water do you have? ");
            //string nbrOfGallons = Console.ReadLine();
            //decimal lbsPerGallon = decimal.Parse(nbrOfGallons) * 8.33m;           

            //Console.WriteLine("that will weight " + lbsPerGallon);

            //ask user for input
            Console.Write("Enter a number of gallons, and I'll tell you how much it weighs! ");
            //store it & convert it
            decimal nbrGallons = decimal.Parse(Console.ReadLine());
            //do math
            decimal weight = nbrGallons * 8.33m;
            //return the result
            Console.WriteLine($"That weighs {weight} lbs!");

            // and the shortway
            //Console.WriteLine($"That weighs {decimal.Parse(Console.ReadLine()) * 8.33m} lbs!");


        }//end SVM
    }//end class
}//end namespace
