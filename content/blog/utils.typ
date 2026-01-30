
#let blog-info(
  title: "Typst 语法教程",
  sub-title: "",
  date: "2025-12-28",
  author: "周树勋",
  show-outline: true,
) = {
  // 1. 设置正文字体，解决中文方块问题
  set text(font: ("Source Han Sans", "SimSun"), lang: "zh")
  show math.equation: set text(font: ("New Computer Modern Math", "Source Han Sans"))

  // 2. 页面标题部分
  block(width: 100%, inset: (bottom: 1em))[
    #text(size: 2em, weight: "bold")[#title] \
    #text(fill: gray)[#sub-title] \
    #author, #date
  ]

  // 3. 使用 grid 布局实现侧边栏
  // 这里的 1fr 是主栏，200pt 是侧边栏宽度
  if show-outline {
    place(
      right + top,
      dx: 240pt, // 将大纲推到页面右边缘外侧，根据你的页面边距调整
      float: true,
      block(
        width: 200pt,
        inset: 1em,
        stroke: (left: 0.5pt + gray),
        {
          set text(size: 0.9em)
          text(weight: "bold")[目  录]
          outline(title: none, indent: auto)
        },
      ),
    )
  }
}


