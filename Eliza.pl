:- discontiguous template/3.
:- discontiguous replace0/5.

eliza:-	writeln('Hola, mi nombre es Eliza tu chatbot de confianza,
por favor ingresa tu consulta sin usar mayusculas, punto final 
ni acentos, gracias.
Comencemos a chatear! :'),
	readln(Input),
	eliza(Input),!.
eliza(Input):- Input == ['chao'],
	writeln('Chao hermano. espero poder verte ayudado.'), !.
eliza(Input):- Input == ['nos', 'vemos'],
	writeln('Nos vemos pronto. espero poder verte ayudado.'), !.
eliza(Input):- Input == ['hasta', 'luego'],
	writeln('Hasta luego camarada. espero poder verte ayudado.'), !.
eliza(Input):- Input == ['bye', '.'],
	writeln('Bye bro. espero poder verte ayudado.'), !.
eliza(Input):- Input == ['bye'],
	writeln('Bye bro. espero poder verte ayudado.'), !.
eliza(Input):- Input == ['bye Eliza'],
	writeln('Bye Amigo. espero poder verte ayudado.'), !.
eliza(Input):- Input == ['adios'],
	writeln('Adios hommie. espero poder verte ayudado.'), !.
eliza(Input):- Input == ['adios', '.'],
	writeln('Adios hommie. espero poder verte ayudado.'), !.
eliza(Input) :-
	template(Stim, Resp, IndStim),
	match(Stim, Input),
	% si he llegado aquí es que he
	% hallado el template correcto:
	replace0(IndStim, Input, 0, Resp, R),
	clean_commas(R, RClean),
atomic_list_concat(RClean, ' ', Str),
writeln(Str),

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

%respuestas breves
template(['bien', 'gracias'], ['me', 'alegra', 'escuchar', 'eso,', '¿en', 'que', 'puedo', 'ayudarte', 'hoy', '?'], []).
template(['me', 'siento', 'mal'], ['siento', 'que', 'te', 'sientas', 'asi,', '¿quieres', 'hablar', 'un', 'poco', 'mas', 'de', 'eso', '?'], []).
template(['tengo', 'ganas', 'de', 'llorar'], ['llorar', 'a', 'veces', 'puede', 'ayudar,', '¿quieres', 'contarme', 'que', 'te', 'hace', 'sentir', 'asi', '?'], []).
template([excelente], ['¡que', 'bueno', 'escuchar', 'eso!', '¿en', 'que', 'puedo', 'ayudarte', '?'], []).
template([excelente, y, tu], ['¡estupendo!', 'gracias', 'por', 'preguntar,', '¿en', 'que', 'puedo', 'ayudarte', '?'], []).
template([excelente, y, tu, '?'], ['¡estupendo!', 'gracias', 'por', 'preguntar,', '¿en', 'que', 'puedo', 'ayudarte', '?'], []).
template([muy, bien, gracias, y, tu], ['¡me', 'alegro!', 'yo', 'también', 'estoy', 'muy', 'bien,', '¿en', 'que', 'puedo', 'ayudarte', '?'], []).
template([bien, y, tu], ['super', 'bien,', 'gracias', 'por', 'preguntar,', '¿en', 'que', 'te', 'puedo', 'ayudar', '?'], []).
template([bien, y, tu, '?'], ['super', 'bien,', 'gracias', 'por', 'preguntar,', '¿en', 'que', 'te', 'puedo', 'ayudar', '?'], []).
template([muy, bien, y, tu], ['me', 'da', 'gusto,', 'yo', 'también', 'estoy', 'bien,', '¿en', 'que', 'puedo', 'ayudarte', '?'], []).
template([muy, bien, y, tu, '?'], ['me', 'da', 'gusto,', 'yo', 'también', 'estoy', 'bien,', '¿en', 'que', 'puedo', 'ayudarte', '?'], []).
template([bien, gracias, y, tu], ['super', 'bien,', 'gracias', 'por', 'preguntar,', '¿en', 'que', 'te', 'puedo', 'ayudar', '?'], []).
template([bien, gracias, y, tu, '?'], ['super', 'bien,', 'gracias', 'por', 'preguntar,', '¿en', 'que', 'te', 'puedo', 'ayudar', '?'], []).
template([no], ['entiendo', 'que', 'no,', '¿quieres', 'decirme', 'más', 'sobre', 'otra','cosa', '?'], []).
template([si], ['¡genial!', '¿en', 'que', 'puedo', 'ayudarte', '?'], []).

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
template([que, piensas, de, s(_)], ['Interesante', 'tema', ',', 0, '¿quieres', 'hablar', 'más', 'de', 'eso', '?'], [3]).

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

% IMPLEMENTOS VARIABLE S(_)-----------------------------------------------------------------------------------------------

template([tengo, sintomas, como, s(_), y, s(_)], 
    ['Podrian', 'ser', sintomas, 'relacionados', 'con', 'gota,', 'pero', 'debes', 'consultar', 'a', 'un', 'medico'], [3, 5]).
template([que, pasa, si, tengo, s(_), por, gota], 
    ['Es', 'importante', 'tratar', 0, 'para', 'evitar', 'complicaciones'], [4]).
template([puedo, tomar, s(_), si, tengo, gota], 
    ['Debes', 'consultar', 'a', 'un', 'medico', 'antes', 'de', 'tomar', 0, 'ya', 'que', 'algunos', 'medicamentos', 'pueden', 'empeorar', 'la', 'gota'], [3]).

template([tengo, dolor, en, s(_), puede, ser, escoliosis], 
    ['Es', 'posible', 'que', 'sea', 'escoliosis', 'si', 'el', 'dolor', 'es', 'persistente', 'en', 0, ',', 'consulta', 'a', 'un', 'especialista'], [3]).
template([que, ejercicios, son, buenos, para, s(_), con, escoliosis], 
    ['Algunos', 'ejercicios', 'pueden', 'ayudar', 'a', 'mejorar', 0, 'pero', 'deben', 'ser', 'indicados', 'por', 'un', 'especialista'], [6]).
template([puedo, tener, escoliosis, si, s(_), esta, s(_)], 
    ['Es', 'posible', ',', 'por', 'ejemplo,', 'si', 0, 'esta', 1, ',', 'debes', 'ir', 'con', 'un', 'medico'], [5, 7]).
template([la, escoliosis, empeora, con, s(_)], 
    ['En', 'algunos', 'casos', ',', 'la', 'escoliosis', 'puede', 'empeorar', 'con', 0, ',', 'evitalo', 'si', 'es', 'posible'], [5]).

% GUSTOS DE ELIZA -----------------------------------------------------------------------------------------------

template([te, gusta, s(_), s(_), _], [flagLike], [2,3]).
template([te, gustan, s(_), s(_), _], [flagLike], [2,3]).

likes(programacion).
likes(tecnologia).
likes(carros).
likes(musica).
likes(cafe).
likes(libros).
likes(animales).
likes(caminatas).
likes(computadoras).
likes(lluvia).

elizaLikes(Articulo-Sustantivo, R) :-
    likes(Sustantivo),
    R = ['Si,', me, gusta, Articulo, Sustantivo].

elizaLikes(Articulo-Sustantivo, R) :-
    \+likes(Sustantivo),
    R = ['No,', no, me, gusta, Articulo, Sustantivo].

% Replace para plantillas flagLike (gustos)
replace0([I1, I2 | _], Input, _, [flagLike], R):-
    nth0(I1, Input, Articulo),
    nth0(I2, Input, Sustantivo),
    elizaLikes(Articulo-Sustantivo, R).

% CODIGO RESTANTE -----------------------------------------------------------------------------------------------

% pregunta algo que hace eliza
template([tu, eres, s(_), _], [flagDo], [2]).

% pregunta algo que es eliza
template([que, eres, tu, s(_)], [flagIs], [2]).
template([eres, s(_), '?'], [flagIs], [2]).

  
template(_, ['Pregunta', de, una, diferente, manera, '.'], []). 

% Lo que le gusta a eliza : flagLike


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

% LIMPIEZA -----------------------------------------------------------------------------------------------------------------------------

% Elimina comas mal ubicadas
clean_commas([], []).
clean_commas([','|['?'|T]], ['?'|CleanT]) :-
    clean_commas(T, CleanT).
clean_commas([','|['.'|T]], ['.'|CleanT]) :-
    clean_commas(T, CleanT).
clean_commas([','|[','|T]], Cleaned) :-
    clean_commas([','|T], Cleaned).
clean_commas([','|[]], []).
clean_commas([','|T], Cleaned) :-
    clean_commas(T, Cleaned).
clean_commas([H|T], [H|CleanT]) :-
    clean_commas(T, CleanT).

% ARBOL GENEALOGICO ----------------------------------------------------------------------------------------------------

% ------------ Hechos base ------------

padre(isaias).
padre(daniel).
padre(gera).
padre(francisco).
padre(isa).
padre(vic).

madre(juanita).
madre(lau).
madre(ana).
madre(yesi).
madre(noemi).

% Relación padre/madre de
padrede(isaias, vic).
padrede(isaias, lau).
padrede(isaias, gera).
padrede(isaias, yesi).
padrede(isaias, isa).
padrede(daniel, leonardo).
padrede(gera, omar).
padrede(gera, karen).
padrede(francisco, fabio).
padrede(francisco, ivan).
padrede(isa, emilio).

madrede(juanita, vic).
madrede(juanita, lau).
madrede(juanita, gera).
madrede(juanita, yesi).
madrede(juanita, isa).
madrede(lau, leonardo).
madrede(ana, omar).
madrede(ana, karen).
madrede(yesi, fabio).
madrede(yesi, ivan).
madrede(noemi, emilio).

% ------------ Reglas útiles ------------

% Definir progenitor
progenitor(X, Y) :- padrede(X, Y).
progenitor(X, Y) :- madrede(X, Y).

% Obtener padre o madre directamente
padre_de(X, Y) :- padrede(X, Y).
madre_de(X, Y) :- madrede(X, Y).

% Hijos: inverso de padre/madre
hijo_de(X, Y) :- progenitor(Y, X).

% Hermanos: comparten al menos un progenitor y no son la misma persona
hermano(X, Y) :-
    progenitor(P, X),
    progenitor(P, Y),
    X \= Y.

% Primos: sus padres son hermanos
primo(X, Y) :-
    progenitor(P1, X),
    progenitor(P2, Y),
    hermano(P1, P2),
    X \= Y.

% Ambos padres
padres_de(Hijo, Padre, Madre) :-
    padrede(Padre, Hijo),
    madrede(Madre, Hijo).

match_template([quien, es, el, papa, de, s(Nombre)], [el, papa, de, Nombre, es, Padre], [5]) :-
    padre_de(Padre, Nombre).

match_template([quien, es, la, mama, de, s(Nombre)], [la, mama, de, Nombre, es, Madre], [5]) :-
    madre_de(Madre, Nombre).

match_template([quien, es, hermano, de, s(Nombre)], [el, hermano, de, Nombre, es, Hermano], [4]) :-
    hermano(Hermano, Nombre).

match_template([quienes, son, los, primos, de, s(Nombre)], [los, primos, de, Nombre, son, Primos], [5]) :-
    findall(P, primo(P, Nombre), Lista),
    atomic_list_concat(Lista, ',', Primos).

match_template([de, quien, es, hijo, s(Nombre)], [Nombre, es, hijo, de, Padre, y, Madre], [4]) :-
    padres_de(Nombre, Padre, Madre).

% Reemplaza variables s(X) con el valor X
resolve_var(s(X), X).
resolve_var(X, X) :- atomic(X).

% Encuentra una coincidencia entre el input del usuario y un patrón
match(Input, Output) :-
    match_template(Input, Response, VarsPos),
    replace(Response, VarsPos, Input, Output).

% Reemplaza las variables en la respuesta con los valores correspondientes
replace([], _, _, []).
replace([s(X)|T], [N|Vars], Input, [R|T2]) :-
    nth0(N, Input, Word),
    resolve_var(Word, R),
    replace(T, Vars, Input, T2).
replace([H|T], VarsPos, Input, [H|T2]) :-
    replace(T, VarsPos, Input, T2).
