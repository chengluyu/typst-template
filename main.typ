#import "@preview/polylux:0.4.0": slide as polylux-slide
#import "@preview/polylux:0.4.0": *
#import "./shorthands.typ": *
#import "./utils.typ": *
#import "./palette.typ": *

// A short hand for making a slide.
#let slide(title: none, title-level: 3, code-block-font-ratio: 1.0, ..args, content) = {
  show raw.where(block: true): set text(size: code-block-font-ratio * 1em)
  if title == none {
    polylux-slide(..args, content)
  } else {
    polylux-slide[
      #heading(level: title-level, numbering: none, title)
      #v(1fr)
      #content
      #v(1fr)
    ]
  }
}

#let section-slide(content) = slide[
  #v(1fr)
  #heading(level: 1, numbering: "1.", content)
  #v(1fr)
]

#let subsection-slide(content) = slide[
  #v(1fr)
  #heading(level: 2, numbering: "1.1.", content)
  #v(1fr)
]

#let show-transform(middle: $==>$, left-ratio: 1fr, right-ratio: 1fr, source, gutter: 1em, target) = {
  let right = block(target)
  let left = block(source)
  style(styles => {
    let (height: left-height) = measure(left, styles)
    let (height: right-height) = measure(right, styles)
    let (height: middle-height) = measure(middle, styles)
    let height = calc.max(left-height, right-height)
    block(width: 100%, grid(
      columns: (left-ratio, auto, right-ratio),
      rows: (auto, ),
      column-gutter: gutter,
      pad(y: (height - left-height) / 2, left),
      pad(y: (height - middle-height) / 2, middle),
      pad(y: (height - right-height) / 2, right),
    ))
  })
}

#set raw(
  syntaxes: (
    "syntaxes/MLscript.sublime-syntax",
    "syntaxes/Scala.sublime-syntax"
  )
)

#set page(
  paper: "presentation-16-9",
  fill: orange.lighten(97.5%),
  footer: [
    #set text(size: 0.5em)
    #h(1fr)
    #context counter("logical-slide").display("1")
  ]
)
#set text(size: 22pt, font: "Public Sans", fill: major-text-color)
#show math.equation: set text(
  font: ("STIX Two Math", "New Computer Modern Math"),
  size: 1.15em,
)
#show heading.where(level: 3): set text(size: 26pt)
#show strong: set text(fill: orange.darken(60%))
#show emph: set text(fill: orange.darken(50%))
#show raw: set text(font: "Fira Code", size: 1.1em)
#show raw.where(block: false): box.with(
  fill: rgb(0, 0, 0, 5%),
  inset: (x: 0.2em, y: 0pt),
  outset: (top: 0.4em, bottom: 0.35em),
  radius: 2pt,
)

#let ext-lang-name-map = (
  mls: "MLscript",
  ml: "ML",
  ocaml: "OCaml",
  ts: "TypeScript",
  scala: "Scala",
  kotlin: "Kotlin",
  haskell: "Haskell",
  hs: "Haskell",
  java: "Java"
)

#counter(heading).update(0)

// The title page
#slide[
  #set align(center)

  #v(1fr)

  #text(size: 32pt, weight: "medium")[
    The Great Presentation Title
  ]

  #v(1em)

  #minor[The Great Presentation Sub-title]

  #v(0.5fr)

  #line(
    start: (0%, 0%),
    end: (80%, 0%),
    stroke: 1.5pt + minor-text-color
  )
  
  #v(0.5fr)

  Speaker Name

  #v(0.5fr)

  #minor(size: 0.8em)[1 January 2024]

  #v(1fr)
]

#section-slide[
  Section Title
]

#slide(title: [MLscript Syntax Highlighting])[
  ```mls
  abstract class Test
  class Test
  data class Point(x: Int, y: Int)
  module Parser with
    fun parse(s: Str): Tree = ???
  ```
]

