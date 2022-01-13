using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Store
{
    //The first class in a DLL is ALWAYS defaulted to public
    public class Product
    {
        //First thing we ask,
        // do wehave any business rules
        //frugal / fields

        //people / properties
        public string Name { get; set; }
        public decimal Price { get; set; }
        public string Description { get; set; }
        public bool IsInStock { get; set; }
        //collect / constructors (ctors)
        public Product() { }
        public Product(string name, decimal price, string description, bool isInStock)
        {
            Name = name;
            Price = price;
            Description = description;
            IsInStock = isInStock;
        }//FQ CTOR

        //public Product(string name, decimal price, string description, bool isInStock)
        //{
        //This constructor is NOT unique. The parameters are of the same
        //quantity and type. They are also in the same order.
        //}
        //public Product(decimal price, string name, string description, bool isInStock)
        //{
           //This would be fine because the datatypes are in a different order.
           //decimal string string bool
           //Bad practice to have multiple of the same parameters in the public Product()
        //}
            //ctor that only accepts name, price, and description
        public Product(string name, decimal price, string description)
        {
            Name = name;
            //Name = "Trogdor"; can give anything a default value
            Price = price;
            Description = description;
            IsInStock = true;//default value
            //We can only create a new product if it is in stock
            //almost like a mini business rule.
        }//end 3 param ctor

        //money / methods
        public override string ToString()
        {
            return string.Format("\nProduct Name: {0}\n" +
                "Price: {1:c}\n{2}\n{3}",
                Name,
                Price,
                Description,
                //MINI-LAB Build a ternary operator for IsInStock
                // booleanExpression ? "TrueValue" : "FalseValue"
                IsInStock ? "In Stock" : "Out of Stock");
        }//end ToString()
        //This is now the base.ToString(). All children of this class
        //will use this ToString unless they override it.

        //Static vs Instance
        //If you don't need specific info about a specific Product, make it static
        //If you DO need info about a specific Product, make it instance
        //To make a method Instance, leave the method signature blank

        //Static mehtods are general methods related to the class as a whole.
        public static string DisplayReturnPolicy()
        {
            return "Please be aware that all returns must be " +
                "processed within 90 days of purchase!";
        }//end DisplayReturnPolicy

        public virtual decimal CalcHolidayDiscount()
        {
            //The VIRTUAL keyword allows, but does not require, us to
            //override the method in any child class

            //default 5% discount, so we retrun the price * .95
            return Price * .95m;
        }//end CalcHolidayDiscount
        


    }//end class
}//end namespace
