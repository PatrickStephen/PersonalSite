using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DungeonLibrary;//added;

namespace DungeonMonster
{
    public class Spider : Monster
    {
        public bool IsGiant { get; set; }

        public Spider()
        {
            //SET MAX VALUES FIRST
            MaxLife = 10;
            MaxDamage = 8;
            Name = "Spider";
            Life = 10;
            HitChance = 20;
            Block = 25;
            MinDamage = 3;
            Description = "It is a spider! AAHHHHHHH!!!";
            IsGiant = false;
        }//end default ctor

        public Spider(string name, int life, int maxLife, int hitChance,
            int block, int minDamage, int maxDamage, string description, bool isGiant)
            : base(name, life, maxLife, hitChance, block, minDamage, maxDamage, description)
            
        {
            IsGiant = IsGiant;
        }//end FQ CTOR

        public override string ToString()
        {
            return base.ToString() + (IsGiant ? "Giant" : "Still scary!");
        }//end ToString()

        //Override life : if it is Giant, the get an extra 20 health value
        public override int CalcHitChance()
        {
            int calculatedHitChance = HitChance;

            if (IsGiant)
            {
                calculatedHitChance += calculatedHitChance + 20;
            }

            return calculatedHitChance;
        }//end CalcHitChance
    }//end class
}//end namespace
