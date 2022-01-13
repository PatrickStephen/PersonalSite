using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _2Tuesday
{
    class CastingLab
    {
        static void Main(string[] args)
        {
            Console.WriteLine("CastingLab!");

            byte puddle = 100;
            short pond = 29456;
            int lake = 100000; //one hundred thousand
            long ocean = 5;

            ocean = (int)lake;
            Console.WriteLine("Ocean: " + ocean);
            Console.WriteLine("Lake: " + lake);

            pond = (byte)puddle;
            Console.WriteLine("Pond: " + pond);
            Console.WriteLine("Puddle: " + puddle);

            ocean = (short)pond;
            Console.WriteLine("Ocean: " + ocean);
            Console.WriteLine("Pond: " + pond);

            //lake = (long)ocean;
            Console.WriteLine();
            Console.WriteLine();
        }
    }
}
