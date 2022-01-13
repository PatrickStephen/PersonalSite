using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _4Thursday
{
    class ValueVsReference
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Value vs. Reference Types");

            //value types

            int num1 = 43;
            int num2 = 10;
            Console.WriteLine(num1 + " " + num2);

            num2 = num1;
            Console.WriteLine(num1 + " " + num2);

            num1 = 13;
            Console.WriteLine(num1 + " " + num2);

            //Unlick value types like int, decimal, and bool.
            //classes are reference types, and when you assign them
            //to each other, they are both pointing to the same value.
            //if you change one, you change both.

            Actor a1 = new Actor("Tom Cruise");
            Actor a2 = new Actor("Keanu Reeves");

            Console.WriteLine("Values BEFORE copying:\n" +
                "Actor A: {0}\nActor B: {1}\n",
                a1.Name, a2.Name);

            //Now copy a1 into a2 (change a2's pointer to a1's location)
            a1 = a2;

            //this causes problems because reference do not store
            //their own value. Instead, they have a pointer (reference) to a
            //location in memory where the values are stored. Both of these variables
            //now point to the same location in memory.
            Console.WriteLine("Values AFTER copying:\n" +
               "Actor A: {0}\nActor B: {1}\n",
               a1.Name, a2.Name);

            a2.Name = "Sean Connery";

            Console.WriteLine("Values BEFORE REASSIGNING:\n" +
               "Actor A: {0}\nActor B: {1}\n",
               a1.Name, a2.Name);

        }//end svm
    }//end class

    class Actor
    {
        public string Name { get; set; }
         public Actor(string name)
        {
            Name = name;
        }
    }//end Actor

}//end namespace
