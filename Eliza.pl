eliza:-	writeln('Hola, mi nombre es Eliza tu chatbot de confianza,
por favor ingresa tu consulta sin usar mayusculas, punto final 
ni acentos, gracias.
Comencemos a chatear! :'),
	readln(Input),
	eliza(Input),!.
eliza(Input):- Input == ['chao'],
	writeln('Adios. espero poder verte ayudado.'), !.
eliza(Input):- Input == ['nos', 'vemos'],
	writeln('Adios. espero poder verte ayudado.'), !.
eliza(Input):- Input == ['hasta', 'luego'],
	writeln('Adios. espero poder verte ayudado.'), !.
eliza(Input):- Input == ['bye', '.'],
	writeln('Adios. espero poder verte ayudado.'), !.
eliza(Input):- Input == ['bye'],
	writeln('Adios. espero poder verte ayudado.'), !.
eliza(Input):- Input == ['bye Eliza'],
	writeln('Adios. espero poder verte ayudado.'), !.
eliza(Input):- Input == ['adios'],
	writeln('Adios. espero poder verte ayudado.'), !.
eliza(Input):- Input == ['adios', '.'],
	writeln('Adios. espero poder verte ayudado.'), !.
eliza(Input) :-
	template(Stim, Resp, IndStim),
	match(Stim, Input),
	% si he llegado aquí es que he
	% hallado el template correcto:
	replace0(IndStim, Input, 0, Resp, R),
	writeln(R),
	readln(Input1),
	eliza(Input1), !.

% SALUDOS ------------------------------------------------------------------------------------------------

template([hola, mi, nombre, es, s(_)], ['Hola', 0, 'como', estas, tu, '?'], [4]).
template([buendia, mi, nombre, es, s(_)], ['buen dia', 0, 'como', estas, el, dia, de, hoy, '?'], [4]).
template([hola, ',', mi, nombre, es, s(_)], ['Hola', 0, 'como', estas, '?'], [5]).
template([buendia, ',', mi, nombre, es, s(_)], ['Buendia', 0,'como', estas, '?'], [5]).
template([hola, _], ['Hola', 'como', estas, '?'], []).
template([buendia, _], ['Buendia', 'Como', estas, '?'], []).
template([hola, soy, s(_)], ['Hola', 0, '¿cómo', 'te', 'encuentras', 'hoy', '?'], [2]).
template([hola, me, llamo, s(_)], ['Hola', 0, 'gusto', 'en', 'conocerte', '?'], [3]).
template([buenos, dias, me, llamo, s(_)], ['Buenos', 'días', 0, '¿cómo', 'estás', '?'], [4]).
template([hey, me, llamo, s(_)], ['¡Hey!', 0, '¿todo', 'bien', '?'], [3]).
template([holi, soy, s(_)], ['Holi', 0, '¿cómo', 'andas', '?'], [2]).
template([que, tal , ',' , me, llamo, s(_)], ['¡Qué', 'tal!', 0, '¿cómo', 'estás', '?'], [5]).
template([hola], ['Hola', '¿cómo', 'estás', '?'], []).
template([buenos, dias], ['Buenos', 'días', '¿cómo', 'te', 'va', '?'], []).
template([buenas, tardes], ['Buenas', 'tardes', '¿qué', 'tal', '?'], []).
template([buenas, noches], ['Buenas', 'noches', '¿cómo', 'fue', 'tu', 'día', '?'], []).
template([hola, s(_), ',', mucho, gusto], ['Hola', 0, '¡el', 'gusto', 'es', 'mío!', '¿cómo', 'estás', '?'], [1]).
template([buenas, s(_), ',', soy, s(_)], ['Buenas', 0, 1, '¿en', 'qué', 'puedo', 'ayudarte', '?'], [1,4]).

% PREGUNTAS -----------------------------------------------------------------------------------------------

template([como, te, llamas], ['Me', 'llamo', 'Eliza', '¿en', 'que', 'puedo', 'ayudarte', '?'], []).
template([quien, eres], ['Soy', 'Eliza', 'tu', 'chatbot', 'de', 'confianza', '?'], []).
template([cual, es, tu, nombre], ['Mi', 'nombre', 'es', 'Eliza', '?'], []).
template([cuantos, anos, tienes], ['No', 'tengo', 'edad', 'como', 'un', 'humano', 'pero', 'soy', 'muy', 'sabia', '?'], []).
template([donde, vives], ['Vivo', 'en', 'el', 'mundo', 'digital', '?'], []).
template([como, estas], ['Estoy', 'bien', 'gracias', 'por', 'preguntar', '?'], []).
template([como, te, sientes], ['Me', 'siento', 'feliz', 'de', 'hablar', 'contigo', '?'], []).
template([estas, bien], ['Estoy', 'muy', 'bien', 'gracias', '¿y', 'tu', '?'], []).
template([puedes, ayudarme], ['Por', 'supuesto', '¿en', 'qué', 'necesitas', 'ayuda', '?'], []).
template([que, piensas, de, s(_)], ['Interesante', 'tema', ',', 0, '¿quieres', 'hablar', 'más', 'de', 'eso', '?'], [3]).

template([yo, soy, s(_)], [seguro, que , eres, 0, '?'], [2]).

template([que, piensas, de, s(_)], ['Interesante', 'tema', ',', 0, '¿quieres', 'hablar', 'más', 'de', 'eso', '?'], [3]).

% pregunta algo que le gusta a eliza
template([te, gustan, las, s(_), _], [flagLike], [3]).
template([te, gustan, los, s(_), _], [flagLike], [3]).


% pregunta algo que hace eliza
template([tu, eres, s(_), _], [flagDo], [2]).

% pregunta algo que es eliza
template([que, eres, tu, s(_)], [flagIs], [2]).
template([eres, s(_), '?'], [flagIs], [2]).


template([como, estas, tu, '?'], [yo, estoy, bien, ',', gracias, por, preguntar, '.'], []).


template([yo, pienso, que, _], [bueno, esa, es, tu, opinion], []).
template([porque, _], [esa, no, es, una, buena, razon, '.'], []).
template([i, have, s(_), with, s(_), '.'], ['You', have, to, deal, with, your, 0, and, your, 1, in, a, mature, way, '.'], [2, 4]).
template([i, s(_),  _], [i, can, recommend, you, a, book, about, that, issue], []).
template([please, s(_), _], ['No', i, can, not, help, ',', i, am, just, a, machine], []). 
		 template([tell, me, a, s(_), _], ['No', i, can, not, ',', i, am, bad, at, that], []).


				  
template(_, ['Please', explain, a, little, more, '.'], []). 
% Lo que le gusta a eliza : flagLike

elizaLikes(X, R):- likes(X), R = ['Yeah', i, like, X].
elizaLikes(X, R):- \+likes(X), R = ['Nope', i, do, not, like, X].
likes(apples).
likes(ponies).
likes(zombies).
likes(manzanas).
likes(computadoras).
like(carros).






% lo que hace eliza: flagDo
elizaDoes(X, R):- does(X), R = ['Yes', i, X, and, i, love, it].
elizaDoes(X, R):- \+does(X), R = ['No', i, do, not, X ,'.', it, is, too, hard, for, me].
does(study).
does(cook).
does(work).


% lo que es eliza: flagIs
elizaIs(X, R):- is0(X), R = ['Yes', yo, soy, X].
elizaIs(X, R):- \+is0(X), R = ['No', i, am, not, X].
is0(dumb).
is0(weird).
is0(nice).
is0(fine).
is0(happy).
is0(redundant).


match([],[]).
match([], _):- true.


match([S|Stim],[I|Input]) :-
	atom(S), % si I es un s(X) devuelve falso
	S == I,
	match(Stim, Input),!.


match([S|Stim],[_|Input]) :-
% I es un s(X), lo ignoro y continúo con el resto de la lista
	\+atom(S),
	match(Stim, Input),!.


replace0([], _, _, Resp, R):- append(Resp, [], R),!.


% Eliza likes:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagLike,
	elizaLikes(Atom, R).


% Eliza does:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagDo,
	elizaDoes(Atom, R).


% Eliza is:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagIs,
	elizaIs(Atom, R).


replace0([I|Index], Input, N, Resp, R):-
	length(Index, M), M =:= 0,
	nth0(I, Input, Atom),
	select(N, Resp, Atom, R1), append(R1, [], R),!.


replace0([I|Index], Input, N, Resp, R):-
	nth0(I, Input, Atom),
	length(Index, M), M > 0,
	select(N, Resp, Atom, R1),
	N1 is N + 1,
	replace0(Index, Input, N1, R1, R),!.
