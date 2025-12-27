
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
    #if show-outline {
      outline(title: "", indent: auto)
    }
  ]
]


