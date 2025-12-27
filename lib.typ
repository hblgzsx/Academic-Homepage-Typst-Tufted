
// 颜色常量
#let colors = (
  bg: rgb("#fffef5"), // 背景色：白偏黄
  text: rgb("#333333"), // 字色：深灰
  highlight: rgb("#fff6c6"), // 高亮色：浅黄
  accent: rgb("#ff6b6b"), // 强调色：小红书红
  footer-bg: rgb("#000000").transparentize(60%), // 页脚背景
  white: rgb("#ffffff"),
  code-bg: rgb("#2d2d2d"), // 代码块背景色：深灰
  code-text: rgb("#f8f8f2"), // 代码块文字色：浅灰
)
// 间距常量
#let spacing = (
  margin-x: 80pt,
  margin-y: 120pt,
  title-gap: 40pt,
  para-gap: 20pt,
  h1-gap: 40pt, // 一级标题上间距
  h2-gap: 30pt, // 二级标题上间距
  h3-gap: 20pt, // 三级标题上间距
  h4-gap: 16pt, // 四级标题上间距
  h3-after: 16pt, // 三级标题下间距
  h4-after: 12pt, // 四级标题下间距
  decor-gap: 5pt, // 装饰条与文字间距
  decor-gap-sm: 12pt, // 装饰条与文字间距（小）
  cover-title-gap: 16pt, // 封面标题间距
  cover-subtitle-gap: 24pt, // 封面副标题间距
)
// 装饰元素常量
#let decorations = (
  h1-bar-width: 6pt, // 一级标题装饰条宽度
  h1-bar-height: 1.2em, // 一级标题装饰条高度
  h1-bar-radius: 2pt, // 一级标题装饰条圆角
  h1-underline-offset: 10pt, // 一级标题下划线偏移
  h1-underline-stroke: 2pt, // 一级标题下划线粗细
  h2-bar-width: 6pt, // 二级标题装饰条宽度
  h2-bar-height: 1.1em, // 二级标题装饰条高度
  h2-bar-radius: 3pt, // 二级标题装饰条圆角
  h3-radius: 8pt, // 三级标题圆角
  h3-inset-x: 16pt, // 三级标题内边距 x
  h3-inset-y: 8pt, // 三级标题内边距 y
  code-inline-radius: 4pt, // 行内代码圆角
  code-inline-inset-x: 8pt, // 行内代码内边距 x
  code-inline-inset-y: 4pt, // 行内代码内边距 y
  code-inline-outset-y: 4pt, // 行内代码外边距 y
  code-block-radius: 12pt, // 代码块圆角
  code-block-inset: 24pt, // 代码块内边距
  cover-image-radius: 24pt, // 封面图片圆角
  cover-author-radius: 50pt, // 封面作者标签圆角
  cover-author-inset-x: 24pt, // 封面作者标签内边距 x
  cover-author-inset-y: 12pt, // 封面作者标签内边距 y
)

// ================================
// 字体配置
// ================================


#let font = (
  // 中文字体
  zh_shusong: "SimSun",
  zh_zhongsong: "STZhongsong",
  zh_kai: "KaiTi",
  zh_hei: "SimHei",
  zh_fangsong: "STFangsong",
  // 英文字体
  en_sans_serif: "New Computer Modern",
  // en_serif: "New Computer Modern",
  math_serif: "Libertinus Serif",
  // en_serif: "Times New Roman",
  en_serif: "Comic Sans MS",
  en_typewriter: "Courier New",
  en_code: "Consolas",
)

// ================================
// 字号配置
// ================================

#let font-size = (
  s2: 18pt, // 二号
  n3: 16pt, // 三号
  s3: 15pt, // 小三
  n4: 14pt, // 四号
  s4: 12pt, // 小四
  n5: 10.5pt, // 五号
  s5: 9pt, // 小五
)

// ================================
// 样式配置
// ================================

