using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using DungeonLibrary;//added
using DungeonMonster;//added

namespace DungeonApplication
{
    public class Program
    {
        static void Main(string[] args)
        {
            //(“{0, “ + ((Console.WindowWidth / 2)+ txt.Length / 2) + “}”,txt)


            string harryPotter = @"
                                         _ __
        ___                             | '  \
   ___  \ /  ___         ,'\_           | .-. \        /|
   \ /  | |,'__ \  ,'\_  |   \          | | | |      ,' |_   /|
 _ | |  | |\/  \ \ |   \ | |\_|    _    | |_| |   _ '-. .-',' |_   _
// | |  | |____| | | |\_|| |__    //    |     | ,'_`. | | '-. .-',' `. ,'\_
\\_| |_,' .-, _  | | |   | |\ \  //    .| |\_/ | / \ || |   | | / |\  \|   \
 `-. .-'| |/ / | | | |   | | \ \//     |  |    | | | || |   | | | |_\ || |\_|
   | |  | || \_| | | |   /_\  \ /      | |`    | | | || |   | | | .---'| |
   | |  | |\___,_\ /_\ _      //       | |     | \_/ || |   | | | |  /\| |
   /_\  | |           //_____//       .||`  _   `._,' | |   | | \ `-' /| |
        /_\           `------'        \ |  /-\ND _     `.\  | |  `._,' /_\
                                       \|        |HE         `.\
                                      __        _           _   __  _
                                     /   |__|  /_\  |\  /| |_) |_  |_)
                                     \__ |  | /   \ | \/ | |_) |__ | \
                                             _  _   _   __  _  _   __ ___ _
                                            (_)|-  (_` |_  /  |_) |_   | (_`
                                                   ._) |__ \_ | \ |__  | ._)
";
            Console.WriteLine(harryPotter);
            string txt = "Why does it always have to be spiders!?!?\n";
            Console.Title = txt;
            

            Console.WriteLine("{0," +
                    ((Console.WindowWidth / 2) + txt.Length / 2) + "}", txt);

                    Console.WriteLine("Your journey begins...\n");

            int score = 0;

            // 1.Create a Player

            //2. Create a Weapon for the Player
            Weapon sword = new Weapon(1, 8, "Short Sword", 10, false);

            Player player = new Player("Leeroy Jenkins", 70, 5, 40, 40, Race.Elf, sword);

            //TODO 3. Add Customization based on player race
            //implemented anywhere (elf has + 5 to HitChance in Player.cs constructor)

            //4. Create a loop fo the room and monster

            bool exit = false;

            do
            {
                //enter the room


                //5. Get a room description from a custom method that generates them
                Console.WriteLine(GetRoom());

                //6. Create a monster in the room for the Player to battle.
                //Learn about creating objects and randomly selecting them
                Rabbit r1 = new Rabbit(); // Uses the default ctor, which sets those base value and
                //creates the baby rabbit.
                Rabbit r2 = new Rabbit("White Rabbit", 25, 25, 50, 20, 2, 8,
                    "That's no ordinary Rabbit! Look at the bones!", true);

                Spider s1 = new Spider();

                Spider s2 = new Spider("Giant Spider!", 25, 25, 40, 25, 3, 10,
                    "That's not a normal spider thats an Acromantula!!", true);

                //Since all of our child monsters are all of the type Monster, we
                //can store them in an array of type Monster.
                Monster[] monsters = {r1, r1, r1, r2, s1, s1, s1, s2 };

                int randomIndex = new Random().Next(monsters.Length);
                Monster monster = monsters[randomIndex];//Polymorphism, we don't know what kind
                //we will get, so we'll just save it as a Monster.

                //Show that monster in the room
                Console.WriteLine("\nIn this room: " + monster.Name);

                //7. Create a loop for the user choice menu (inner loop)
                bool reload = false;
                do
                {
                    //8. Create a menu of options
                    Console.WriteLine(@"
Please choose and action:
A) Attack
R) Run Away
P) Player Info
M) Monster Info
X) Exit
");
                    //9 Capture the user choice.
                    string userChoice = Console.ReadKey(true).Key.ToString();

                    Console.Clear();
                    //10. Build switch to perform an action based on the users input
                    switch (userChoice)
                    {
                        case "A":
                            //11. Create attack/ battle functionality
                            Combat.DoBattle(player, monster);

                            //12. Handle if the user wins
                            if (monster.Life <= 0)
                            {
                                //it's dead!!
                                //You could put logic here to have the
                                //player get some items, heal a bit, or exp
                                //due to defeating the monster.
                                Console.ForegroundColor = ConsoleColor.Green;
                                Console.WriteLine("\nYou killed {0}!\n", monster.Name);
                                Console.ResetColor();
                                reload = true;// new room and monster
                            }//end if monster if dead

                            //Console.WriteLine("Attack Method Goes Here...");
                            break;

                        case "R":
                            //13. Give the monster a free attack since you ran away
                            Console.WriteLine("Run Away!!");
                            Console.WriteLine($"{monster.Name} attacks as you flee!");
                            Combat.DoAttack(monster, player);//free attack
                            Console.WriteLine();
                            reload = true;//"re"load a new room
                            break;

                        case "P":
                            Console.WriteLine("Player Info:");
                            //14. Display Player info
                            Console.WriteLine(player);
                            Console.WriteLine("Monsters slain: " + score);
                            break;

                        case "M":
                            Console.WriteLine("Monster Info:");
                            //15. Display Monster info
                            Console.WriteLine(monster);//this will use
                            //polymorphism to get the correct ToString
                            break;

                        case "X":
                        case "E":
                        case "Escape":
                            Console.WriteLine("No one likes a quitter...");
                            exit = true;
                            break;

                        default:
                            Console.WriteLine("Thou hast chosen an invalid option.");
                            break;

                    }//end switch

                    //16. Check Player Info
                    if (player.Life <= 0)
                    {
                        Console.WriteLine("Dude... you died!\a");
                        exit = true;
                    }//end if player is dead!

                } while (!reload && !exit);
                //While reload and exit are BOTH NOT TRUE, keep looping.
                //IF reload is true, leave the inner loop.
                //If the exit is true, leave both loops.
            } while (!exit);//While exit is NOT TRUE, keep looping

            Console.WriteLine($"" +
                $"You defeated {score:n0} monster{(score == 1 ? "." : "s")}");

        }//end main

        #region Custom Methods
        private static string GetRoom()
        {
            string[] rooms =
            {
                "You fell down a pit filled with devil's snare...",
                "You entered a room filled with bones",
                "You are in the forbidin forest",
                "You are by the lake",
                "You are in the observation tower",
                "You are in the dungeon under the stairs"
            };
            //MINI-LAB
            //Finish the string array, and return one of the room descriptions

            //Random ran = new Random();

            //int indexNbr = ran.Next(rooms.Length);

            //string room = rooms[indexNbr];

            //return room;

            // or the shorter method is below

            //refactored
            return rooms[new Random().Next(rooms.Length)];


        }//end GetRoom
        #endregion
    }//end class
}//end namespace
