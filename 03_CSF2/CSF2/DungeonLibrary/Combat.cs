﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DungeonLibrary
{
    public class Combat
    {
        //This class will not have fields, properties, or any custom ctors
        //It is just a "warehouse" for different methods.

        public static void DoAttack(Character attacker, Character defender)
        {
            //Get a random number from 1-100 as a dice roll
            int diceRoll = new Random().Next(1, 101);
            System.Threading.Thread.Sleep(30);
            if (diceRoll <= (attacker.CalcHitChance() - defender.CalcBlock()))
            {
                //If the attacker hits, calc the damage
                int damageDealt = attacker.CalcDamage();

                //assign the damage
                defender.Life -= damageDealt;

                //Write the result to the screen
                Console.ForegroundColor = ConsoleColor.Red;
                Console.WriteLine($"{attacker.Name} hit {defender.Name} for {damageDealt} damage!");
                Console.ResetColor();
            }//end if
            else
            {
                //the attack missed
                Console.WriteLine($"{attacker.Name} missed!");
            }
        }//end DoAttack()

        public static void DoBattle(Player player, Monster monster)
        {
            //player attacks first
            DoAttack(player, monster);

            //monster attacks second, if they live
            if (monster.Life > 0)
            {
                DoAttack(monster, player);
            }//end if
        }//end PSV
    }//end class
}//end namespace
