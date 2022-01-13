using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DungeonLibrary
{
    //New classes default to internal. We must make it public in order to
    //access it from outside the project.
    public class Weapon
    {
        //frugal / fields
        private int _minDamage;

        //people / properties
        //properties with business rules should go last
        public int MaxDamage { get; set; }
        public string Name { get; set; }
        public int BonusHitChance { get; set; }
        public bool IsTwoHanded { get; set; }

        public int MinDamage
        { get { return _minDamage; }
            set
            {
                //value can't be more than the MaxDamage
                //and cannot be less than 1
                if (value > 0 && value <MaxDamage)
                {
                    //you're good
                    _minDamage = value;
                }
                else
                {
                    _minDamage = 1;
                }
                //or this way when you learn more
                //_minDamage = (value > 0 && value <= MaxDamage) ? value : 1;
            }
        }


        //collect / constructors (ctors)
        public Weapon(int minDamage, int maxDamage, string name,
            int bonusHitChance, bool isTwoHanded)
        {
            //If you have ANY properties tat have business rules
            //that are besed off of any OTHER properties,
            //set the "OTHER" properties first.
            MaxDamage = maxDamage;//Since MinDamage depends on Max, set Max First!
            MinDamage = minDamage;
            Name = name;
            BonusHitChance = bonusHitChance;
            IsTwoHanded = isTwoHanded;
        }//ends FQ CTOR
        //NO DEFAULT CTOR!
        //We don't want anyone to create a blank weapon, and then only initialize some of
        //the info.

        //money / methods
        public override string ToString()
        {
            return $"{Name}\t{MinDamage} - {MaxDamage} Damage\n" +
                $"Bonus Hit: {BonusHitChance}%\t" +
                $"{(IsTwoHanded ? "Two-Handed" : "One-Handed")}";
        }//end ToString() override
    }
}
