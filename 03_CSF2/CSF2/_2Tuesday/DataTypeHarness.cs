using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

//You MUST add a reference to an outside library to access it
//You Can add a using statement to make it easier to use
using Charity;
using SignaturesLibrary;

namespace _2Tuesday
{
    public class DataTypeHarness
    {
        static void Main(string[] args)
        {
            Signature.Header("Datatype Test Harness");

            /*
             * Sometimes, we call a program that tests the functionality
             * of other code we create a "test harness."
             * In this test harness, we will test some new custom complex datatypes
             * All of the classes will be built out in a separate Class Library project
             * and tested here.
             */
            #region Volunteers
            Volunteer v1 = new Volunteer();
            v1.Name = "Spider-Man";
            v1.IsActive = true;
            v1.YearsOfService = 12;

            //Complex datatypes use the NEW keyword to call
            //the "constructor". ( a method that builds the object)
            //If you do not define a constructor in your class file,
            //you get a "free" default parameterless (nothing in the parens) ctor (constructor).

            //We can call on props inside the Volunteer object (v1),
            //just like regular variables.
            Console.WriteLine($"{v1.Name} has volunteered for {v1.YearsOfService} years.\n" +
                $"Still Active? {v1.IsActive}");

            //MINI-LAB!
            //Create a new Volunteer object,
            //Populate its fields and display the values.

            Volunteer v2 = new Volunteer();
            v2.Name = "Harry Potter";
            v2.IsActive = false;
            v2.YearsOfService = 6;

            Console.WriteLine($"{v2.Name} attended Hogwarts School of Witchcraft and Wizardry for {v2.YearsOfService} years.\n" +
                $"Did he graduate? {v2.IsActive}");

            #endregion

            #region Organization
            Console.WriteLine("\n\n**** ORGANIZATION STUFF ****\n\n");

            Organization o1 = new Organization();
            o1.Name = "Red Cross";
            o1.NbrOfMembers = 3000;
            o1.Revenue = 1000000;
            o1.DateFounded = new DateTime(1881, 5, 21);
            //The above line of code are setting the values into the fields
            //through the property "set" via encapsulation.

            Console.WriteLine("{0}\nRevenue: {1:c}\nMembers: {2:n0}\nFounded: {3:d}\n",
                o1.Name,
                o1.Revenue,
                o1.NbrOfMembers,
                o1.DateFounded);

            Console.WriteLine();
            //If you have a complex datatype property, typically
            //you make the complex datatype first, before creating the larger (containing) datatype.

            DateTime dateCreated = new DateTime(1904, 11, 20);

            Organization o2 = new Organization("Big Brothers Big Sisters",dateCreated,1000,498539068.50m);
            Console.WriteLine("{0}\nRevenue: {1:c}\nMembers: {2:n0}\nFounded: {3:d}\n",
                o2.Name,
                o2.Revenue,
                o2.NbrOfMembers,
                o2.DateFounded);

            Console.WriteLine("\n\n**** OVERRIDE TOSTRING() ****\n\n");

            Console.WriteLine(o1);
            Console.WriteLine(o2);

            //The default ToString() is Namespace.ClassName
            //In the above Console.WriteLine(), it gave us
            //Charity.Organization
            //This is the default for all complex objects unless
            //we override it.
            //EX:
            //Random rand = new Random();
            //Console.WriteLine(rand);
            DateTime now = DateTime.Now;

            #endregion

            #region Employee
            Console.WriteLine("\n\n**** Employees ****\n\n");

            //Create two employees, one with the default ctor,
            //and one with the fq ctor
            Employee e1 = new Employee(); //this is the default ctor
            e1.Name = "Emperor Palpatine";
            e1.DateOfHire = new DateTime(1984, 4, 12);
            e1.Salary = 1234567;
            e1.IsPaidBiWeekly = true;
            e1.Employer = o2;

            Employee e2 = new Employee("Bruce Banner",o1,new DateTime(1977, 5, 25),10000, false);//this is our overload, FQ CTOR (less lines)

            //write them out to the screen
            Console.WriteLine(e1);
            Console.WriteLine(e2);


            //Instance methods are called from the INSTANCE of the object (AKA variable name)
            Console.WriteLine($"{e1.Name} gets paid {e1.CalculatePay():c} per paycheck");

            //static methods are called from Class.MethodName()
            Console.WriteLine($"{e2.Name} gets paid {Employee.CalculatePay(e2.IsPaidBiWeekly, e2.Salary):c} per paycheck");

            //BONUS EXAMPLE
            Console.WriteLine($"{e1.Name} gets paid {Employee.CalculatePay(e1):c} per paycheck");

            //in this case, since we are using props of our Employee for the argument,
            //the method is cleaner, and easier to expland as an instance method, say for Christmas Bonuses.

            #endregion
        }//end main
    }//end class
}//end namespace
