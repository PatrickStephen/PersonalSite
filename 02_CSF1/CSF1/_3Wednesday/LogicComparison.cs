using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3Wednesday
{
    class LogicComparison
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Logical and Comarison Operators:");

            //Comparison Operators!
            //"Relational" and "Equality" operators compare 2 different values and result in a bool answer of true or false

            /*
             * > is greater than             * < is less than             * >= is greater than or equal to             * <= is less than or equal to
             * 
             */

            int ceoPayGrade = 20,
                mgrPayGrade = 12,
                mailroomPayGrade = 2;

            bool isCeoPayHigher = ceoPayGrade > mgrPayGrade;
            Console.WriteLine("isCeoPayHigher: " + isCeoPayHigher);

            Console.WriteLine("Is MGR pay greater than CEO?: " +
                (mgrPayGrade > ceoPayGrade));

            Console.WriteLine("Is Mailroom Pay less than or equal to CEO?: " +
                (mailroomPayGrade <= ceoPayGrade));
            Console.WriteLine("Is 5 less than or equal to 6? " +
               (5 <= 6));

            Console.WriteLine("Is mailroom less than or equal to 1? " +
                (mailroomPayGrade <= 1));

            //Equality Operators:
            //a single = sign is assignment
            //to test equality, we use ==
            Console.WriteLine("Is MGR really equal to CEO?: " + 
                (mgrPayGrade == ceoPayGrade));

            //for inequality (is not equal to)
            //we use != (not equal to)
            //In C# and exclamation mark generally means NOT (!true is a valid code that means false)

            Console.WriteLine("Is MGR different than CEO?: " +(mgrPayGrade != ceoPayGrade));

            //Comparing Strings: ==, !=
            string b = "batman";
            string b2 = "BATMAN";

            Console.WriteLine("Is b equal to b2?: " + (b == b2));
            //C# is case sensitive, so these are NOT equal.

            Console.WriteLine("case INSENSITIVE, is b equal to b2? " +
                (b2 == b.ToUpper()));
            //all methods (purple boxes in intellisense) MUST have parens

            /*
             * Basic overview of C# Methods
             * A method is a group of statements that together perform a task.
             * Every C# program has atleast one class with a method names Main().
             * 
             * word with () - means method
             * 
             * Logical Operators will combine two comparison operators or bool values and returns a bool.
             * 
             * && is used to mean AND ALSO
             * || is used for OR ELSE
             * They still compare two value, but the values must both be or resolve to be Boolean values
             */

            Console.WriteLine(true && true);
            Console.WriteLine(true && false);// since they aren't both true, the answer is false

            Console.WriteLine(false || false);
            Console.WriteLine(true || false); // if anything in || is true, the answer is true

            // ^ = eXclusive OR (XOR) - checks if exactly one statement is true
            Console.WriteLine(false ^ true);

            bool payComparison =
                (ceoPayGrade > mailroomPayGrade) && (ceoPayGrade < mgrPayGrade);

            Console.WriteLine("Is CEO pay less than MGR AND greather than mailroom " +
                payComparison);

            Console.WriteLine("Is CEO pay less than MGR OR greather than mailroom " +
                ((ceoPayGrade > mailroomPayGrade) || (ceoPayGrade < mgrPayGrade)));

            bool result = (15 < 5) || ('$' == 'a');
                           //false OR  //false
            Console.WriteLine(result);

            // if !loggedIn -- hide the website



        }// end SVM
    }// end class
}// end namespace
