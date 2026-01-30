#import "@preview/cmarker:0.1.8"
#import "@preview/mitex:0.2.6": mitex

// ==========================================
// 1. 全局字体修复 (防方块核心)
// ==========================================
#let font-stack = ("Source Han Sans SC", "Microsoft YaHei", "SimSun", "Heiti SC")
#set text(font: font-stack, lang: "zh")

// 强制修复公式里的 \text{} 显示
#show math.equation: set text(font: ("New Computer Modern Math", ..font-stack))

// 2. 博客布局 (改用 table)
#let blog-info(
  title: "默认标题",
  sub-title: none,
  author: "匿名",
  date: datetime.today().display(),
  show-outline: true,
  doc,
) = {
  // 页面头部
  block(width: 100%, inset: (bottom: 2em))[
    #text(size: 2em, weight: "bold")[#title] \
    #if sub-title != none [
      #v(0.2em) #text(size: 1.2em, fill: gray.darken(20%))[#sub-title] \
    ]
    #v(0.5em) #text(fill: gray)[#author · #date]
    #line(length: 100%, stroke: 0.5pt + gray)
  ]

  // --- 核心修改：使用无边框 Table 实现分栏 ---
  // Table 在转 HTML 时非常稳定，不会像 Grid 那样丢失布局
  table(
    columns: (1fr, 250pt),
    // 左侧自适应，右侧固定 250pt
    stroke: none,
    // 隐藏边框
    column-gutter: 2em,
    // 两栏间距
    inset: 0pt,
    // 移除单元格内边距

    // 左侧单元格：正文
    align(left, doc),

    // 右侧单元格：大纲
    align(top + left)[
      #if show-outline {
        // 这里的 sticky 效果在 table 里较难实现，但在 HTML 转换后
        // 侧边栏至少会老实地待在右边
        block(stroke: (left: 2pt + gray.lighten(80%)), inset: (left: 1em))[
          #text(weight: "bold")[目录]
          #v(0.5em)
          #outline(title: none, indent: 1em, depth: 3)
        ]
      }
    ],
  )
}
