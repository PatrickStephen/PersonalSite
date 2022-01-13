using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _4Thursday
{
    class BranchingIf
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Branching with If");

            /*
             * If allows you to test for a condition. If that
             * condition is true it runs the code inside of the scope.
             * Otherwise, the scope is skipped.
             * 
             * Optionally, you can add one or more else ifs that will
             * run if the previous conditions were not met and their
             * condition is true.
             * 
             * Optionally, you can also include 1 final ELSE with NO
             * condition, it will always run if nothing else above
             * did, and it MUST always be the last statement of
             * an IF tree.
             */

            Console.WriteLine("what day is it? Monday, Tuesday, etc...");
            string userDay = Console.ReadLine().ToLower();

            if (userDay == "thursday")
            {
                //The code here in this scope {} will ONLY run if the
                //above condition is true
                Console.WriteLine("I never could get the hang of Thursdays...");
            }// end if

            Console.WriteLine("\nMoving Along...\n");

            //Now a FULL if tree.
            //Only 1 scope of an IF tree will run.
            int montsterStrength = 100;
            int heroStrength;
            Console.WriteLine("In this cave, you see bones and a white rabbit.");
            Console.Write("Enter your attack strenght: ");
            heroStrength = Convert.ToInt32(Console.ReadLine());

            Console.WriteLine();

            if (heroStrength > montsterStrength)
            {
                Console.WriteLine("You use the Holy Hand Grenade of Antioch " +
                    "and blow the rabbit to tiny bits.");
            }// end of IF

            else if (heroStrength == montsterStrength)                
            {
                //User entered the same number as monsterStrength
                Console.WriteLine("Alright, then. We'll call it a draw");
            }// end ELSE IF

            else if (heroStrength >= montsterStrength *.75)
            {
                //the user entered a number greater than or equal to
                //75% of the rabbit's strength. If the rabbit's strength
                //is 100, this checks for 75-99
                Console.WriteLine("You die a valiant death, but put up a great fight.");
            }// end ELSE IF

            else if (heroStrength > 0)
            {
                //1-74
                Console.WriteLine("You join the pile of bones!");
            }// end ELSE IF
            else if (heroStrength > 20)
            {
                //This will NEVER run. In order for this condition to be true,
                //one of the conditions above would already have been true and
                //the if tree was exited.
                //This is a logic error.
                Console.WriteLine("This isn's supposed to run!");
            }// end of ELSE IF
            else
            {
                //NO CONDITION FOR ELSE STATEMENT
                //If used, ELSE must be the LAST statement of an IF tree
                //Will run if the user enters anything less than or equal to 0.
                Console.WriteLine("Dude... You're already dead...");
            }// end ELSE
            Console.WriteLine();

            //The "condition" just needs to be or resolve to a true or false value
            //Because a bool stores a true or false value, we can use
            //a bool to determine whether or not an IF statement should run.
            bool runMe = true;

            if (runMe)
            {
                Console.WriteLine("\nProgram running...\n");
            }//end IF

            bool isAdmin = false;
            //Captrue user input to determine if the user should
            // have access to some functionality.

            Console.WriteLine("Enter your username: ");
            string username = Console.ReadLine().ToUpper();

            if (username == "PATRICK" || username == "ADMIN")
            {
                isAdmin = true;
            }//end IF

            if (isAdmin)
            {
                Console.WriteLine("You're an Admin!");
            }//end IF

            //NESTED IF: you can NEST IF trees inside of branches of other if trees.
            Console.WriteLine("Shall we play a game? ");
            string userProgram = Console.ReadLine().ToUpper();

            if (userProgram == "Y" || userProgram == "YES")
            {

                //Console.WriteLine("Program Running...");
                Console.Write("Type chess, frogger, or war: ");
                string userGame = Console.ReadLine().ToLower();
                if (userGame == "chess")
                {
                    Console.WriteLine("I calculate that you would lose. Checkmate!");
                }//end IF CHESS

                else if (userGame == "frogger")
                {
                    Console.WriteLine("You're too slow...SPLAT!");
                }//end else if frogger

                else if (userGame == "war")
                {
                    Console.WriteLine("Global thermonuclear war executed!");
                }//end ELSE IF war

                else
                {
                    Console.WriteLine("Response not understood.");
                }//end ELSE
            }//end IF (Y or YES)

            else if (userProgram == "N" || userProgram == "NO")
            {
                Console.WriteLine("We didn't want you to play our games anyway...");
            }//end IF (N or NO)

            else
            {
                Console.WriteLine("Response not understood, please restart.");
            }//end of ELSE

            //IF statements are GREAT with numeric ranges
            Console.Write("Enter the score on your last Physics exam: ");
            byte testScore = byte.Parse(Console.ReadLine());
            if (testScore >= 90)
            {
                Console.WriteLine("Great Job! You got an A!");
            }//end IF A

            else if (testScore >= 80)
            {
                Console.WriteLine("Fair job...B");
            }//end IF B
            
            else if (testScore >= 70)
            {
                Console.WriteLine("Adequate... C");
            }//end IF C

            else if (testScore >= 60)
            {
                Console.WriteLine("Poor...D");
            }// IF D

            else
            {
                Console.WriteLine("Dude... Did you even true?");
            }//end ELSE F

            //The Ternary Operator: is a quick inline if/else statement
            //Syntax:
            //BooleanCondition ? codeIFTrue : codeIfFalse
            Console.Write("How many Daleks are there? ");
            int dalekCount = int.Parse(Console.ReadLine());
            Console.WriteLine("Oh, no! {0} Dalek{1}!",
                dalekCount,
                dalekCount == 1 ? "" : "s");
            //isAdmin ? "You're and admin" : "Not and admin";



                Console.WriteLine();
        }//end svm
    }//end class
}//end namecase
