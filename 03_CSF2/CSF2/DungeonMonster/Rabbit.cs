using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using DungeonLibrary;//added

namespace DungeonMonster
{
    public class Rabbit : Monster
    {

        //Public and a child of monster

        //props
        public bool IsFluffy { get; set; }

        //ctor
        public Rabbit()
        {
            //SET MAX VALUES FIRST!
            MaxLife = 6;
            MaxDamage = 3;
            Name = "Baby Rabbit";
            Life = 6;
            HitChance = 20;
            Block = 20;
            MinDamage = 20;
            Description = "It's just a cute little bunny.... why would you hurt it??" +
                " Bully!!";
            IsFluffy = false;
        }//end default ctor

        public Rabbit(string name, int life, int maxLife, int hitChance,
            int block, int minDamage, int maxDamage, string description, bool isFluffy)
            : base(name, life, maxLife, hitChance, block, minDamage, maxDamage, description)
        {
            //just handle the unique ones
            IsFluffy = IsFluffy;
        }//end FQ CTOR

        //methods
        public override string ToString()
        {
            return base.ToString() + (IsFluffy ? "Fluffy" : "Not so fluffy...");
        }//end ToString()

        //override block : if they are fluffy, they get a bonus 50% to their block value
        public override int CalcBlock()
        {
            //Typically when dealing with a method that has a return type,
            //we create the return type first.
            int calculatedBlock = Block;

            if (IsFluffy)
            {
                calculatedBlock += calculatedBlock / 2;
            }

            return calculatedBlock;
        }//end CalcBlock

    }//end class
}//end namespace
