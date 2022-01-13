using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Blackjack
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Title = "--- BlackJack ---";
            bool gamePlay = true;

            Console.WriteLine("Welcome to the Centriq Casino!");

            do
            {
                List<int> deck = new List<int>() { 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11,
                2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11,
                2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11,};

                Random rand = new Random();
                int playerScore = 0;
                int dealerScore = 0;
                int dealerUpCard = 0;

                for (int i = 0; i < 2; i++)//Deal a card to player then dealer
                {
                    int playerCard = deck[rand.Next(0, deck.Count)];
                    deck.Remove(playerCard);
                    playerScore = playerScore + playerCard;
                    int dealerCard = deck[rand.Next(0, deck.Count)];
                    deck.Remove(dealerCard);
                    dealerScore = dealerScore + dealerCard;
                    if (i == 1)
                    {
                        dealerUpCard = dealerCard;
                    }
                }

                bool playerTurn = true;

                while (playerTurn)
                {
                    Console.WriteLine($"Your Score: {playerScore}\n" +
                        $"Dealer Card: {dealerScore}\n");

                    Console.WriteLine($"H: Hit\n" +
                        $"S: Stand\n" +
                        $"E: Exit");
                    string userInput = Console.ReadLine().ToUpper();

                    switch (userInput)
                    {
                        case "H":
                        case "HIT":
                            Console.WriteLine("Hit!!");

                            int playerCard = deck[rand.Next(0, deck.Count)];
                            deck.Remove(playerCard);
                            playerScore = playerScore + playerCard;

                            if (playerScore > 21)
                            {
                                Console.WriteLine("You Bust!");
                                playerTurn = false;
                            }

                            break;

                        case "S":
                        case "STAND":
                            Console.WriteLine("Stand.");
                            playerTurn = false;
                            break;

                        case "E":
                        case "EXIT":
                            playerTurn = false;
                            gamePlay = false;
                            break;

                        default:
                            Console.WriteLine("Input unrecognized. Please try again.");
                            break;

                    }
                }

                while (dealerScore < 17)
                {
                    //Hit till at 17 or above
                    int dealerCard = deck[rand.Next(0, deck.Count)];
                    deck.Remove(dealerCard);
                    dealerScore = dealerScore + dealerCard;

                    if (dealerScore > 21)
                    {
                        Console.WriteLine("Dealer Bust!");
                    }
                }

                Console.WriteLine($"Your Score: {playerScore}\n" +
                $"Dealer Card: {dealerScore}\n");

                if (playerScore > dealerScore && playerScore <= 21)
                {
                    Console.WriteLine("Congradulations you win!!!");
                }
                if (dealerScore > playerScore && dealerScore <= 21)
                {
                    Console.WriteLine("Too bad...You Loss.");
                }
                if (playerScore == dealerScore && playerScore <= 21)
                {
                    Console.WriteLine("Push.");
                }


                Console.WriteLine("Would you like to play another game? Y/N\n");
                ConsoleKey userResponse = Console.ReadKey(true).Key;

                if (userResponse != ConsoleKey.Y)
                {
                    Console.Clear();
                    gamePlay = false;
                    Console.WriteLine("\nThanks for playing");
                }

            } while (gamePlay);

        }

    }
}

