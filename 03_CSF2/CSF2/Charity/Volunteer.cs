using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Charity
{
    /*
     * This Class Library project (Charity) is intedned to store classes that will
     * be consumed elsewhere in the application. Storing them here makes the application
     * more modular (all of the Charity Classes are in one place) and are reusable (all of
     * the classes can be used anywhere else in the application).
     * 
     * In order to use them in another project, we have to ensure that the classes we want
     * to use are public, the consuming project has a reference to this project, and optionally,
     * that any consuming class has a "using" statement for this namespace.
     */
    public class Volunteer
    {
        //DATA TYPE CLASS - It gets no SVM. It is inteneded to be a blueprint
        //to make other objects.

        //Fields (aka attributes): Represent info stored for an object of
        //"this" type.
        //Naming convention: _camelCase
        //Access modifier: private

        //Fields are just variables.
        private string _name;
        private byte _yearsOfService;
        private bool _isActive;

        //Properties (props): Control access to the fields.
        //Naming convention: The PascalCase version of the field name.
        //Access modifier: public
        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }

        public byte YearsOfService
        {
            get { return _yearsOfService; }
            set { _yearsOfService = value; }
        }

        public bool IsActive
        {
            get { return _isActive; }
            set { _isActive = value; }
        }
        //Fields and props work together to store info about objects
        //The fields store the info
        //The props pass the info back and forth between the field and the program
    }
}
