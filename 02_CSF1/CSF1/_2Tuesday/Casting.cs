using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _2Tuesday
{
    class Casting
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Casting!");

            #region Casting Notes
            /*
             * Casting is copying the value from a variable of one type to a variable of a different but similar type.
             * 
             * IMPLICIT Casting: copies the contents from a smaller container to a larger container (aka datatype).
             * 
             * This ALWAYS fits
             */
            #endregion

            byte toothpasteBox = 1;
            short shoeBox = 200;
            int movingBox = 32261;
            long fridgeBox; //Just delcared, not initialized

            fridgeBox = toothpasteBox;//This is Implicit casting (byte to a long)
            //ALWAYS will work, because there is no chance for truncation. The byte value can ALWAYS fit in a long.

            long ovenBox = fridgeBox;// NOT casting. Just assigning the value of a variable from one container to another of the SAME data type.
            Console.WriteLine("Toothpaste Box: " + toothpasteBox);
            Console.WriteLine("Fridge Box: " + fridgeBox);
            Console.WriteLine("Oven Box: " + ovenBox);

            //toothpasteBox = fridgeBox;
            /*
             * EXPLICIT Casting - going from a larger to a smaller container. This requires extra work.
             * 
             * You have to "explicitly" state the data type you're casting/ converting to. This can create issues if the value won't fit.
             * 
             * Explicit = Explain
             */
            toothpasteBox = (byte)shoeBox;
            //This is casting the value of shoeBox and storing it in toothpasteBox explicitly
            Console.WriteLine("Toothpaste Box: " + toothpasteBox);
            Console.WriteLine("Shoe Box: " + shoeBox);

            /*
             * If you explicitly cast a LARGER value to a smaller container, you get a mess...(truncation)
             * 
             * Above, we set movingBox to be 32261. What happens if we copy that value to a byte
             */
            toothpasteBox = (byte)movingBox;
            //assigning toothpasteBox to the byte version of a movingBox.
            Console.WriteLine("Tootpaste Box: " + toothpasteBox);
            Console.WriteLine("Moving Box: " + movingBox);

            //MINI-LAB!
            //Cast the long into the int and display it.
            movingBox = (int)fridgeBox;
            Console.WriteLine("Moving Box: " + movingBox);
            Console.WriteLine("Fridge Box: " + fridgeBox);

            decimal dec1 = 4.3m; //This is explicit casting!
            decimal dec2 = (decimal)4.3;

            //Both of the lines above are the same.
            //m or M is a shortcut for explicityly casting a double to a decimal

            decimal deathStars = 1.75m;

            int completedDS = (int)deathStars;

            Console.WriteLine("Out of " + deathStars + 
                " Death Stars, only " + completedDS 
                + " was completed.");


        }//end SVM
    }//end class
}//end namespace