#let config = (
  // 字号设置
  text-size: font-size.n5,
  code-size: font-size.s5,
  author-size: font-size.n5,
  title-size: font-size.s2,
  title1-size: font-size.s3,
  title2-size: font-size.n4,
  title3-size: font-size.s4,
  // 字体设置
  title-font: (font.en_serif, font.zh_hei),
  author-font: (font.en_sans_serif, font.zh_shusong),
  body-font: (font.en_serif, font.zh_shusong, font.math_serif),
  heading-font: (font.en_serif, font.zh_zhongsong),
  caption-font: (font.en_serif, font.zh_kai),
  header-font: (font.en_serif, font.zh_kai),
  strong-font: (font.en_serif, font.zh_hei),
  emph-font: (font.en_serif, font.zh_kai),
  raw-font: (font.en_code, font.zh_hei),
  // 间距设置
  spacing: 1.5em,
  leading: 1.0em,
  indent: 2em,
  small-space: 1em,
  block-space: 0.75em,
  // 颜色设置
  raw-color: rgb("#f0f0f0"),
  problem-color: rgb(241, 241, 255),
  summary-color: rgb(240, 248, 255),
  // 时间线框颜色,淡粉色
  timeline-color: rgb(255, 240, 245),
  // 列表样式
  list-marker: ([•], [◦], [▶]),
  enum-numbering: ("1.", "(1)", "①", "a."),
  // 表格样式
  table-stroke: 0.08em,
  table-header-stroke: 0.05em,
)



// ================================
// 全局状态
// ================================

// 全局title状态
#let title-state = state("document-title", "")

// ================================
// 工具函数
// ================================

// 偏微分符号
#let pardiff(x, y) = $frac(partial #x, partial #y)$

// ================================
// 学术组件
// ================================

// 通用框组件
#let custom-block(
  title: none,
  color: rgb(245, 245, 245),
  it,
) = {
  set text(font: config.emph-font)
  let body = if title != none {
    strong(title) + h(config.block-space) + it
  } else {
    it
  }

  block(
    fill: color,
    inset: 8pt,
    radius: 2pt,
    width: 100%,
    body,
  )
}

#let custom-block-zsx(
  title: none,
  color: rgb(245, 245, 245),
  width: auto,
  it,
) = {
  set text(font: config.emph-font)
  let body = if title != none {
    strong(title) + h(config.block-space) + it
  } else {
    it
  }

  block(
    fill: color,
    inset: 8pt,
    radius: 2pt,
    width: width,
    stroke: black,

    body,
  )
}

#let custom-block-zsx-center(
  title: none,
  color: rgb(245, 245, 245),
  width: auto,
  it,
) = {
  set text(font: config.emph-font)
  let body = if title != none {
    strong(title) + h(config.block-space) + it
  } else {
    it
  }
  align(center)[
    #block(
      fill: color,
      inset: 8pt,
      radius: 2pt,
      width: width,
      stroke: black,

      body,
    )]
}



// 题目框
#let problem-counter = counter("problem")
#let problem = custom-block.with(
  title: [
    #problem-counter.step()
    题目 #context problem-counter.display().
  ],
  color: config.problem-color,
)

// 解答框
#let solution(it) = {
  set enum(numbering: "(1)")
  let body = [*解答.*] + h(config.block-space) + it
  block(
    inset: 8pt,
    below: config.leading,
    width: 100%,
    body,
  )
}

// 总结框
#let summary = custom-block.with(
  title: [总结.],
  color: config.summary-color,
)

#let timeline = custom-block.with(
  // title: [.],
  color: config.timeline-color,
)

// 三线表格
#let three-line-table(it) = {
  if it.children.any(c => c.func() == table.hline) {
    return it
  }

  let meta = it.fields()
  meta.stroke = none
  meta.remove("children")

  let header = it.children.find(c => c.func() == table.header)
  let cells = it.children.filter(c => c.func() == table.cell)

  if header == none {
    let columns = meta.columns.len()
    header = table.header(..cells.slice(0, columns))
    cells = cells.slice(columns)
  }

  return table(
    ..meta,
    table.hline(stroke: config.table-stroke),
    header,
    table.hline(stroke: config.table-header-stroke),
    ..cells,
    table.hline(stroke: config.table-stroke),
  )
}


