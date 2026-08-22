import random

ranks = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
rank_value = {r: i for i, r in enumerate(ranks, start=2)}
suits = ['Hearts', 'Diamonds', 'Clubs', 'Spades']

deck = [r + " of " + s for s in suits for r in ranks]
random.shuffle(deck)

print("Welcome to the Card Game!")
print("Total cards:", len(deck))

while True:
    try:
        num_players = int(input("Enter number of players: "))
        if num_players <= 0:
            print("Must be a positive number.")
            continue
        if 52 % num_players != 0:
            print("Cards cannot be divided equally.")
            continue
        break
    except ValueError:
        print("Enter a valid integer.")

cards_per_player = 52 // num_players
players = {p: [] for p in range(1, num_players + 1)}
for i, card in enumerate(deck):
    players[(i % num_players) + 1].append(card)

scores = {p: 0 for p in range(1, num_players + 1)}

for rnd in range(cards_per_player):
    print("\nRound", rnd + 1)
    cards_played = {}
    for p in range(1, num_players + 1):
        card = players[p].pop()
        cards_played[p] = card
        print("Player", p, "played:", card)

    winner = max(cards_played, key=lambda p: rank_value[cards_played[p].split(" of ")[0]])
    print("Round winner: Player", winner)
    scores[winner] += 1

print("\nFINAL SCORES")
for p in range(1, num_players + 1):
    print("Player", p, ":", scores[p])

highest = max(scores.values())
winners = [p for p in scores if scores[p] == highest]
if len(winners) == 1:
    print("Winner: Player", winners[0])
else:
    print("Tie between players:", winners)
