using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace University
{
    public class Book
    {
        //frugal / fields
        //NONE

        //people / properties
        public string Title { get; set; }
        public string Publisher { get; set; }
        public string ISBN { get; set; }

        //collect / constructors (ctors)
        public Book(string title, string publisher, string isbn)
        {
            //Property = parameter
            //PascalCase = camelCase
            Title = title;
            Publisher = publisher;
            ISBN = isbn;
        }//end FQ CTOR


        //money / methods
        public override string ToString()
        {
            return Title;
        }

    }//end class
}//end namespace
