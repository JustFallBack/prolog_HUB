/* hands to test */
m1(hand(card(seven,club), card(jack,heart), card(queen,_), card(_,spade), card(king,spade))).
m2(hand(card(seven,club), card(jack,heart), card(queen,diamond), card(_,heart), card(king,spade))).
m3(hand(card(seven,club), card(seven,heart), card(queen,_), card(_,club), card(_,spade))).
m4(hand(card(seven,club), card(jack,heart), card(queen,_), card(_,spade), card(_,spade))).
m5(hand(card(seven,club), card(jack,heart), card(queen,_), card(_,diamond), card(queen,spade))).
m6(hand(card(seven,diamond), _, card(jack,_), _, _)).
m7(hand(card(seven,club), card(eight,spade), card(nine,club), card(ten,club), card(ten,_))). % pair
m8(hand(card(seven,club), card(eight,heart), card(eight,spade), card(ace,club), card(ace,spade))). % two pairs
m9(hand(card(seven,club), card(eight,diamond), card(eight,heart), card(eight,spade), card(queen,heart))). % three of a kind
m10(hand(card(seven,club), card(eight,diamond), card(nine,heart), card(ten,spade), card(jack,heart))). % straight
m11(hand(card(seven,club), card(seven,diamond), card(seven,spade), card(eight,club), card(eight,spade))). % full house
m12(hand(card(seven,club), card(seven,diamond), card(seven,heart), card(seven,spade), card(nine,_))). % four of a kind

% Cards rank
rank(seven).
rank(eight).
rank(nine).
rank(ten).
rank(jack).
rank(queen).
rank(king).
rank(ace).

% Cards suit
suit(club).
suit(diamond).
suit(heart).
suit(spade).


% Predicate to check if a card is valid
is_card(card(Rank,Suit)) :- rank(Rank), suit(Suit).


% Predicate to check if a hand is valid
is_hand(hand(C1,C2,C3,C4,C5)) :- is_card(C1), is_card(C2), is_card(C3), is_card(C4), is_card(C5), 
                                C1 \= C2, C1 \= C3, C1 \= C4, C1 \= C5,
                                C2 \= C3, C2 \= C4, C2 \= C5,
                                C3 \= C4, C3 \= C5,
                                C4 \= C5.


% Predicates to check if a card is directly lower than another card
rank_lower(seven, eight).
rank_lower(eight, nine).
rank_lower(nine, ten).
rank_lower(ten, jack).
rank_lower(jack, queen).
rank_lower(queen, king).
rank_lower(king, ace).

suit_lower(club, diamond).
suit_lower(diamond, heart).
suit_lower(heart, spade).

% Predicate verifying the transitivity of a two-argument predicate R
ft(R,X,Y) :- =..(P,[R,X,Y]), P.
ft(R,X,Y) :- =..(P,[R,X,Z]), P, ft(R,Z,Y).

% Predicate to check if a card is lower than another card
is_lower(card(R1, S1), card(R2, S2)) :- R1 \= R2, ft(rank_lower, R1, R2) ; R1 == R2, ft(suit_lower, S1, S2).


% Predicate to check if a hand is sorted
is_sorted_hand(hand(C1,C2,C3,C4,C5)) :- is_hand(hand(C1,C2,C3,C4,C5)), is_lower(C1,C2), is_lower(C2,C3), is_lower(C3,C4), is_lower(C4,C5).


% Predicate for comparing hands

% Equality
same_rank(card(R1, _), card(R2, _)) :- R1 == R2.
same_rank(card(R1, _), card(R2, _), card(R3, _)) :- R1 == R2, R2 == R3.
same_rank(card(R1, _), card(R2, _), card(R3, _), card(R4, _)) :- R1 == R2, R2 == R3, R3 == R4.

% One pair
one_pair(hand(C1,C2,C3,C4,C5)) :- is_sorted_hand(hand(C1,C2,C3,C4,C5)), same_rank(C1,C2), \+(same_rank(C2,C3)), \+(same_rank(C3,C4)), \+(same_rank(C4,C5))
                               ; is_sorted_hand(hand(C1,C2,C3,C4,C5)), \+(same_rank(C1,C2)), same_rank(C2,C3), \+(same_rank(C3,C4)), \+(same_rank(C4,C5))
                               ; is_sorted_hand(hand(C1,C2,C3,C4,C5)), \+(same_rank(C1,C2)), \+(same_rank(C2,C3)), same_rank(C3,C4), \+(same_rank(C4,C5))
                               ; is_sorted_hand(hand(C1,C2,C3,C4,C5)), \+(same_rank(C1,C2)), \+(same_rank(C2,C3)), \+(same_rank(C3,C4)), same_rank(C4,C5).

