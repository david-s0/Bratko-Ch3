%3.1
delL3(L, L1) :-
	append(L1, [_,_,_], L).

delF3(L, L1) :-
	append([_,_,_], L1, L).

%3.2
%without append
last(Item, [Item|[]]).
last(Item, [H|List]) :-
	last(Item, List).
%with append
lastA(Item, List) :-
	append(L2, [Item|[]], List).

%3.3
%looks a bit too procedural, I accept suggestions for improvements!
evenlength(L) :-
	length(L, X),
	N is (X mod 2),
	N == 0.

oddlength(L) :-
	length(L, X),
	N is (X mod 2),
	N == 1.

%3.4
reverse([], []).
reverse([H|L], R) :-
	reverse(L, R2),
	append(R2, [H], R).

%3.5
palindrome(L) :-
	reverse(L, R),
	L == R.

%3.6
shift([H|L1], L2) :-
	append(L1, [H], L2).

%3.7
means(0, zero).
means(1, one).
means(2, two).
means(3, three).
means(4, four).
means(5, five).
means(6, six).
means(7, seven).
means(8, eight).
means(9, nine).

translate([], []).
translate([H1|L1], [H2|L2]) :-
	means(H1, H2),
	translate(L1, L2).

%3.8
subset(Set, []).
subset([HSet|Set], [HSet|Sub]):-
  subset(Set, Sub).
subset([_|Set], Sub):-
  subset(Set, Sub).

%3.9
dividelist(L, L1, L2) :-
	append(L1, L2, L),
	length(L1, N),
	length(L2, N).
dividelist(L, L1, L2) :-
	append(L1, L2, L),
	length(L1, N),
	length(L2, M),
	K is (M + 1),
	K == N.

%3.11
flatten([], []).
flatten([H|L], FL) :-
	flatten(L, FL2),
	append(H, FL2, FL).

%3.16
max(X, Y, Max) :-
	X >= Y,
	Max is X.
max(X, Y, Max) :-
	Y >= X,
	Max is Y.

%3.17
maxList([Max], Max).
maxList([Max|L], Max):-
	max(L, NMax),
	Max >= NMax.
maxList([H|L], Max):-
	max(L, Max),
	Max >= H.

%3.18
sumList([], 0).
sumList([H|T], N) :-
	sumList(T, M),
	N is (M + H).

%3.19
ordered([T]).
ordered([H1, H2|L]) :-
	H1 =< H2,
	ordered([H2|L]).

%3.20
subsum(Set, Sum, Subset) :-
	subset(Set, Subset),
	sumList(Subset, Sum).

%3.21
%needs improvemet!
between(N1, N2, X) :-
	X is (N1 + 1),
	X < N2.