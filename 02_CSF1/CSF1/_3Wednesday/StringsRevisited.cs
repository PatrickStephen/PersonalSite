using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3Wednesday
{
    class StringsRevisited
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Strings Revisited");

            //You can use the ToString() to get the string version of any value from a vriable of ANY datatype.
            //You call this method from the variable name. (instance method)

            //This can be used to turn the value into a string that we can modify
            int number = 42;
            string text = number.ToString();
            Console.WriteLine("Number is: " + text);
            Console.WriteLine(number.GetType());
            Console.WriteLine(text.GetType());

            //In the console, it is useful for the ability to pass format specifiers to the ToString() to "format" numbers or dates
            decimal someDecimal = 124154.2392m;
            Console.WriteLine(someDecimal.ToString("n") + " with n for number");
            // "n" defaults to 2 decimal places. You can also give it a number value to specify the exact places it should have after the decimal.
            Console.WriteLine(someDecimal.ToString("n1") + " with n1 formating");//only one place after the decimal
            Console.WriteLine(someDecimal.ToString("c") + " with c for currency formatting");//for currency formatting
            Console.WriteLine(someDecimal.ToString("e") + " with e for exponentail formatting");

            //String Formatting
            Console.WriteLine("{0:n3} is n3 formatting and {0:c} is currency formatting.",
                someDecimal);

            //String Interpolation
            Console.WriteLine($"{someDecimal:n3}, {someDecimal:c}");

            //Escape Sequences.
            //Special codes used inside a string that ignore certain characters.
            //In C# they begin with a \

            // \n creates a new line inside of a string.
            Console.WriteLine("I love escapes!\nThey are easy!");

            // \" escapes "" and allows it to be used as a character.
            Console.WriteLine("\"I like turtles!\" Zombie kid said.");

            // \\ gets a \ (you have to escape ... the escape...)
            Console.WriteLine("C:\\VS2017\\Projects\\02_CSF1");

            //BEEP!
            //Console.WriteLine("Danger!\a");
            //Console.Beep();

            // \u#### gives you a unicode character
            Console.WriteLine("It feels like it is 100\u00B0 in here!");
            // www.utf8-chartable.de

            /*
             * Make text easier to read on-screen (in vs) with concatenation.
             * To create a longer string that is easier to read, you have to use concatenation
             */
            string nonsense = "jldjlfjdslfjldsjfldjslfldsdafldjljfkdslfjda;" +
                "fdfjldsjfjdslfjldsjlfjldsjfljdifvklc;" +
                "kjaffldjfljdjsljlvljal";

            //verbatim character @
            //similar to escape, but it captures ALL characters literally.

            //This includes spacing, but to show a double quotes inside of a verbatim string, you have to use a double double quotes.
            //To start a verbatim string, just add @ before the double quotes.

            string greeting = @"julio says

""hello"" and that
          file is at

                C:\julio\dox";

            Console.WriteLine(greeting);

            string dragon = @"
                         `-.____________________                           
                             `:.`---.__         `-._                       
                               `:.     `--.         `.                     
                                 \.        `.         `.                   
                         (,,(,    \.         `.   ____,-`.,                
                      (,'     `/   \.   ,--.___`.'                         
                  ,  ,'  ,--.  `,   \.;'         `                         
                   `{D, {    \  :    \;                                    
                     V,,'    /  /    //                                    
                     j;;    /  ,' ,-//.    ,---.      ,                    
                     \;'   /  ,' /  _  \  /  _  \   ,'/                    
                           \   `'  / \  `'  / \  `.' /                     
                            `.___,'   `.__,'   `.__,' 
";
              Console.WriteLine(dragon);

            //verbatim is most often used for file locations:
            string path = @"C:\users\student\documents\ubergeek.doc";
            Console.WriteLine($"This is the file location: {path}");

            //string formatting
            string formattedString = string.Format("{0}", path);
            Console.WriteLine(formattedString);

            //interpolation
            formattedString = $"file location: {path}";
            Console.WriteLine(formattedString);

        }//end SVM
    }//end class
}//end namespace
