using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SignaturesLibrary
{
    public class Signature
    {
        //The first class in a DLL (Dynimc Link Library) is always public. All subsequent classes will
        //default to "internal". The internal access modifier indicates that a
        //class is available to other classes inside the smae project, but is
        //anaccessible outside the project.

            /// <summary>
            /// Method to print a header at the start of a console application
            /// </summary>
            /// <param name="title">Title to display</param>
        public static void Header(string title)
        {
            Console.WriteLine($"-= CSF2: {title.ToUpper()} =-");
            Console.Title = "-=-=-= " + title + "=-=-=-";
        }

        //To use this Class Library in another project, there are 3 things to consider:
        //1) This class MUST be public.
        //2) You MUST add a reference to this project in the project that will use it. (consume it).
        //3) You CAN optionally add a using statement to make the class easier to acess.
    }
}
