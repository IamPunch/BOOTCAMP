import random

ranks = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
suits = ['Hearts', 'Diamonds', 'Clubs', 'Spades']

deck = []

for suit in suits:
    for rank in ranks:
        deck.append(rank + " of " + suit)

random.shuffle(deck)

print("Welcome to the Card Game!")
print("Total cards:", len(deck))

num_players = int(input("Enter number of players: "))

while 52 % num_players != 0:
    print("Cards cannot be divided equally.")
    num_players = int(input("Enter number of players: "))

cards_per_player = 52 // num_players

players = {}

for p in range(1, num_players + 1):
    players[p] = []

for i in range(52):
    player = (i % num_players) + 1
    players[player].append(deck[i])

scores = {}

for p in range(1, num_players + 1):
    scores[p] = 0

for round in range(cards_per_player):

    print("\nRound", round + 1)

    cards_played = {}

    for p in range(1, num_players + 1):
        card = random.choice(players[p])
        players[p].remove(card)
        cards_played[p] = card
        print("Player", p, "played:", card)

    winner = int(input("Enter winner: "))

    scores[winner] = scores[winner] + 1

print("\nFINAL SCORES")

for p in range(1, num_players + 1):
    print("Player", p, ":", scores[p])

highest = max(scores.values())

for p in scores:
    if scores[p] == highest:
        print("Winner: Player", p)
