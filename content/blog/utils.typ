
#let blog-info(
  title: "Typst 语法教程",
  sub-title: "",
  date: "2025-12-28",
  author: "周树勋",
  show-outline: true,
) = [
  #title
  #footnote[
    #text(fill: gray, size: 0.8em)[#sub-title] \
    #author, #date, \
    if show-outline {
    #let h1s = h1.where(level: 1)
    #list(
      h1s.map(h1 => [
        #text(h1.body),
        #let h2s = h2.where(level: 2).filter(h2 => h2.parent == h1)
        #list(
          h2s.map(h2 => [
            #text(h2.body),
            #let h3s = h3.where(level: 3).filter(h3 => h3.parent == h2)
            #list(h3s.map(h3 => text(h3.body)), numbering: true, spacing: 0.1em)
          ]),
          numbering: true,
          spacing: 0.15em,
        )
      ]),
      numbering: true,
      spacing: 0.2em,
    )
    }
  ]
]


