#import "@preview/cmarker:0.1.8"
#import "@preview/mitex:0.2.6": mitex

// ==========================================
// 1. 全局字体修复 (防方块核心)
// ==========================================
#let font-stack = ("Source Han Sans SC", "Microsoft YaHei", "SimSun", "Heiti SC")
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

  // --- 布局核心逻辑 ---

  // 2. 放置正文 (Content Layer)
  // 我们给正文套一个 block，强行限制它的宽度
  // 宽度 = 100% (父容器总宽) - 240pt (留给侧边栏的空间)
  block(
    width: 100% - 240pt,
    inset: (right: 2em), // 再加点内边距，防止文字紧贴侧边栏
    doc, // <--- 正文在这里渲染，支持跨页
  )

  // 1. 放置侧边栏 (Ghost Layer)
  // 使用 place 将它悬浮在父容器的右上角
  // 因为它是悬浮的，不会占用流式布局的空间，也不会被挤跑
  if show-outline {
    place(
      top + right,
      block(width: 220pt)[ // 设定侧边栏宽度
        #set text(size: 0.9em)
        #block(
          stroke: (left: 1pt + gray.lighten(70%)), // 左侧装饰线
          inset: (left: 1em),
          width: 100%,
        )[
          #text(weight: "bold")[目录]
          #v(0.5em)
          #outline(title: none, indent: 1em, depth: 3)
        ]
      ],
    )
  }
}
