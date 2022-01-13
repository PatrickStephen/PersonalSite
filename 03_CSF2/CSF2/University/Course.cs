using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace University
{   //MAKE IT PUBLIC!
    public class Course
    {
        //frugal / fields

        //people / properties
        public string Name { get; set; }
        public Dept Department { get; set; }
        public List<Student> Roster { get; set; }
        public List<Book> Curriculum { get; set; }
        public double CreditHours { get; set; }

        //collect / constructors (ctors)
        public Course(string name, Dept department, List<Student> roster, List<Book> curriculum,
            double creditHours)
        {
            Name = name;
            Department = department;
            Roster = roster;
            Curriculum = curriculum;
            CreditHours = creditHours;
        }//end FQ CTOR

        //money / methods
        public override string ToString()
        {

            //When dealing with writing out collections,
            //it is best to build a string to hold the info.

            //We need a string variable to hold the desired info for
            //each book, as well as a variable to hold the info
            //for each student
            string booksNeeded = "";
            string studentsEnrolled = "";

            foreach (Book b in Curriculum)
            {
                booksNeeded += b + "\n";
            }//end foreach

            foreach (Student s in Roster)
            {
                studentsEnrolled += s + "\n";
            }//end foreach

            return $"\nCourse: {Name}\t\tCredit Hours: {CreditHours}\n" +
                $"Department: {Department}\n" +
                $"Curriculum:\n{booksNeeded}\n" +
                $"Roster:\n{studentsEnrolled}\n";


        }//end ToString()



    }//end class
}//end namespace
