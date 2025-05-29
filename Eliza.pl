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
template([hola, soy, s(_)], ['Hola', 0, '¿como', 'te', 'encuentras', 'hoy', '?'], [2]).
template([hola, me, llamo, s(_)], ['Hola', 0, 'gusto', 'en', 'conocerte', '?'], [3]).
template([buenos, dias, me, llamo, s(_)], ['Buenos', 'días', 0, '¿como', 'estas', '?'], [4]).
template([hey, me, llamo, s(_)], ['¡Hey!', 0, '¿todo', 'bien', '?'], [3]).
template([holi, soy, s(_)], ['Holi', 0, '¿como', 'andas', '?'], [2]).
template([que, tal , ',' , me, llamo, s(_)], ['¡Que', 'tal!', 0, '¿como', 'estas', '?'], [5]).
template([hola], ['Hola', '¿como', 'estas', '?'], []).
template([buenos, dias], ['Buenos', 'dias', '¿como', 'te', 'va', '?'], []).
template([buenas, tardes], ['Buenas', 'tardes', '¿que', 'tal', '?'], []).
template([buenas, noches], ['Buenas', 'noches', '¿como', 'fue', 'tu', 'dia', '?'], []).
template([hola, s(_), ',', mucho, gusto], ['Hola', 0, '¡el', 'gusto', 'es', 'mio!', '¿como', 'estas', '?'], [1]).
template([buenas, s(_), ',', soy, s(_)], ['Buenas', 0, 1, '¿en', 'que', 'puedo', 'ayudarte', '?'], [1,4]).

% PREGUNTAS SIMPLES-----------------------------------------------------------------------------------------------

template([como, te, llamas, '?'], ['Me', 'llamo', 'Eliza', '¿', 'en', 'que', 'puedo', 'ayudarte', '?'], []).
template([quien, eres, '?'], ['Soy', 'Eliza', 'tu', 'chatbot', 'de', 'confianza', '?'], []).
template([cual, es, tu, nombre, '?'], ['Mi', 'nombre', 'es', 'Eliza'], []).
template([cuantos, anios, tienes, '?'], ['No', 'tengo', 'edad', 'como', 'un', 'humano', 'pero', 'soy', 'muy', 'sabia'], []).
template([donde, vives, '?'], ['Vivo', 'en', 'el', 'mundo', 'digital'], []).
template([como, estas, '?'], ['Estoy', 'bien', 'gracias', 'por', 'preguntar'], []).
template([como, te, sientes, '?'], ['Me', 'siento', 'feliz', 'de', 'hablar', 'contigo'], []).
template([estas, bien, '?'], ['Estoy', 'muy', 'bien', 'gracias', '¿', 'y', 'tu', '?'], []).
template([puedes, ayudarme, '?'], ['Por', 'supuesto', '¿', 'en', 'que', 'necesitas', 'ayuda', '?'], []).
template([que, piensas, de, s(_), '?'], ['Interesante', 'tema', 0, '¿quieres', 'platicarme', 'mas', 'de', 'ese','tema', '?'], [3]).

% PREGUNTAS TECNICAS DE GOTA-----------------------------------------------------------------------------------------------

template([hablame, acerca, de, la, s(_), gota], 
    ['Claro,', 'la', 'gota', 'es', 'una', 'enfermedad', 'que', 'provoca', 'dolor', 'intenso', 'en', 'las', 'articulaciones', 'por', 'acumulacion', 'de', 'acido', 'urico'], 
    []).
