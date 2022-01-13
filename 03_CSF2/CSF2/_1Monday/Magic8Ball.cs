using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _1Monday
{
    class Magic8Ball
    {
        static void Main(string[] args)
        {
            // MAGIC 8 BALL LAB INSTRUCTIONS:

            // -Ask the user for their yes/ no question
            //- Respond with a random answer from your set (collection)of answers
            //- Set the program to loop based on user choice


            Console.WriteLine("Magic 8 Ball Lab");
            Console.Title = "Magic 8 Ball give me my answer...";



            bool quit = false;
            string[] magicEightBall = { "yes",
                                        "you die tomorrow",
                                        "no clue",
                                        "this is the way",
                                        "the stars sure are bright tonight",
                                        "I am your father",
                                        "Yippie Ki'yay"};

            do
            {
                Console.WriteLine("Please ask me a question young one...");
                Console.ReadLine();
                //return random answer from the 8 ball
                Random magicBall = new Random();
                int index = magicBall.Next(magicEightBall.Length);
                Console.WriteLine("Magic 8 Ball Says..." + magicEightBall[index]);
                Console.WriteLine("Would you like to go again? Y/N");
                ConsoleKey userChoice = Console.ReadKey().Key;
                switch (userChoice)
                {
                    case ConsoleKey.Y:
                        quit = false;
                        Console.Clear();
                        break;
                    default:
                        quit = true;
                        Console.Clear();
                        Console.WriteLine("Thanks for your questions.");
                        break;
                }

            } while (!quit);



            //ask to go again
            //} while (!quit);
            //do
            //{
            //    Console.WriteLine("Thank you for asking you questions.");


        }
    }
}