% m7(M), one_pair(M).

% Two pairs
two_pairs(hand(C1,C2,C3,C4,C5)) :- is_sorted_hand(hand(C1,C2,C3,C4,C5)), same_rank(C1,C2), \+(same_rank(C2,C3)), same_rank(C3,C4), \+(same_rank(C4,C5))
                                ; is_sorted_hand(hand(C1,C2,C3,C4,C5)), same_rank(C1,C2), \+(same_rank(C2,C3)), \+(same_rank(C3,C4)), same_rank(C4,C5)
                                ; is_sorted_hand(hand(C1,C2,C3,C4,C5)), \+(same_rank(C1,C2)), same_rank(C2,C3), \+(same_rank(C3,C4)), same_rank(C4,C5).

% m8(M), two_pairs(M).

% Three of a kind
three_of_a_kind(hand(C1,C2,C3,C4,C5)) :- is_sorted_hand(hand(C1,C2,C3,C4,C5)), same_rank(C1,C2,C3), \+(same_rank(C3,C4)), \+(same_rank(C4,C5))
                                      ; is_sorted_hand(hand(C1,C2,C3,C4,C5)), same_rank(C2,C3,C4), \+(same_rank(C1,C2)), \+(same_rank(C4,C5))
                                      ; is_sorted_hand(hand(C1,C2,C3,C4,C5)), same_rank(C3,C4,C5), \+(same_rank(C1,C2)), \+(same_rank(C2,C3)).

% m9(M), three_of_a_kind(M).

% Straight
direct_rank_lower(card(H1,_),card(H2,_),card(H3,_),card(H4,_),card(H5,_)) :- rank_lower(H1,H2), rank_lower(H2,H3), rank_lower(H3,H4), rank_lower(H4,H5).
straight(hand(C1,C2,C3,C4,C5)) :- is_sorted_hand(hand(C1,C2,C3,C4,C5)), direct_rank_lower(C1,C2,C3,C4,C5).

% m10(M), straight(M).

% Full house
full_house(hand(C1,C2,C3,C4,C5)) :- is_sorted_hand(hand(C1,C2,C3,C4,C5)), same_rank(C1,C2,C3), same_rank(C4,C5)
                                 ; is_sorted_hand(hand(C1,C2,C3,C4,C5)), same_rank(C1,C2), same_rank(C3,C4,C5).

% m11(M), full_house(M).

% Four of a kind
four_of_a_kind(hand(C1,C2,C3,C4,C5)) :- is_sorted_hand(hand(C1,C2,C3,C4,C5)), same_rank(C1,C2,C3,C4)
                                     ; is_sorted_hand(hand(C1,C2,C3,C4,C5)), same_rank(C2,C3,C4,C5).

% m12(M), four_of_a_kind(M).

% Predicate to compare two hands
higher_hand(M1, M2) :- is_sorted_hand(M1), is_sorted_hand(M2), (
                        four_of_a_kind(M1), \+(four_of_a_kind(M2))
                    ;   full_house(M1), \+(four_of_a_kind(M2)), \+(full_house(M2))
                    ;   straight(M1), \+(four_of_a_kind(M2)), \+(full_house(M2)), \+(straight(M2))
                    ;   three_of_a_kind(M1), \+(four_of_a_kind(M2)), \+(full_house(M2)), \+(straight(M2)), \+(three_of_a_kind(M2))
                    ;   two_pairs(M1), \+(four_of_a_kind(M2)), \+(full_house(M2)), \+(straight(M2)), \+(three_of_a_kind(M2)), \+(two_pairs(M2))
                    ;   one_pair(M1), \+(four_of_a_kind(M2)), \+(full_house(M2)), \+(straight(M2)), \+(three_of_a_kind(M2)), \+(two_pairs(M2)), \+(one_pair(M2))
                    ).

% m12(M1), higher_hand(M1, M).
% Will return all the combinations of hands that are lower than M1.