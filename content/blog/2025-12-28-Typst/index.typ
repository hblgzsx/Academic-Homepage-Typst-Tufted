
#import "../index.typ": template, tufted
#show: template

= Typst 语法教程

#let total-pages = 206

#for i in range(1, total-pages + 1) {
  image("../assests/Typst.pdf", width: 80%, page: i)
  pagebreak()
}
