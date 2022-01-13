using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Store
{
    //make it public, make it a child
    public class Software : Product
    {

        //frugal / fields

        //people / properties
        public OS OperatingSystem { get; set; }
        public string Version { get; set; }

        //collect / constructors (ctors)
        public Software(string name, decimal price, string description, bool isInStock,
            OS operatingSytem, string version) 
            : base(name, price, description, isInStock)
        {
            OperatingSystem = operatingSytem;
            Version = version;
        }//end FQ CTOR

        //money / methods
        public override string ToString()
        {
            return $"{base.ToString()}\nOS; {OperatingSystem}\t\tVersion: {Version}";
        }//end ToString

        //MINI-LAB!
        //CalcHolidayDiscount(), a 20% discount.
        public override decimal CalcHolidayDiscount()
        {
            return Price * .8m;
        }//end CalcHolidayDiscount

    }//end class
}//end namespace
