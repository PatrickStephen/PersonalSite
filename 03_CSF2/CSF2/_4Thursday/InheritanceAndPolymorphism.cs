using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SignaturesLibrary;
using Store;//added Store;

namespace _4Thursday
{
    class InheritanceAndPolymorphism
    {
        static void Main(string[] args)
        {
            Signature.Header("Inheritance and Polymorphism");
            Console.WriteLine("\n***** PRODUCT *****\n");

            Product p1 = new Product("Iocane Powder", 299.99m,
                "Oderless, tasteless, dissolves instantly in liquid.");

            Console.WriteLine(p1);

            //CalcHolidayDiscount is an instance method, because it needs to know
            //the Price of a Product. So, we must call it from
            //the variableName.CalcHolidayDiscount()

            Console.WriteLine("Discounted Price {0:c}",
                p1.CalcHolidayDiscount());

            //DisplayRetrunPolicy is a Static method, so we call it from
            //ClassName.MethodName(), because it doesn't need any info
            //about an individual product.

            Console.WriteLine("RETRUN POLICY: \n" + Product.DisplayReturnPolicy());

            Console.WriteLine("\n**** BOOKS *****\n");

            Book bk1 = new Book("Castle Storming Procedures", 19.99m,
                "Best ways to have fun storming the castle.", true, "Miracle Max", 100);

            Console.WriteLine(bk1);

            Console.WriteLine($"{bk1.Name} will be {bk1.CalcHolidayDiscount():c} during the holidays.");

            Console.WriteLine("RETURN POLICY: \n" + Book.DisplayReturnPolicy());

            Console.WriteLine("***** SOFTWARE *****\n");

            Software sw1 = new Software("Myst", 5.99m, "This is old school, super awesome cool!", false,
                OS.Android, "2.Awesome");

            Console.WriteLine(sw1);

            Console.WriteLine($"{sw1.Name} will be {sw1.CalcHolidayDiscount():c} during the holidays.");

            Console.WriteLine("RETURN POLICY: \n" + Software.DisplayReturnPolicy());

            /*
             * Put several different Products (of different types)
             * into 1 big collection and then call CalcHolidayDiscount on each.
             * 
             * The biggest common type for Book, Software, and Product is Product.
             * 
             * That means, we can store all of them into a collection of type product.
             * 
             * With this collection, when we call the method on each, it will determine automatically
             * if they are a child class and use their OWN method version.
             * 
             * This is called Late Binding -- At runtime .NET determines the actual type of Product each
             * object is.
             */

            List<Product> items = new List<Product>
            {
                p1, bk1, sw1
                //colletion Initialization Syntax
            };
            //end items.Add(x)

            foreach (Product item in items)
            {
                Console.WriteLine($"{item.Name} is a {item.GetType().Name}\n" +
                    $"Holiday Discount Price: {item.CalcHolidayDiscount():c}");
            }

        }//end main()
    }//end class
}//end namespace
