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

  // --- 布局核心逻辑 (已修正顺序) ---

  // 【步骤 1】先放侧边栏 (Sidebar First)
  // 把它放在正文前面，确保在 HTML DOM 结构中它位于顶部，不会被挤到下面去
  if show-outline {
    place(
      top + right,
      block(width: 220pt)[
        #set text(size: 0.9em)
        // 给个背景色调试，确认它是否渲染了
        #block(
          fill: luma(250), // 淡淡的灰色背景，确保你能看见它
          stroke: (left: 2pt + red.lighten(50%)), // 红色边框方便找位置
          inset: 1em,
          width: 100%,
        )[
          #text(weight: "bold")[目录]
          #v(0.5em)
          // 显式指定 target，防止抓不到标题
          #outline(title: none, indent: 1em, depth: 3, target: heading)
        ]
      ],
    )
  }

  // 【步骤 2】再放正文 (Content Second)
  // 宽度 = 100% - 240pt，留出右边空间
  block(
    width: 100% - 240pt,
    inset: (right: 2em),
    doc,
  )
}
