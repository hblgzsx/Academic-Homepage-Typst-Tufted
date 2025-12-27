
#import "../index.typ": template, tufted
#show: template

= Equivalent Typst Function Names of LaTeX Commands

从 LaTeX 命令到 Typst 函数的等价名称

#let total-pages = 5

#for i in range(1, total-pages + 1) {
  image("../assests/Latex2typst.pdf", width: 80%, page: i)
  pagebreak()
}
