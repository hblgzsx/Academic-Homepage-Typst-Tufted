#import "@preview/cmarker:0.1.8"
#import "@preview/mitex:0.1.0": mitex

// ==========================================
// 1. 全局字体修复 (防方块核心)
// ==========================================
#let font-stack = ("Source Han Sans SC", "Microsoft YaHei", "SimSun", "Heiti SC")
#set text(font: font-stack, lang: "zh")

// 强制修复公式里的 \text{} 显示
#show math.equation: set text(font: ("New Computer Modern Math", ..font-stack))

// ==========================================
// 2. 定义 blog-info (布局函数)
// ==========================================
#let blog-info(
  title: "默认标题",
  sub-title: none,
  date: datetime.today().display(),
  author: "匿名",
  show-outline: true,
  doc, // <--- 关键：这里接收正文内容，放在最后
) = {
  // 设置 PDF/HTML 的元数据
  set document(title: title, author: author)

  // A. 渲染顶部 Header 区域
  block(width: 100%, inset: (bottom: 2em))[
    #text(size: 2em, weight: "bold")[#title] \
    #if sub-title != none [
      #text(size: 1.2em, fill: gray)[#sub-title] \
    ]
    #v(0.5em)
    #text(fill: gray)[#author · #date]
    #line(length: 100%, stroke: 0.5pt + gray)
  ]

  // B. 渲染 Grid 布局 (左侧正文 + 右侧大纲)
  grid(
    columns: (1fr, 200pt),
    // 左侧自适应，右侧固定
    gutter: 2em,
    // 栏间距

    // 1. 左栏：放置正文 (doc)
    align(left, doc),

    // 2. 右栏：放置大纲 (Sidebar)
    if show-outline {
      align(top + left)[
        #block(
          stroke: (left: 2pt + gray.lighten(60%)),
          inset: (left: 1em),
          width: 100%, // 占满右侧格子的宽度
        )[
          #text(weight: "bold", fill: black.lighten(20%))[目录]
          #v(0.5em)
          // 这里的 outline 会自动抓取 cmarker 生成的标题
          #outline(title: none, indent: 1em, depth: 3)
        ]
      ]
    },
  )
}
