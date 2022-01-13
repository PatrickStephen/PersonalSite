using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Charity
{
    //MAKE IT PUBLIC!
    public class Employee //DataType class, no SVM()
    {
        //frugal / fields
        //private datatype _camelCase
        private string _name;
        private Organization _employer;
        private DateTime _dateOfHire;
        private decimal _salary;
        private bool _isPaidBiWeekly;

        //people / properties
        //public datatype PascalCase
        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }//end name

        public Organization Employer
        {
            get { return _employer; }
            set { _employer = value; }           
        }//end Employer

        public DateTime DateOfHire
        {
            get { return _dateOfHire; }
            set { _dateOfHire = value; }
        }//end DateOfHire

        public decimal Salary
        {
            get { return _salary; }
            set { _salary = value; }
        }//end of Salary
        
        public bool IsPaidBiWeekly
        {
            get { return _isPaidBiWeekly; }
            set { _isPaidBiWeekly = value; }
        }//end IsPaidBiWeekly

        //collect / constructors (ctors)

        //public ClassName(datatype parameterName)
        public Employee(string name, Organization employer, DateTime dateOfHire, decimal salary, bool isPaidBiWeekly)
        {
            //PascalCase = camelCase
            //Property = parameter
            Name = name;
            Employer = employer;
            DateOfHire = dateOfHire;
            Salary = salary;
            IsPaidBiWeekly = isPaidBiWeekly;
        }//End fully qualified constructor (FQ CTOR)

        public Employee() { }//done!

        //money / methods
        public override string ToString()
        {
            //return base.ToString();
            return string.Format("{0}\t\tSalary: {1:c}\n" +
                                 "Hired: {2:d}\n" +
                                 "{3}\n" +
                                 "Employer: {4}\n",
                                 Name,
                                 Salary,
                                 DateOfHire,
                                 IsPaidBiWeekly ? "Paid Bi-Weekly" : "Paid Weekly",
                                 Employer.Name);
        }//end ToString

        /*
         * STATIC vs INSTANCE
         * Static methods would be something you'd want to be able to call from the class
         * without needing any info about an actual object of this type.
         * 
         * Instance methods are often setup to use info for a PARTICULAR object.
         */

        public decimal CalculatePay()
        {
            /*
             * The Static Keyword is NOT in the method signature.
             * IF we add it, we lose access to all of the properties.
             * Since we need to use Salary and IsPaidBiWeekly for our method
             * we must leave static out of the signature
             */
            return IsPaidBiWeekly ? Salary / 26 : Salary / 52;
            //ALWAYS use the PascalCase Property in methods.
            //Otherwise, you bypass the "gaurds"
        }//end CalculatePay()

        //Called from Employee.CalculatePay()
        public static decimal CalculatePay(bool isPaidBiWeekly, decimal salary)
        {
            return isPaidBiWeekly ? salary / 26 : salary / 52;
        }//end Static CalculatePay()

        //BONUS EXAMPLE
        public static decimal CalculatePay(Employee emp)
        {
            return emp.IsPaidBiWeekly ? emp.Salary / 26 : emp.Salary / 52;
        }
    }//end Class
}//end namespace
