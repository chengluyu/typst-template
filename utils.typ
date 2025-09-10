#import "palette.typ": *

#let production-mode = false

// Shorthands for inline highlighted code block.
#let js(source) = raw(block: false, lang: "js", source)
#let ts(source) = raw(block: false, lang: "ts", source)
#let hs(source) = raw(block: false, lang: "hs", source)
#let mls(source) = raw(block: false, lang: "mls", source)
#let ocaml(source) = raw(block: false, lang: "ml", source)
#let scala(source) = raw(block: false, lang: "scala3", source)
#let kt(source) = raw(block: false, lang: "kotlin", source)


#let placeholder(content) = text(fill: gray, size: 28pt, content)
#let mention(content) = text(fill: note-text-color, size: 0.75em, weight: "medium", content)
#let paper-source(inline: true, authors: none, year: none, title) = {
  let content = [
    #if authors != none {
      [#authors, ]
    }#text(style: "italic", title)#if year != none { [, #year] }
  ]
  if inline {
    text(size: 0.75em, fill: note-text-color, content)
  } else {
    align(right)[
      #set text(size: 0.75em, fill: note-text-color)
    ]
  }
}

#let todo(content) = if not production-mode {
  text(fill: orange.darken(25%))[*TODO*: #content]
}
#let FIXME(content) = if not production-mode {
  text(fill: red.darken(25%))[*FIXME*: #content]
}
#let comment(content) = if not production-mode {
  text(fill: olive.darken(20%))[#text(fill: olive.darken(40%), weight: "bold")[Comment]: #content]
}
#let minor(..args, content) = if not production-mode {
  text(fill: minor-text-color, ..args, content)
}