#let header-style(heading) = {
  set text(font: config.header-font)
  let title = title-state.get()
  grid(
    columns: (1fr, 1fr),
    align(left, title), align(right, heading),
  )
  v(-1.2em)
  line(stroke: 1pt + gray, length: 100%)
}

#let prev-header = context {
  let headings = query(heading.where(level: 1).before(here()))
  let headingsSecond = query(heading.where(level: 2).before(here()))
  if headings.len() == 0 {
    return
  }
  if headingsSecond.len() == 0 {
    return
  }
  // let level = counter(heading.where(level: 1)).display("一")
  let heading = h(config.small-space) + headings.last().body + h(config.small-space) + headingsSecond.last().body
  header-style(heading)
}

#let next-header = context {
  let headings = query(heading.where(level: 1).after(here()))
  if headings.len() == 0 {
    return
  }
  let count = counter(heading.where(level: 1)).get().first() + 1
  let level = numbering("一", count)
  let heading = level + h(config.small-space) + headings.first().body
  header-style(heading)
}

#let heading-style(
  accent-color: colors.accent,
  body,
) = {
  // 一级标题：大号 + 左侧装饰条 + 下划线
  show heading.where(level: 2): it => {
    v(spacing.h1-gap)
    box[
      #box(
        baseline: 0.3em,
        width: decorations.h1-bar-width,
        height: decorations.h1-bar-height,
        fill: accent-color,
        radius: decorations.h1-bar-radius,
      )
      // #h(spacing.decor-gap)
      #underline(
        text(
          size: font-size.s3,
          weight: "black",
          fill: colors.text,
          it.body,
        ),
        offset: decorations.h1-underline-offset,
        stroke: decorations.h1-underline-stroke + accent-color,
      )
    ]
  }
  body
}



// 标题
#let make-title(
  title: "",
  author: "",
  date: none,
  abstract: none,
  keywords: (),
) = {
  // 主标题
  align(center)[
    #block(
      text(
        font: config.title-font,
        weight: "bold",
        config.title-size,
        title,
      ),
    )
    #v(0.5em)
  ]

  // 作者
  if author != "" {
    set text(config.author-size, font: config.author-font)
    align(center, author)
  }

  // 日期
  if date != none {
    date = if date == auto {
      datetime.today().display("[year]年[month]月[day]日")
    } else {
      date.display("[year]年[month]月[day]日")
    }
    set text(config.author-size, font: config.author-font)
    align(center, date)
  }

  // 摘要和关键词
  if abstract != none [
    *摘要：* #abstract

    #if keywords != () [
      *关键字：* #keywords.join("；")
    ]
  ]
}

// ================================
// 主模板函数
// ================================

