using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _4Thursday
{
    class ArraysLab
    {
        static void Main(string[] args)
        {
            Console.WriteLine("ArraysLab");
            // Ask the user for 5 scores (1 at a time)
            //Display the high, low and average score

            //Variables
            int[] scores = new int[5];
            int max = 0;
            int min = 0;
            double avg = 0;

            //input scores
            Console.WriteLine("Enter 5 scores");

            Console.Write("1: ");
            scores[0] = Convert.ToInt32(Console.ReadLine());
            Console.Write("2: ");
            scores[1] = Convert.ToInt32(Console.ReadLine());
            Console.Write("3: ");
            scores[2] = Convert.ToInt32(Console.ReadLine());
            Console.Write("4: ");
            scores[3] = Convert.ToInt32(Console.ReadLine());
            Console.Write("5: ");
            scores[4] = Convert.ToInt32(Console.ReadLine());

            //calculation
            Array.Sort(scores);//ascending sort

            min = scores[0];
            max = scores[scores.Length - 1];
            avg = Convert.ToDouble(scores.Sum()) / scores.Length;

            //test

            //response
            Console.WriteLine($"Min: {min}\nMax: {max}\nAvg: {avg}");

            Console.WriteLine("/nAnd the alternate way...");
            //Alternate:
            min = scores.Min();
            max = scores.Max();
            avg = scores.Average();

            Console.WriteLine($"Min: {min}\nMax: {max}\nAvg: {avg}");


        }//end SVM
    }//end class
}//end namespace
