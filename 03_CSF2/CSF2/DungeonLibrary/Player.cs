using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DungeonLibrary
{
    public sealed class Player : Character //this is now a child of Character
        //The sealed keyword indicates that this class cannot be used as a 
        //parent (base) class for any other classes.
    {
        //frugal / fields
        //private int _life;
        //We only need to create fields for the ones we will have business rules on.

        //people / properties
        //Automatic properties are a shortcut syntax that allows you
        //to create a shortened version of a public property.
        //They have an "open" getter and setter! The gaurd is asleep!
        //Auto props automatically create a default field for you at runtime.
        //public string Name { get; set; }
        //public int HitChance { get; set; }
        //public int Block { get; set; }
        //public int MaxLife { get; set; }
        public Race CharacterRace { get; set; }
        public Weapon EquippedWeapon { get; set; }

        //You can NOT have business rules with an auto prop
        //public int Life
        //{
        //    get { return _life; }
        //    set
        //    {
        //        if (value <= MaxLife)
        //        {
        //            //good to go
        //            _life = value;
        //        }
        //        else
        //        {
        //            _life = MaxLife;
        //        }
        //    }//end set
        //}//end Life

        //collect / constructors (ctors)
        public Player(string name, int hitChance, int block, int life, int maxLife,
            Race characterRace, Weapon equippedWeapon)
        {
            //ASSIGNMENTS: PascalCase = camelCase;
            MaxLife = maxLife;
            Name = name;
            HitChance = hitChance;
            Life = life;
            CharacterRace = characterRace;
            EquippedWeapon = equippedWeapon;
            Block = block;

            //BONUS: Customize a prop based off of Race
            switch (CharacterRace)
            {
                //do one for every race if you want to customize each race stats
                case Race.Elf:
                    HitChance += 5;
                   break;
            }
        }//end FQ CTOR

        //money / methods

        public override string ToString()
        {
            string description = "";

            switch (CharacterRace)
            {
                case Race.Dwarf:
                    description = "Dwarf";
                    break;

                case Race.Elf:
                    description = "Elf";
                    break;

                case Race.Orc:
                    description = "Orc";
                    break;

                case Race.Gnome:
                    description = "Gnome";
                    break;

                case Race.Human:
                    description = "Human";
                    break;

                case Race.Tiefling:
                    description = "Tiefling";
                    break;

                case Race.Kajhit:
                    description = "Kajhit";
                    break;

                case Race.Hobbit:
                    description = "Hobbit";
                    break;

                case Race.FuriizaShuzoku:
                    description = "FuriizaShuzoku";
                    break;

                case Race.Shade:
                    description = "Shade";
                    break;
              
            }

            return $"-=-= {Name} =-=-\n" +
                $"Life: {Life} / {MaxLife}\n" +
                $"Hit Chance: {CalcHitChance()}%\n" +
                $"Weapon:\n{EquippedWeapon}\n" +
                $"Block: {Block}\n" +
                $"Description: {description}";

        }//end ToString() Override

        public override int CalcDamage()
        {
            //return base.CalcDamage();
            //create a random object
            Random rand = new Random();

            //determine damage
            int damage = rand.Next(EquippedWeapon.MinDamage, EquippedWeapon.MaxDamage + 1);

            //return the damage
            return damage;
        }//end CalcDamamge

        public override int CalcHitChance()
        {
            return base.CalcHitChance() + EquippedWeapon.BonusHitChance;
        }//end CalcHitChance()
    }//end class
}//end namespace