#let project(
  title: "",
  author: "",
  date: none,
  abstract: none,
  keywords: (),
  body,
) = {
  title-state.update(title)
  show table: three-line-table


  // 文档设置
  set document(author: author, title: title, date: date, keywords: keywords)

  // 页面设置
  set page(
    numbering: "1",
    number-align: center,
    header: prev-header,
  )

  // 基础样式设置
  set heading(numbering: "1.1")
  set text(
    font: config.body-font,
    lang: "zh",
    region: "cn",
    size: config.text-size,
  )
  set par(
    first-line-indent: (amount: 2em, all: true),
    justify: true,
    leading: config.leading,
    spacing: config.spacing,
  )
  set enum(
    indent: config.indent,
    full: true,
    numbering: (..n) => {
      n = n.pos()
      let level = n.len()
      let number = config.enum-numbering.at(level - 1, default: "1.")
      numbering(number, ..n.slice(level - 1))
    },
  )
  set list(
    indent: config.indent,
    marker: config.list-marker,
  )
  set math.equation(numbering: "(1)")
  set underline(evade: false)

  // ================================
  // 标题样式
  // ================================

  show heading: set text(font: config.heading-font)
  show heading: set block(above: 1.3em, below: 1.3em)
  show heading: it => block({
    if it.numbering != none {
      counter(heading).display() + h(config.small-space)
    }
    it.body
  })

  show heading.where(level: 1): set align(center)
  // show heading.where(level: 1): set heading(numbering: none)
  show heading.where(level: 1): set text(config.title1-size)
  show heading.where(level: 2): set text(config.title2-size)
  show heading.where(level: 3): set text(config.title3-size)
  //自定义用法需要冒号。
  // show: heading-style.with(accent-color: colors.accent)

  // ================================
  // 元素样式
  // ================================

  // 数学公式：无标签则不编号
  show math.equation: it => {
    set block(breakable: true)
    if it.block and not it.has("label") [
      #counter(math.equation).update(v => v - 1)
      #math.equation(it.body, block: true, numbering: none)#label("_")
    ] else {
      it
    }
  }

  // 图表样式
  show figure: set text(font: config.caption-font)
  show figure.where(kind: table): set figure.caption(position: top)
  show table: set text(font: config.body-font)

  // 列表样式
  show list: it => {
    set list(indent: 0em)
    set enum(indent: 0em)
    it
  }
  show enum: it => {
    set list(indent: 0em)
    set enum(indent: 0em)
    it
  }
  show terms: set text(font: config.caption-font)

  // 文字样式
  show strong: set text(font: config.strong-font)
  show emph: set text(font: config.emph-font)
  show ref: set text(red)
  show link: it => {
    set text(blue)
    // it
    underline(it)
  }

  // 代码样式
  show raw: set text(font: config.raw-font, size: config.code-size)
  show raw.where(block: true): set block(
    width: 100%,
    fill: luma(245),
    inset: 10pt,
    radius: 4pt,
    stroke: luma(200) + 0.5pt,
  )

  // // 自定义二级和三级标题样式
  // show heading.where(level: 3): it => [
  //   #set text(weight: "bold", size: 1.2em)
  //   #it.body
  //   #v(0.3em)
  //   #line(length: 100%, stroke: 0.8pt)
  // ]

  // show heading.where(level: 4): it => [
  //   #set text(weight: "bold", size: 1.05em)
  //   #it.body
  //   #v(0.25em)
  //   #line(length: 60%, stroke: 0.6pt)
  // ]

  // ================================
  // 文档标题部分
  // ================================
  make-title(
    title: title,
    author: author,
    date: date,
    abstract: abstract,
    keywords: keywords,
  )

  // 正文内容
  body
}


#let my-link = custom-block-zsx.with(
  title: [
    原文链接 ：
  ],
  // color: config.problem-color,
)

#let my-Slide = custom-block-zsx.with(
  title: [
    Slide链接 ：
  ],
  // color: config.problem-color,
)

#let my-Slide2 = custom-block-zsx.with(
  title: [
    Slide2链接 ：
  ],
  // color: config.problem-color,
)

#let my-block = custom-block-zsx.with(
  // color: config.problem-color,
)

#let my-block-big = custom-block-zsx.with(
  // color: config.problem-color,
  width: 100%,
)



#let my-block-small = custom-block-zsx.with(
  // color: config.problem-color,
  width: auto,
)


#let profile-photo(path) = html.img(
  class: "profile-photo",
  src: path,
  style: "width: 40%;height:auto;",
)


#let item2(
  logo,
  title,
  author,
  year,
  url,
) = {
  let logo-path = logo.lower()
  table(
    columns: 5,
    gutter: 0.1em,
    stroke: none,
    image("assets/" + logo-path + ".svg", width: 1em), title, author, year, url,
  )
}

