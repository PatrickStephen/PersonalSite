using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _1Monday
{
    class RandomPractice
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Practice with the Random class");
            Console.Title = "RANDOM PRACTICE";

            #region Random class Notes
            /*
             * Random is a class in the FCL (Framework Class Library). It has
             * an instance method .Next(), which generates the "next" random number
             * in a specified range.
             * 
             * As an "instance" method, you must have instantiated (initialized)
             * a Random object (variable of the type Random) to call it.
             * EX:
             *  ToUpper(), ToLower(), AddDays(), ToString()
             *  
             *  The alternative to Instance, is Static. This requires you
             *  to call the ClassName where it was defined to access it
             *  
             *  EX:
             *  int.Parse(), Array.Sort(), Console.WriteLine()
             */
            #endregion

            Random randomNbrGen = new Random();
            //The NEW keyword MUST be used with complex datatypes

            int randomNumber = randomNbrGen.Next();
            Console.WriteLine($"{randomNumber:n0}");

            //The Next() is overloaded to accept 3 different parameter sets.
            //1 - no params. Returns an into from 0 to 2 billion+
            //2 - int for MaxValue, explusive upper bound (defaults Min to 0).
            //3 - int for MinValue, (inclusive), int MaxValue (exclusive)

            //display a number from 0 - 50
            int nbr0to50 = randomNbrGen.Next(51);
            Console.WriteLine("0-50: " + nbr0to50);

            //number from 50 - 105
            int nbr50to105 = randomNbrGen.Next(50, 106);
            Console.WriteLine("50-105: " + nbr50to105);

            //MINI-LAB
            //20 Sided dice.
            //1-20
            //Use a NEW random object to call the Next() to genereate a random
            //number between 1 and 20 and display it

            Random rand = new Random();
            int d20 = randomNbrGen.Next(1, 21);
            Console.WriteLine("You rolled a: " + d20);

            //An EX: using the seed.
            Random rand2 = new Random(6);
            int nbr100to200 = rand2.Next(100, 201);
            Console.WriteLine("The number from 100 to 200 is: " + nbr100to200);

            #region BlackJack

            #endregion
        }

    }
}
