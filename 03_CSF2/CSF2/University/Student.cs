using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace University
{   //defaults to internal... except the first one...make it public
    public class Student
    {
        //frugal / fields
        private double _gpa;

        //people / properties
        public string Name { get; set; }
        public int ID { get; set; }
        public Dept Major { get; set; }
        public string ContactInfo { get; set; }
        
        //Buisness rule: GPA must be at least 0, and no greater than 4.
        public double GPA
        {
            get { return _gpa; }
            set { _gpa = (value >= 0 && value <= 4 ? value : 0); }
        }//end GPA

        //collect / constructors (ctors)
        public Student(string name, int id, double gpa, Dept major,
            string contactInfo)
        {
            //Prop = para
            Name = name;
            ID = id;
            GPA = gpa;
            Major = major;
            ContactInfo = contactInfo;
        }//end FQ CTOR

        //money / methods
        public override string ToString()
        {
            return Name;
        }//end ToString()
        

    }//end class
}//end namespace
