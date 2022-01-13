using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _1Monday
{
    /// <summary>
    /// Triple slashes is an XML Comment. This appears in intellisense to help us figure out what
    /// this class does.
    /// Deals with various date and time related methods/ calculations.
    /// Beware using special symbols in XML comments, as they can
    /// cause issues.
    /// </summary>
    class DateTimeWarehouse
    {
        //This does NOT get an SVM. It is a helper file not meant to
        //be run on its own.

        //if it were in a special application called a Class Library,
        //it would build as a .DLL (Dynamic Link Library).

            /// <summary>
            /// Displays the current date and time
            /// </summary>
        public static void DisplayTime()
        {
            //Could be hundreds of lines of code
            Console.WriteLine($"{DateTime.Now:F}");
        }//end DisplayTime()

        /// <summary>
        /// Displays a date in custom formatting
        /// </summary>
        /// <param name="dateToDisplay">Date to display in custom formatting</param>

        public static void DisplayTime(DateTime dateToDisplay)
        {
            //every method signature must be unique
            //methods with the same name become "overloaded" methods
            //when you change the parameters (params).
            //This allows you to select which version of the method to use.
            Console.WriteLine($"{dateToDisplay:dddd\\, MMM\\ dd\\, yyyy\\ hh\\:mm}");
        }//end DisplayTime overload

        /// <summary>
        /// A program that just shows an example of using parameters and
        /// return types. We could have just used AddDays in our main program,
        /// but this is way more fun!
        /// </summary>
        /// <param name="days">Number of days to add to Today. Use a negative number to subtract.</param>
        /// <returns>Returns the date caculated from Today</returns>
        public static DateTime CalculateDate(int days)
        {
            //When you have a return type listed, you need
            //to "return" an object of that type.

            DateTime calculatedDate = DateTime.Now.AddDays(days);

            return calculatedDate;
            //Returning the calculated date to whatever program called for this method.
        }
    }    
}
