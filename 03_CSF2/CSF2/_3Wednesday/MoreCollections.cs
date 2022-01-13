using System;
using System.Collections;//added using for ArrayList
using System.Collections.Generic;//Arrays/List<T>
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3Wednesday
{
    class MoreCollections
    {
        static void Main(string[] args)
        {
            SignaturesLibrary.Signature.Header("More Collection Types");

            #region Comparing Different Collection Types
            /*
             * Collections are groups of objects stored together
             * under one name. Some examples: Array[], ArrayList[],
             * or List<> (aka "Typed List")
             * 
             * Array:
             * - Type safe (any type, but only one type per array)
             * - Length is fixed at declaration (can NOT change
             *  the length later in code)
             *  
             * ArrayList:
             * - Not type safe - it can store values of any datatype into 
             * any index in the collection. Mixing datatypes is acceptable.
             * This can cause issues, however, since the values are stored 
             * as type Object. This is called BOXING. To use the values as
             * their original datatype you have to cast them back to their
             * original datatype. This is called UNBOXING.
             * 
             * - Length IS expandable (CAN add/remove indexes after
             *  creation)
             *  
             * - NAMESPACE: System.Collections;
             * 
             * List (aka Typed List or List of T):
             * - Type safe (just like arrays)
             * - Expandable (CAN add/remove indexes after creation)
             * */
            #endregion

            //Refresh on Arrays
            string[] colors = { "red", "green", "blue", "purple" };
            Console.WriteLine("\n(H)Array!\n");

            foreach (string color in colors)
            {
                Console.WriteLine(color);
            }//end foreach

            Console.WriteLine("\nArray List!\n");

            ArrayList aList = new ArrayList();
            //We added a using statement so that we did't have to type
            //System.Collection.ArrayList
            //We created an "empty" ArrayList, but we could have set the "length"
            //"length" is called (count), but since we can change it as we go,
            //we'll start with a blank arraylist.

            aList.Add("Triforce");//Looks like a string,
            //but is actually implicitly cast to an Object.

            aList.Add(42);//The int is also stored as an Object!

            DateTime newYears = new DateTime(2022, 1, 1);
            aList.Add(newYears);

            object value = 27;
            Object name = "Gandalf";

            aList.Add(value);
            aList.Add(name);

            //Console.WriteLine(aList[1] * 2);
            //This is the problem with ArrayLists.
            //We get LOTS of flexibility with the types,
            //but we have to cast them BACK to their original
            //datatype to use them.

            //This is called UNBOXING, because we put something of a
            //smaller type, like an int, into a bigger type (Object).
            //Then, we explicitly cast the item to a small box.
            //SYNTAX
            //(datatype)objectName.
            Console.WriteLine((int)aList[1] * 2);
            //The index can only be unboxed to its ORIGINAL TYPE
            Console.WriteLine($"{(DateTime)aList[2]:d}");

            string str = (string)aList[0];
            str = str.ToUpper();

            aList[0] = str;

            Console.WriteLine(aList[0]);

            //Insert() lets you add a value to the collection
            //at a specified index
            //Add() Always puts the new value at the end.
            aList.Insert(1, "Ganon");

            //Capacity is the amount the list CAN hold, Count is the amount it
            //is currently holding.
            for (int i = 0; i < aList.Count; i++)
            {
                Console.WriteLine(aList[i] + " is at the index of " + i);
            }//end For

            //Now a typed list
            Console.WriteLine("\n\nTyped List!\n\n");

            //SYNTAX:
            //List<datatype> someName = new List<datatype>();
            List<int> scores = new List<int>();
            //since it is a list of ints, we can only put int objects into it.

            //Type safe and explandable, the best of both worlds.
            scores.Add(12);
            scores.Add(29);
            scores.Add(0);
            scores.Add(44);
            scores.Add(100);

            int x = 1000;
            scores.Add(x);

            //Arrays.Sort(arrayName);//STATIC, ClassName.MethodName()
            //listName.Sort();//INSTANCE, instanceName.MethodName()
            scores.Sort();

            foreach (int score in scores)
            {
                Console.WriteLine(score);
            }//end foreach
            Console.WriteLine("Count: " + scores.Count);
            Console.WriteLine("Capacity: " + scores.Capacity);
            Console.WriteLine();

            //Insert() inserts an item at a specified index
            scores.Insert(3, 99);
            foreach (int score in scores)
            {
                Console.WriteLine(score);
            }//end foreach

            Console.WriteLine("Count: " + scores.Count);
            Console.WriteLine();

            //RemoveAt()
            scores.RemoveAt(2);
            foreach (int score in scores)
            {
                Console.WriteLine(score);
            }//end foreach
            Console.WriteLine("Count: " + scores.Count);
            Console.WriteLine();

            /*
             * There are two kinds of collections: Generic and Non-Generic
             * Generic Collections are Strongly-Typed. (can be any type).
             * Non-Generic collections store values as Objects only.
             * Array & Typed-List are Generic.
             * ArrayList is non-Generic
             */

        }//end main
    }//end class
}//end namespace
