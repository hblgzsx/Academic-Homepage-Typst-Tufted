#import "@preview/cmarker:0.1.8"
#import "@preview/mitex:0.2.6": mitex

// ==========================================
// 1. 全局字体修复 (防方块核心)
// ==========================================
#let font-stack = ("Noto Sans CJK SC", "Source Han Sans SC", "Microsoft YaHei", "SimSun", "Heiti SC")
#set text(font: font-stack, lang: "zh")

// 强制修复公式里的 \text{} 显示
#show math.equation: set text(font: ("New Computer Modern Math", ..font-stack))

// ==========================================
// 2. 博客布局 (修复 show-outline 参数)
// ==========================================
#let blog-info(
  title: "默认标题",
  sub-title: none,
  author: "匿名",
  date: datetime.today().display(),
  show-outline: true, // <--- 1. 参数加回来了！
  doc,
) = {
  // --- 头部区域 ---
  block(width: 100%, inset: (bottom: 2em))[
    #text(size: 2em, weight: "bold")[#title] \
    #if sub-title != none [
      #v(0.2em) #text(size: 1.2em, fill: gray.darken(20%))[#sub-title] \
    ]
    #v(0.5em) #text(fill: gray)[#author · #date]
    #line(length: 100%, stroke: 0.5pt + gray)
  ]

  if show-outline {
    // 给目录加一个灰色背景盒，稍微美化一下
    block(
      fill: luma(248),
      width: 100%,
      inset: 1em,
      radius: 4pt,
      stroke: (left: 4pt + gray),
    )[
      #text(weight: "bold", size: 1.1em)[文章目录]
      #v(0.5em)
      // 使用 columns(2) 让目录分两列显示，节省垂直空间
      #outline(title: none, indent: 1em, depth: 3, target: heading)
    ]
    v(2em) // 目录和正文的间距
  }

  // 宽度 = 100% - 240pt，留出右边空间
  block(
    width: 100% - 240pt,
    inset: (right: 2em),
    doc,
  )
}
