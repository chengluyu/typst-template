#let kw = (
  "let": $bold(sans("let"))$,
  "in": $bold(sans("in"))$,
  "if": $bold(sans("if"))$,
  "then": $bold(sans("then"))$,
  "and": $bold(sans("and"))$,
  "is": $bold(sans("is"))$,
  "else": $bold(sans("else"))$,
  "fun": $bold(sans("fun"))$,
  "data": $bold(sans("data"))$,
  "case": $bold(sans("case"))$,
  "of": $bold(sans("of"))$,
  "match": $bold(sans("match"))$,
  "or": $bold(sans("or"))$
)
#let what = $class("normal", ?)$
#let neg = $class("unary", -)$
#let def = $class("relation", ::=)$
#let rule(name) = text(font: "Linux Libertine")[#smallcaps(name)]
#let subst(term, from, to) = $[from |-> to] space.thin term$
#let concat = $class("binary", +#h(-0.25em)+)$
#let hole = math.square.tiny
#let typed = math.op(":")
#let turn = move(dx: -0.25em, dy: -0.2em, rotate(-55deg, scale(80%)[⤾]))
