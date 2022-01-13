using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Store
{
    //The default access for a clas in internal
    //Make it Public
    public class Book : Product
    {
        //Adding : datatype is ALL it takes to make this a child class.
        //This inherits almost everything from the parent except CTORS

        //In C#, a class can only have 1 direct parent. The parent / child
        //relationship is also referred to as a base/derived and super/sub

        //frugal / fields
        //Nope

        //people / properties
        //We get all oof the fields and properties from Product,
        //so we only have to deal with unique properties for a Book
        public string Author { get; set; }
        public int NbrOfPages { get; set; }

        //collect / constructors (ctors)
        public Book(string name, decimal price, string description, bool isInStock,
            string author, int nbrOfPages)
            : base(name, price, description, isInStock)
        {
            //You could assign all of the props you've inherited here,
            //OR... you can use the ctor of the parent by adding
            // : base(parameters) to the end of the signature line above

            //since we passed inherited props to the base ctor, we just need
            //to handle the unique ones.
            Author = author;
            NbrOfPages = nbrOfPages;
        }//FQ CTOR

        //money / methods
        public override string ToString()
        {
            return base.ToString() + "\nAuthor: " + Author +
                "\t\tPages: " + NbrOfPages;
            
        }//end ToString()

        public override decimal CalcHolidayDiscount()
        {
            //Without overriding, we get the parent (base) version 5% off.
            //By overriding method, we can define a behavior that will be unique
            //to the Book class (and its children)
            //retrun base.CalcHolidayDiscount();
            return Price * .9m;
        }
    }//end class
}//end namespace
