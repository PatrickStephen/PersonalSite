using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3Wednesday
{
    class ChangeLab
    {
        static void Main(string[] args)
        {
            //Write a program that will:

            //- Prompt the user to enter a number of dollars and cents. For example 1.18
            //- Display the number of quarters, dimes, nickels, and pennies to make that amount

            //Ex.If they entered 1.18 it should say:
            //4 quarters, 1 dime, 1 nickel, 3 pennies

            //Ex.If they entered 1.02 it should say:
            //4 quarters, 0 dimes, 0 nickels, 2 pennies

            //HINT: Break it into smaller problems...
            //(how do I figure out the quarters, then dimes, etc.)

            Console.WriteLine("Change Lab!");
            //ask user for input
            Console.WriteLine("Enter a number of dollars and cents. For Ex: 1.18");
            int quarters, dimes, nickels, pennies;
            double money = double.Parse(Console.ReadLine());

            pennies = (int)(money * 100);

            //Figure out quarters
            quarters = pennies / 25;
            pennies %= 25;

            //Figure out Dimes
            dimes = pennies / 10;
            pennies %= 10;

            //Figure out nickels
            nickels = pennies / 5;
            pennies %= 5;



            Console.WriteLine("That will be, {0} quarters, {1} dimes, {2} nickels, and {3} pennies.", quarters, dimes, nickels, pennies);

            Console.WriteLine(pennies);

            //store it & convert it
            //decimal amountWeHave = decimal.Parse(Console.ReadLine());
            //pennies = (int)(amountWeHave * 100m);
            //int quarter = (int)(amountWeHave / 25m);
            //int dime = (int)(amountWeHave / 10m);
            //int nickel = (int)(amountWeHave / 1m);
            ////Jeremy said "(don't use "amount we have" each time.) ;)"

            //Console.WriteLine("We would have " + quarter + " quarters.");
            //pennies %= 25;

            


            //return the result
            //string concatenation
            //Console.WriteLine(quarters + " quarters, " + dimes + " dimes, " + nickels +
                //" nickels, " + pennies + " pennies.");
            //string format

            //string interpolation
            //Console.WriteLine($"{quarters} quarters, {dimes} dimes, {nickels} nickels, {pennies} pennies.");

        }//end SVM
    }//end class
}//end namespace