#slide(title: [Grid in list items])[

  // Set relative font size of code block.
  #show raw.where(block: true): set text(size: 0.9em)

  #one-by-one(tight: false)[
    Programming a scene tree in computer graphics.

    ```ts
    type Shape = Rectangle | Ellipse | Group;
    ```

    #grid(
      columns: (1fr, 1fr, 1fr),
      column-gutter: 1em,
    )[
      ```ts
      type Rectangle = {
        kind: "rectangle";
        position: Point;
        size: Size;
      };
      ```
    ][
      ```ts
      type Ellipse = {
        kind: "ellipse";
        center: Point;
        radius: Size;
      }
      ```
    ][
      ```ts
      type Group = {
        kind: "group";
        delta: Vector;
        shapes: Shape[];
      };
      ```
    ]
  ][
    An object of type `Shape` can be refined by looking into field `kind`.
  ]
]

#slide(title: [Major/minor text example])[
  - Major text 1

    #minor[Minor descriptive text 1]

  - Major text 2

    #minor[Minor descriptive text 2]
]

#subsection-slide[Sub-section title]

#slide(title: [How to use figures?])[
  #align(center)[
    #image(width: 90%, "./figures/example.svg")
  ]

  - Sample text.

  - Sample text.
]


#section-slide[
  The Last Section Title
]

#slide(title: [Equation is different from LaTeX syntax])[
  $
    (
      K; Gamma tack.r e: \[ i | { "tag"_k : tau_k }^n_1 :: T \]
      quad
      K tack.r i >= angle.l nothing, { "tag"_k }^n_1 angle.r \
      K; Gamma, x_k : tau_k tack.r e_k : tau' (1 <= k <= n)
    ) / (
      K; Gamma tack.r kw.case e kw.of \{ `"tag"_k (x_k) -> e_k \}^n_1 : tau'
    )
  $

  - $e: \[ i | { "tag"_k : tau_k }^n_1 :: T \]$ \
    #h(1fr)
    #minor[--- $e$ is typed as multiple tags, each tag has type $tau_k$]
  
  - $K; Gamma, x_k : tau_k tack.r e_k : tau'$ \
    #h(1fr)
    #minor[--- suppose $x_k$ has type $tau_k$, $e_k$ can be typed as $tau'$]
]

#slide(title: [Syntax Highlight], code-block-font-ratio: 90%)[
  - Example

    ```ts
    type Cat = { meow(): void };
    type Dog = { bark(): void };
    type Wolf = { bark(): void; howl(): void };
    type Dogish<A> = A extends { bark(): void } ? A : never;
    type NeverCat = Dogish<Cat>; // => never
    type Wolfish = Dogish<Wolf>; // => { barks: true; howls: true; }
    ```
]

#slide(title: [Simple List])[
  - Bullet list item 1
  - Bullet list item 2
  - Bullet list item 3
]

#slide(title: [Covered Simple List])[
  #set text(size: 0.9em)
  #one-by-one(tight: false)[
    Bullet list item 1
  ][
    Bullet list item 2
  ][
    Bullet list item 3
  ]
]

#slide(title: [This page has smaller text.])[
  #set text(size: 0.9em) // <- Adjust the relative size of main text.
  #show raw.where(block: true): set text(size: 0.9em) // <- Adjust the relative size of code block.

  #one-by-one(tight: false)[
    Bullet list item 1
  ][
    Bullet list item 2
  ][
    Bullet list item 3

    ```mls
    case t_s of
      x_1: C_1 => t_1 // t_1 is of T_1
      // ...
      x_n: C_n => t_n // t_n is of T_n
      _        => t_d // t_d is of T_d
    ```

    Bullet list item 3 ended.
  ]

  #h(1fr) #paper-source(authors: [Author et al], year: 2024)[Publication Title]
]

#slide[
  #v(1fr)

  #align(center)[
    #v(1fr)

    _The end_

    #v(1fr)

    #line(start: (0%, 0%), end: (100%, 0%), stroke: minor-text-color)

    #v(1fr)

    Thanks for listening!

    #v(1fr)
  ]

  #v(1fr)
]