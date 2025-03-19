padre(vic).
padre(gera).
padre(isa).
padre(francisco).
padre(daniel).
padre(isaias).
madre(laura).
madre(yesi).
madre(ana).
madre(noemi).
madre(juanita).
sobrino(leonardo).
sobrino(omar).
sobrino(paulina).
sobrino(fabio).
sobrino(ivan).
sobrino(karen).
sobrino(emilio).
hijo(leonardo).
hijo(omar).
hijo(paulina).
hijo(fabio).
hijo(ivan).
hijo(karen).
hijo(emilio).
tio(vic).
tio(gera).
tio(isa).
tio(francisco).
tio(daniel).
tia(lau).
tia(yesi).
tia(ana).
tia(noemi).
padrede(vic, paulina).
padrede(daniel, leonardo).
padrede(gera, omar).
padrede(gera, karen).
padrede(francisco, fabio).
padrede(francisco, ivan).
padrede(isa, emilio).
padrede(isaias, vic).
padrede(isaias, lau).
padrede(isaias, gera).
padrede(isaias, yesi).
padrede(isaias, isa).
madrede(lau, leonardo).
madrede(ana, omar).
madrede(ana, karen).
madrede(yesi, fabio).
madrede(yesi, ivan).
madrede(noemi, emilio).
madrede(juanita, vic).
madrede(juanita, lau).
madrede(juanita, gera).
madrede(juanita, yesi).
madrede(juanita, isa).
abuelode(isaias, paulina).
abuelode(isaias, leonardo).
abuelode(isaias, omar).
abuelode(isaias, karen).
abuelode(isaias, fabio).
abuelode(isaias, ivan).
abuelode(isaias, emilio).
abuelade(juanita, paulina).
abuelade(juanita, leonardo).
abuelade(juanita, omar).
abuelade(juanita, karen).
abuelade(juanita, fabio).
abuelade(juanita, ivan).
abuelade(juanita, emilio).

abuelo(X, Y):-padrede(X, W), padrede(W, Y).
prov():-madre(X), mujer(X).