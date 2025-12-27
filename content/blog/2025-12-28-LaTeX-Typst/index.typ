
#import "../index.typ": template, tufted

#show: template
#import "../utils.typ": blog-info
#blog-info(
  title: "Equivalent Typst Function Names of LaTeX Commands",
  sub-title: "从 LaTeX 命令到 Typst 函数的等价名称",
  date: "2025-12-28",
  author: "Jianrui Lyu(tolvjr@163.com)",
  show-outline: true,
)


// = Equivalent Typst Function Names of LaTeX Commands

// 从 LaTeX 命令到 Typst 函数的等价名称

#let total-pages = 5

#for i in range(1, total-pages + 1) {
  image("../assests/Latex2typst.pdf", width: 100%, page: i)
  pagebreak()
}
