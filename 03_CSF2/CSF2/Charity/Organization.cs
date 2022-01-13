using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Charity
{
    public class Organization //datatype class
    {
        //NO SVM!!!!

        /*
         * Everything that can be put into a class is referred to as a "Class Member"
         * Here, we will add Class Memebers for fields, properties, constructors, and methods.
         * (There is also a Class Member for Events, but you'll learn about that later.)
         */

        //numatic device to remember the order
        //frugal / fields
        // Represent the info that can be stored for an object of "this" type
        // Should ALWAYS be private
        // STRONG NAMING CONVENTION: _cameCase
        private string _name;
        private DateTime _dateFounded;
        private int _nbrOfMembers;
        private decimal _revenue;

        //people / properties
        // Encapsulate/protect the fields.
        // Control access to "getting" or "setting" info with the fields
        // Should ALWAYS be public
        // STRONG NAMING CONVENTION: _PascalCase
        // Business rules go here.
        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }//end Name
        
        public DateTime DateFounded
        {
            get { return _dateFounded; }
            set { _dateFounded = value; }
        }//end DateFounded

        public decimal Revenue
        {
            get { return _revenue; }
            set { _revenue = value; }
        }//end Revenue

        public int NbrOfMembers
        {
            get { return _nbrOfMembers; }
            set
            {
                //if the nbr of members they want to set for
                //an org is > 0, it's good to go.
                if (value > 0)
                {
                    _nbrOfMembers = value;
                }
                else
                {
                    //This scope will fire off if they tried to set
                    //a value of 0 or less.
                    _nbrOfMembers = 1;
                }
            }//end set
        }//end NbrOfMembers

        //collect / constructors (ctors)
        /*
         * constructors are specialized methods used to creae objects
         * of "this" type. We call constructors useing th "new" keyword.
         * The constructor method always has the same name as the data type (class name)
         * where it is defined.
         * NO retrun type is listed in constructor method signatures.
         * 
         * IF YOU DON'T CREATE YOUR OWN CTOR, you'll get a free
         * default parameterless ctor.
         * 
         * WHEN YOU DO CREATE YOUR OWN CTOR, you loos the free one,
         * unless you rebuild it.
         */
         public Organization(string name, DateTime dateFounded,
             int nbrOfMembers, decimal revenue)
        {
            //The params (parameters) above should always be name in camelCase

            //Here is where the code goes to assign the arguments they passed.
            //We caught those arguments in our params to the appropriate
            //properties to assign the fields.
            //Properts = parameter
            //PascalCase = camelCase;
            Name = name;
            DateFounded = dateFounded;
            NbrOfMembers = nbrOfMembers;
            Revenue = revenue;
        }//end Fully Qualified Constructor (FQ CTOR), has a parameter for each property.

        //default, parameterless ctor, recreated
        public Organization() { }//done!
        //Since we accepted no params, we had NO work to do in the body (scope)

        //money / methods
        //These are actions related to or using properties of our object.
        //The most common method is to override the ToString()

        public override string ToString()
        {
            //return base.ToString();
            //The base.ToString() gives us the default ToString()
            //for all Objects, Namespace.ClassName, which is not
            //what we want. This return comes from the
            //base class for all classes in C# - OBJECT
            return string.Format($"Organization: {Name}\n" +
                                 $"Revenue: {Revenue:c}\n" +
                                 $"Members: {NbrOfMembers:n0}\n" +
                                 $"Date Founded: {DateFounded:d}\n");
        }
    }
}
