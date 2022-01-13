using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _4Thursday
{
    class InputLab
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Input Lab");
            //Ask the user for the following info:

            //Favorite Season
            //Favorite Car
            //Favorite TV Show
            //How much they spent on Cable last year.
            //Give them a response using all of their info in one statement at the end using string formatting.  Use currency formatting when you display the cable bill.

            //string[] favorite = new string[3];
            //favorite[0] = "Fall/Winter";
            //favorite[1] = "69 Charger";
            //favorite[2] = "7 Deadly Sins";

            //decimal[] cableBill = new decimal[1];
            //cableBill[0] = 79.99m;

            //Console.WriteLine("My favorite season is {0}, my favorite car is a {1}, and my favorite tv show is the {2}." + $"\nMy cable bill last year was {cableBill[0]:c}.",
            //    favorite[0],
            //    favorite[1],
            //    favorite[2],
            //    cableBill[0]);

            Console.WriteLine("What is your favorite season? ");
            string favoriteSeason = Console.ReadLine();

            Console.WriteLine("What is your favorite car? ");
            string favoriteCar = Console.ReadLine();

            Console.WriteLine("What is your favorite tv show? ");
            string favoriteTvShow = Console.ReadLine();

            Console.WriteLine("How much was your cable bill last year? ");
            string cableBill = Console.ReadLine();
            int Bill = int.Parse(cableBill);

            Console.WriteLine(favoriteSeason + " is your favorite season." + " Your favorite car is a " + favoriteCar + " and " + favoriteTvShow + " is your favorite tv show!" + "\nFor a whole year of cable last year, you paid " + cableBill);

        }//end svm
    }//end class
}// end namespace
