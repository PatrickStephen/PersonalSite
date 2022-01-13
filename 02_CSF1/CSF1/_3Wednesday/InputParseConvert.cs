using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3Wednesday
{
    class InputParseConvert
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Capturing input, parsing, and converting");

            #region Input/Output Notes
            /*
             * There are 2 main options for Output in a console:
             * Write() and WriteLine()
             * WriteLine() adds a line break after your output.
             * Write() does not.
             * 
             * There are 3 options for Input in console.
             * 
             * Read() - Only takes 1 keystroke of input and stores the ascii value of that key.
             * 
             * ReadKey() - Similar idea, but captures the key's character value
             *           - The book uses this method to halt their program
             *           
             * ReadLine() - Most Common. It allows the user to input something and reads the input as a string after they hit enter
             * 
             * The important part is capturing or using the information they gave you.
             */
            #endregion

            string firstName = "Doctor", lastName = "Who";

            Console.Write(firstName);
            Console.Write(" " + lastName);
            //NO line break after a Console.Write()
            Console.WriteLine(" - and now a line break...");
            //WriteLine() adds a break AFTER the output

            Console.WriteLine();
            //Console.ReadKey();

            //Console.Write("Press a key and let's see what happens: ");
            //int input = Console.Read();
            //Console.WriteLine(input);

            //ReadLine() lets a user type input. However, you must capture that input or it is lost.

            /*
             * You cannot put any code inside of the parens of the ReadLine().
             * Using ReadLine() by itself without storing the input or using it immediately results in the input being lost.
             * 
             * Step 1. Explain to the user what to type!
             *         They can't read your mind...
             * Step 2. Allow them to type by using Console.ReadLine()
             * 
             * Step 3. Capture their input into a variable and store it. Or use it immediately.
             */

            //Step 1:
            Console.Write("What is your name? ");

            //Step 2 & 3
            string userName = Console.ReadLine();

            //Use the info
            Console.WriteLine("Hello, " + userName + "!");

            //Step 1:
            Console.Write("What is your quest? ");

            //Step 2: Let them type, and this time, use that info immediately
            Console.WriteLine(Console.ReadLine() + " is a silly quest...");
            //We can NOT use this info again.

            //MINI-LAB!
            //Ask the user for their favorite color. 
            //Tell them their color back and what you think about it. 
            //Use the name above in your response.

           
            Console.Write("What is your favorite color? ");
            string favColor = Console.ReadLine();
            Console.WriteLine(userName + ", " + favColor + " , that is my favorite color too!...");
            //Console.WriteLine(userName + ", " + Console.ReadLine() + " ,that is my favorite color too!...");

            Console.Write("What planet are you from? ");
            string userPlanet = Console.ReadLine();

            //String formatting uses 0-based counting for indexes and puts the variables into those spots.
            //Think of it like placeholders.
            Console.WriteLine("{0} is great, {1}!", userPlanet, userName);

            //Since ReadLine() alsways returns a string, we will need to do extra work to use that info as another datatype.
            //One option for this is called Parsing.
            //SYNTAX: datatype.Parse(stringValue);

            //parsing ex:
            Console.Write("Enter your age: ");
            string userAge = Console.ReadLine();
            int age = int.Parse(userAge);//Now we can do math with the input!
            int yearsTo100 = 100 - age;

            Console.WriteLine("Still {0} more years until you are 100!", yearsTo100);

            Console.WriteLine("How much do you want to make per year? " +
               "Decimal values are OK, no $ symbols allowed.");

            string salaryString = Console.ReadLine();

            decimal salary = decimal.Parse(salaryString);

            //String Interpolation
            //Like string formatting, string interpolation uses placeholders.
            //Unlike string formatting, we can pass the info we want directly into the placeholder

            Console.WriteLine($"Well, {salary * .35m} will go to taxes...");

            //True Names:
            /*
             * All of the datatypes that we have used up until this point are "Intrinsic" or "Simple" datatypes. They have their own C# reserved keyword associated with them. In reality, the Keyword is just an alias for a class that exists by default in FCL (Framework Class Library).
             * 
             * You can use either the alias or the true name:
             * 
             * byte = Byte
             * short = Int16
             * int = Int32
             * Long = Int64
             * 
             * decimal = Decimal
             * double = Double
             * float = Single
             * 
             * string = String
             * bool = Boolean
             * char = Char
             */

            //Ex:
            int x = 1;
            Int32 y = 2;

            //Convert is another option for changing the datatype of info
            //It works similar to Parse(), but the syntax is different.
            //Convert.ToTRUENAME(valueToConvert)
            //Ex: Convert.ToInt32(userAge)
            //(int)decimalVariable

            //Ask the user how many times they have been smuggled.
            //They get a free lightsaber after 10 trips.

            Console.Write("How many times have you been smuggles" +
                "through Imperial lines by Solo & Chewie Shipping? ");

            string timesSmuggledString = Console.ReadLine();

            //Parsing
            //short timesSmuggled = short.Parse(timesSmuggledString);
            short timesSmuggled = Convert.ToInt16(timesSmuggledString);

            Console.WriteLine($"You have {10 - timesSmuggled} more trips to get your " +
                $"free lightsaber");

        }// end SVM
    }// end class
}// end namespace
