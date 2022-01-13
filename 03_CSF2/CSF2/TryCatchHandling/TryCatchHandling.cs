using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TryCatchHandling
{
    class TryCatchHandling
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Try Catch Exception Handling");

            Console.Write("Please enter a number: ");

            //The following code is potentially dangerous as the Parse()
            //attempts to turn their string input into an int.
            //If they type text, a symbol, 0, or an excessively large or small number,
            //the app will crash

            //int userNumber = int.Parse(Console.ReadLine());
            //Console.WriteLine("100 divided by your number is " + (100 / userNumber));

            //TRY CATCH for "dangerous code"
            //DOES signficantly reduce performance, but often worth it
            //for targeted pieces of code.

            //Different ways to crash this program:
            //Format Exception - attempt to parse a value into a variable of a diff type
            //DIvideByZero Exception - dividing by zero
            //Overflow Exception - the number is too big or too small for an int

            #region First, simplest way to do a try catch
            int userNumber = 0;
            try
            {
                userNumber = int.Parse(Console.ReadLine());
                Console.WriteLine("100 divided by your number is " + (100 / userNumber));
            }//end try
            catch
            {
                //try to do the dangerous code above, and if it does NOT work,
                //catch the error and do something else here
                Console.WriteLine("An error has occurred.\a");                
            }//end catch
            Console.WriteLine("Moving on...");
            #endregion

            #region A Try Catch targeting specific exemptions
            Console.Write("Please enter a number: ");
            try
            {
                userNumber = int.Parse(Console.ReadLine());
                Console.WriteLine("20 divided by your number is " + (20 / userNumber));
                //throw new NotImplementedException();
            }
            catch (DivideByZeroException)
            {
                //if there is a divide by zero exception error
                //when the TRY code is attempted, this is what runs instead.
                Console.WriteLine("\nCan't divide by zero...");
            }

            catch (OverflowException)
            {
                //a number is too big or too small
                Console.WriteLine("\nPlease enter a number between " +
                    "-2 Billion and 2 Billion, not including 0");
            }
            catch(Exception ex)//a holding variable (a variable of a complex datatype that
            //we did not have to construct)
            {
                //ex is now a variable of type Exception that has
                //all of the info about the exception that occurred.
                Console.WriteLine("\nSome error occurred.\n" +
                    "Contact the System Admin!\n\n" +
                    "**** Tech DETAILS ****\n" +
                    $"Error info: {ex.Message}\n" +
                    $"Type: {ex.GetType()}");
            }
            
            #endregion

        }//end main
    }//end class
}//end namespace
