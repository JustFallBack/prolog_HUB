# poker.pl

This Prolog file contains facts representing various hands of cards to be tested for their ranking in poker.

## Explanation

In the game of poker with 32 cards, different combinations of cards have different rankings, determining the winner of each round. This file provides facts representing hands of cards (m1 to m12) along with predicates to check the validity of cards and hands, compare ranks of cards, determine if a hand is sorted, and compare two hands to find the higher one.

## Poker hand supported

- pair
- double pair
- three of a kind
- straight
- full_house
- four of a kind

The high card, flush, staight flush and royal flush are not supported.


## Facts

- Hands of cards represented by predicates m1 to m12, each containing five cards.
- Cards rank represented by the `rank/1` predicate, which defines the ranks of cards in poker (e.g., seven, eight, nine, ...).
- Cards suit represented by the `suit/1` predicate, which defines the suits of cards in poker (e.g., club, diamond, heart, spade).

## Predicates

- `is_card(card(Rank, Suit))`: Checks if a card is valid by ensuring its rank and suit are defined.
- `is_hand(hand(C1, C2, C3, C4, C5))`: Checks if a hand is valid by ensuring all cards in the hand are valid and distinct.
- `is_lower(card(R1, S1), card(R2, S2))`: Checks if a card is lower than another card based on rank and suit.
- `is_sorted_hand(hand(C1, C2, C3, C4, C5))`: Checks if a hand is sorted in ascending order.
- Comparison predicates (`same_rank/2`, `one_pair/1`, `two_pairs/1`, `three_of_a_kind/1`, `straight/1`, `full_house/1`, `four_of_a_kind/1`, `higher_hand/2`): Determine the rank and comparison of hands based on their combinations.<br>
A hand is higher than another one **ONLY IF** it has a higher ranking combination according to the standard poker rules. For example, a full house cannot be higher than another full house, and a double pair is higher than a pair.

## Usage

To use this file, consult it in Prolog and query the provided predicates to test the ranking of different poker hands. For example:

```prolog
consult(poker).
m7(M), one_pair(M). % display all combinations of m7 that contains only a pair.
m8(M), two_pairs(M). % display all combinations of m8 that contains two pairs.
m9(M), three_of_a_kind(M).  % display all combinations of m9 that contains a three of a kind.
m10(M), straight(M).  % display all combinations of m10 that contains a straight.
m11(M), full_house(M). %  display all combinations of m11 that contains a full_house.
m12(M), four_of_a_kind(M). % display all combinations of m12 that contains a four of a kind.
m12(M1), m11(M2), higher_hand(M1, M2). % display all the combination of m12 that are higher than m11.
```