template([que, es, la, enfermedad, gota, '?'], ['La', 'gota', 'es', 'una', 'forma', 'de', 'artritis', 'que', 'causa', 'dolor', 'e', 'inflamacion', 'en', 'las', 'articulaciones'], []).
template([cuales, son, los, sintomas, de, la, gota, '?'], ['Los', 'sintomas', 'incluyen', 'dolor', 'intenso', 'en', 'las', 'articulaciones', 'hinchazon', 'y', 'enrojecimiento'], []).
template([que, causa, la, gota, '?'], ['La', 'gota', 'es', 'causada', 'por', 'una', 'acumulacion', 'de', 'acido', 'urico', 'en', 'la', 'sangre'], []).
template([como, se, trata, la, gota, '?'], ['El', 'tratamiento', 'incluye', 'medicamentos', 'antiinflamatorios', 'y', 'una', 'dieta', 'adecuada'], []).
template([tengo, gota], ['Lamento', 'escuchar', 'eso', '.', '¿Te', 'han', 'dado', 'alguna', 'medicacion', '?'], []).
template([que, alimentos, debo, evitar, con, gota, '?'], ['Debes', 'evitar', 'carnes', 'rojas', 'mariscos', 'y', 'bebidas', 'alcoholicas'], []).
template([la, gota, es, hereditaria, '?'], ['Si', ',', 'puede', 'haber', 'una', 'predisposicion', 'genetica', 'a', 'la', 'gota'], []).
template([se, puede, curar, la, gota, '?'], ['La', 'gota', 'no', 'tiene', 'cura', 'definitiva', ',', 'pero', 'se', 'puede', 'controlar', 'efectivamente'], []).
template([que, hacer, durante, un, ataque, de, gota, '?'], ['Durante', 'un', 'ataque', 'es', 'importante', 'descansar', 'la', 'articulacion', 'y', 'tomar', 'medicacion', 'prescrita'], []).
template([que, especialista, trata, la, gota, '?'], ['Un', 'reumatologo', 'es', 'el', 'especialista', 'adecuado', 'para', 'tratar', 'la', 'gota'], []).
template([me, puedo, morir, de, gota, '?'], 
    ['La', 'gota', 'no', 'suele', 'ser', 'mortal', 'si', 'se', 'trata', 'adecuadamente,', 'pero', 'puede', 'provocar', 'complicaciones', 'graves', 'si', 'no', 'se', 'atiende'], 
    []).

% PREGUNTAS TECNICAS DE ESCOLIOSIS GENERAL-----------------------------------------------------------------------------------------------

template([hablame, de, la, escoliosis], 
    ['La', 'escoliosis', 'es', 'una', 'condicion', 'en', 'la', 'que', 'la', 'columna', 'vertebral', 'se', 'curva', 'de', 'forma', 'anormal;', 'puede', 'ser', 'leve', 'o', 'grave', 'y', 'requiere', 'atencion', 'medica'], []).
template([que, es, la, escoliosis, '?'],['La', 'escoliosis', 'es', 'una', 'curvatura', 'anormal', 'de', 'la', 'columna', 'vertebral'], []).
template([como, se, si, tengo, escoliosis, '?'], ['Algunos', 'sintomas', 'pueden', 'ser', 'dolor', 'de', 'espalda', 'o', 'desviacion', 'visible', 'de', 'la', 'columna,', 'pero', 'solo', 'un', 'medico', 'puede', 'diagnosticarla'], []).
template([la, escoliosis, duele, '?'],['En', 'algunos', 'casos', 'puede', 'provocar', 'dolor', 'de', 'espalda,', 'pero', 'no', 'siempre', 'ocurre'], []).
template([la, escoliosis, es, grave, '?'], ['Depende', 'del', 'grado', 'de', 'curvatura;', 'en', 'casos', 'graves', 'puede', 'afectar', 'la', 'respiracion', 'y', 'la', 'movilidad'], []).
template([cual, es, la, causa, de, la, escoliosis, '?'], ['En', 'muchos', 'casos', 'la', 'causa', 'es', 'desconocida,', 'aunque', 'tambien', 'puede', 'ser', 'congenita', 'o', 'neuromuscular'], []).
template([la, escoliosis, tiene, cura, '?'], ['No', 'siempre', 'se', 'cura', 'por', 'completo,', 'pero', 'puede', 'tratarse', 'con', 'fisioterapia,', 'corset', 'o', 'cirugia'], []).
template([puedo, hacer, ejercicio, con, escoliosis, '?'], ['En', 'la', 'mayoria', 'de', 'los', 'casos', 'se', 'recomienda', 'el', 'ejercicio', 'suave,', 'pero', 'debe', 'ser', 'indicado', 'por', 'un', 'especialista'], []).
template([la, escoliosis, puede, empeorar, '?'], ['Si', 'no', 'se', 'trata', 'puede', 'empeorar', 'con', 'el', 'tiempo,', 'especialmente', 'en', 'adolescentes'], []).
template([la, escoliosis, afecta, a, adultos, '?'], ['Si,', 'aunque', 'es', 'mas', 'comun', 'en', 'adolescentes,', 'tambien', 'puede', 'aparecer', 'o', 'agravarse', 'en', 'adultos'], []).
template([la, escoliosis, es, peligrosa, '?'], ['Puede', 'serlo', 'en', 'casos', 'graves,', 'si', 'afecta', 'organos', 'como', 'los', 'pulmones', 'o', 'el', 'corazon'], []).




template([que, piensas, de, s(_)], ['Interesante', 'tema', ',', 0, '¿quieres', 'hablar', 'más', 'de', 'eso', '?'], [3]).
template([yo, soy, s(_)], [seguro, que , eres, 0, '?'], [2]).

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
