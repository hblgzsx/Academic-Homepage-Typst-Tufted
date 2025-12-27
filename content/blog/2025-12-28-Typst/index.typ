
#import "../index.typ": template, tufted
#import "../utils.typ": blog-info
#show: template

#blog-info(
  title: "一份(不太)简短的Typst介绍",
  sub-title: "Typst官方文档中文翻译版",
  date: "2025-12-28",
  author: "中文翻译：Casea",
  show-outline: true,
)

= 一份(不太)简短的Typst介绍

Typst官方文档中文翻译版，总共有206页。
#let total-pages = 206

#for i in range(1, total-pages + 1) {
  image("../assests/Typst.pdf", width: 100%, page: i)
  pagebreak()
}
