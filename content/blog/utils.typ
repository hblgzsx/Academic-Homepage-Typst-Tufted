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
// 1. HTML 注入与样式配置
// ==========================================
// #show raw.where(lang: "html"): it => it.text
// #let html(content) = raw(content, lang: "html")

// #let html(content) = raw(content, block: true, lang: "html")
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
  // --- 页面头部 ---
  block(width: 100%, inset: (bottom: 2em))[
    #text(size: 2em, weight: "bold")[#title] \
    #if sub-title != none [
      #v(0.2em) #text(size: 1.2em, fill: gray.darken(20%))[#sub-title] \
    ]
    #v(0.5em) #text(fill: gray)[#author · #date]
    #line(length: 100%, stroke: 0.5pt + gray)
  ]

  // --- 核心修改：使用 Table 实现布局 ---
  // Table 在转 HTML 时通常会被渲染为 <table> 标签，天生支持左右分栏
  table(
    columns: (1fr, 260pt),
    // 左栏自适应，右栏固定宽
    stroke: none,
    // 【关键】隐藏边框，让它看起来像布局
    column-gutter: 2em,
    // 两栏之间的间距
    inset: 0pt,
    // 移除默认的单元格内边距，让文字对齐

    // [左栏]：放置正文
    align(left + top, doc),

    // [右栏]：放置大纲
    align(left + top)[
      #if show-outline {
        // 给大纲加一个左边框装饰，模仿 sidebar 效果
        block(
          stroke: (left: 1pt + gray.lighten(70%)),
          inset: (left: 1.5em),
          width: 100%,
        )[
          #text(weight: "bold", size: 1.1em)[目录]
          #v(0.5em)
          #outline(title: none, indent: 1em, depth: 3)
        ]
      }
    ],
  )
}
