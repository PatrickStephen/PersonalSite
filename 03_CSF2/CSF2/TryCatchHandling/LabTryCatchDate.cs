using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TryCatchHandling
{
    class LabTryCatchDate
    {
        static void Main(string[] args)
        {
            

            try
            {
                Console.WriteLine("Please enter the year you were born (Full year): ");
                int yearBorn = int.Parse(Console.ReadLine());
                if (yearBorn < 1900 || yearBorn > DateTime.Now.Year)
                {
                    throw new ArgumentOutOfRangeException();
                }

                Console.WriteLine("Please enter the month you were born (1-12): ");
                int monthBorn = int.Parse(Console.ReadLine());
                if (monthBorn < 1 || monthBorn > 12)
                {
                    throw new ArgumentOutOfRangeException();
                }

                Console.WriteLine("Please enter the day you were born (1-31): ");
                int dayBorn = int.Parse(Console.ReadLine());
                if (dayBorn < 1 || dayBorn > 31)
                {
                    throw new ArgumentOutOfRangeException();
                }
                DateTime bDay = new DateTime(yearBorn, monthBorn, dayBorn);
                Console.WriteLine("Your birthday is: {0:D}", bDay);
            }
            catch (ArgumentOutOfRangeException)
            {
                Console.WriteLine("Date entered was not valid");
            }
            catch (OverflowException)
            {
                Console.WriteLine("Please enter a valid number");
            }
            catch (Exception ex)
            {

                Console.WriteLine("An error occured." +
                    $"Details:\n" +
                    $"{ex.Message}\n" +
                    $"{ex.Source}\n");
                //just examples of {ex.--}
            }

            //also do like
            Console.WriteLine("Enter a Full Date");
            DateTime secondBDay = Convert.ToDateTime(Console.ReadLine());
            Console.WriteLine($"{secondBDay:D}");
             

        }
    }
}
