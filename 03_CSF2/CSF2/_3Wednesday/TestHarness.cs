using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using University;

namespace _3Wednesday
{
    class TestHarness
    {
        static void Main(string[] args)
        {

            SignaturesLibrary.Signature.Header("Test Harness for new Types");

            Console.WriteLine("\nBOOKS\n");

            Book bk1 = new University.Book("The Count of Monte Cristo",
                "Penguin Publishing", "0140449264");
            Console.WriteLine(bk1);

            Book bk2 = new Book("Xanathar's Guide to Everything",
                "Wizardss of the Coast", "0786966114");
            Console.WriteLine(bk2);

            Console.WriteLine("\n\nSTUDENTS\n\n");

            Student s1 = new Student("Derek Zoolander", 111, 0.4,
                Dept.BreakDanceFighting, "bluesteel@netscape.com");
            Console.WriteLine(s1);

            Student s2 = new Student("Hansel", 222, 3.9,
                Dept.FingerPainting, "sohotrightnow@aol.com");
            Console.WriteLine(s2);

            //When you have a datatype that takes an array or ANY collection
            //for one or more of its properties,, it  is
            //often easiest to pre-create the collections FIRST
            List<Student> students = new List<Student>();
            students.Add(s1);
            students.Add(s2);
            List<Book> books = new List<Book>() { bk1, bk2 };
            //Collection Initialization Syntax. Just like the array, this
            //syntax is useful if you already know some of the items you want to put in.
            //Unlike the array, you can still add more items later

            Course biz101 = new Course("Selling is as selling does", Dept.JediMindTraining, students, books, 12);
            Console.WriteLine(biz101);


        }//end main()
    }//end class
}//end namespace
