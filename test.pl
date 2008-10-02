% A small Prolog file to test prolog.vim

:- statement.
:- statement(x,y,X,Y,foo(x,Y)).
?- query.
?- query(x,y,X,Y,foo(x,Y)).

head :- body.
head :- body(foo,Foo,foo(foo)).

head(booh,X,foo(booh,X)) :- body.
head(booh,X,foo(booh,X)) :- body(foo,Foo,foo(foo)).

head --> body.
head --> body(foo,Foo,foo(foo)).

head(booh,X,foo(booh,X)) --> body.
head(booh,X,foo(booh,X)) --> body(foo,Foo,foo(foo)).

dynamic(foo/2).

foobar.
foobar .
foobar :- !.

head :- foo(C), foo(B),
	/* something commentary */
	% more comments
	\+ foo(G).

/* a multiline
* comment
*/

head :- Error(foo). /*predicates must start lower-case*/

head :- error(1) error(2). /*no comma and a TODO*/

head :- body.

head :- list([a,b,C,foo:Bar|Tail],Foo).
head :- dlist(H-Ts).

head :- foobar('string').
head :- format('fooo ~n bar').
