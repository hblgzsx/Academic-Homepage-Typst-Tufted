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
  // --- A. 设置页面布局 ---
  // 关键点：右边距设为 300pt (约 10cm)，给侧边栏腾出空间
  set page(
    margin: (left: 1in, right: 300pt),
  )

  // --- B. 放置侧边栏 ---
  // 使用 place 将大纲“扔”到右侧的空白边距里
  if show-outline {
    place(
      top + right, // 定位基准：正文区域的右上角
      dx: 260pt, // 向右偏移 260pt，进入边距区域 (因为 margin 是 300pt)
      scope: "parent",
      block(width: 240pt)[ // 限制侧边栏宽度
        #set text(size: 0.9em)
        #text(weight: "bold")[目录]
        #v(0.5em)
        #line(length: 100%, stroke: 0.5pt + gray)
        #outline(title: none, indent: 1em, depth: 3)
      ],
    )
  }

  // --- C. 渲染头部和正文 ---
  // 头部
  block(width: 100%, inset: (bottom: 2em))[
    #text(size: 2em, weight: "bold")[#title] \
    #if sub-title != none [
      #v(0.2em) #text(size: 1.2em, fill: gray.darken(20%))[#sub-title] \
    ]
    #v(0.5em) #text(fill: gray)[#author · #date]
    #line(length: 100%, stroke: 0.5pt + gray)
  ]

  // 正文 (doc 会自动在左侧较窄的区域内排版，超长也没关系)
  doc
}
