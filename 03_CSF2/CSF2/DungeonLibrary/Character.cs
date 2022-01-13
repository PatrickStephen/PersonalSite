using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DungeonLibrary
{
    //make it public
    //The abstract modifier indicates that the thing being modified
    //has an incomplete implementation. THe abstract modifier
    //can be used with classes, methods, and properties. Use the
    //abstract modifier in a class declaration to indicate that the
    //class is intended to only be a base(parent) class of other classes.
    public abstract class Character
    {
        //We brought over all of the fields/ properties that would be shared between
        //Player and Monster. We then commented those out in the player file.
        //This will allow us to use InHeritance to optimize our code reuse.
        //frugal / fields
        private int _life;

        //people / properties
        public string Name { get; set; }
        public int HitChance { get; set; }
        public int Block { get; set; }
        public int MaxLife { get; set; }
        public int Life
        {
            get { return _life; }
            set
            {
                if (value <= MaxLife)
                {
                    //good to go
                    _life = value;
                }
                else
                {
                    _life = MaxLife;
                }
            }//end set
        }//end Life

        //collect / constructors (ctors)
        //Since we don't actually inherit constructors and we already did a
        //lot of work defining the play FQ CTOR, we will not
        //create one here. We still get the free default one, but
        //we will be unable to use it since this class is abstract anyway.

        //money / methods
        //No ToString override.
        public virtual int CalcLife()
        {
            return Life;
        }//end CalcLife()

        public virtual int CalcBlock()
        {
            //To be able to override this in a child class,
            //make it VIRTUAL
            //This basic version just return block, but this
            //gives us the option to do something different in child classes.
            return Block;
        }//end CalcBlock()

        //MINI-LAB
        //Make CalcHitChance() to return HitChance. Make it Overridable.

        public virtual int CalcHitChance()
        {
            return HitChance;
        }//end HitChance()
        public virtual int CalcDamage()
        {
            return 0;
            //OVerride this in Monster and Player
        }//end CalcDamage()
    }//end class
}//end namespace
