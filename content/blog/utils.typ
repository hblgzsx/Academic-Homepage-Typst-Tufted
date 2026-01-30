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
#show raw.where(lang: "html"): it => it.text
#let html(content) = raw(content, lang: "html")


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
  // 注入 CSS
  html(
    "
    <style>
      .blog-container { display: flex; flex-direction: row; gap: 40px; max-width: 1200px; margin: 0 auto; padding: 20px; }
      .blog-main { flex: 1; min-width: 0; }
      /* 如果没有 sidebar，main 会自动变宽 */
      .blog-sidebar { width: 250px; flex-shrink: 0; }
      .sticky-box { position: sticky; top: 20px; padding-left: 20px; border-left: 2px solid #eee; }
      @media (max-width: 800px) {
        .blog-container { flex-direction: column; }
        .blog-sidebar { width: 100%; border-left: none; border-top: 2px solid #eee; margin-top: 2em; }
      }
    </style>
  ",
  )

  // --- 头部 ---
  block(width: 100%, inset: (bottom: 2em))[
    #text(size: 2em, weight: "bold")[#title] \
    #if sub-title != none [
      #v(0.2em)
      #text(size: 1.2em, fill: gray.darken(20%))[#sub-title] \
    ]
    #v(0.5em)
    #text(fill: gray)[#author · #date]
    #line(length: 100%, stroke: 0.5pt + gray)
  ]

  // --- HTML 布局开始 ---
  html("<div class='blog-container'>")

  // 左侧正文
  html("<div class='blog-main'>")
  doc
  html("</div>")

  // 右侧侧边栏 (关键修改：用 if 包裹整个右侧 div)
  if show-outline {
    // <--- 2. 只有为 true 时才渲染这块 HTML
    html("<div class='blog-sidebar'><div class='sticky-box'>")
    text(weight: "bold", size: 1.1em)[目录]
    v(0.5em)
    outline(title: none, indent: 1em, depth: 3)
    html("</div></div>")
  }

  html("</div>")
}
