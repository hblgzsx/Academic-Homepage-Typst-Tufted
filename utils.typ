//定义转换数学环境，LaTeX -> Typst
#import "@preview/mitex:0.2.5": *
//定义彩色box和引用环境
#import "@preview/showybox:2.0.4": showybox
#import "@preview/gentle-clues:1.2.0": *
//定义定理环境
#import "@preview/theofig:0.1.0": *
//参考文献
// #import "@preview/pergamon:0.6.0": *
//这个包可使用和LaTeX相同的citet, citep,citen, citeg命令

#import "@preview/alexandria:0.2.2": *
//定义任务清单
#import "@preview/cheq:0.3.0": checklist
//定义表格
#import "@preview/tblr:0.4.2": *
#import "@preview/rowmantic:0.5.0": rowtable

//图像环绕
#import "@preview/wrap-it:0.1.1": *

#import "@preview/cetz:0.4.2"

#import "/lib.typ": *



#let zsx-showybox(
  title: "题目",
  body: "内容",
  color: red,
) = showybox(
  title-style: (boxed-style: (:)),
  frame: (
    title-color: color.darken(30%),
    border-color: color.darken(30%),
    body-color: color.lighten(92%),
  ),
  title: [#title],
  shadow: (
    offset: 3pt,
  ),
  // footer:"111"
)[#body]

#let calendar-block(
  body: "内容",
  color: red,
) = block(
  fill: color.lighten(20%),
  inset: 1pt,
  radius: 2pt,
  stroke: 1pt + color.darken(20%),
  text(fill: white)[#body],
)

#let zsx-block(
  title: "题目",
  body: "内容",
  color: red,
) = block(
  fill: luma(95%),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
  // stroke: (paint: blue.lighten(50%), thickness: 1pt),
  // underline(it)
  {
    set par(first-line-indent: 0em)
    body
  },
  // [#body],
)


#let zsx-block1(
  title: "题目",
  body: "内容",
  color: red,
) = block(
  fill: luma(95%),
  inset: 8pt,
  radius: 4pt,
  {
    set par(first-line-indent: 0em)
    body
  },
)

#let circled(n) = {
  if n == 1 { "\u{2460}." } else if n == 2 { "\u{2461}." } else if n == 3 { "\u{2462}." } else if n == 4 {
    "\u{2463}."
  } else if n == 5 { "\u{2464}." } else if n == 6 { "\u{2465}." } else if n == 7 { "\u{2466}" } else if n == 8 {
    "\u{2467}"
  } else if n == 9 { "\u{2468}" } else if n == 10 { "\u{2469}" } else if n == 11 { "\u{246A}" } else if n == 12 {
    "\u{246B}"
  } else if n == 13 { "\u{246C}" } else if n == 14 { "\u{246D}" } else if n == 15 { "\u{246E}" } else if n == 16 {
    "\u{246F}"
  } else if n == 17 { "\u{2470}" } else if n == 18 { "\u{2471}" } else if n == 19 { "\u{2472}." } else if n == 20 {
    "\u{2473}."
  } else { "[?]" }
}



#let star = text(fill: red.darken(10%))[\u{2605}]
#let haitun = text(fill: blue.lighten(10%))[\u{1f433}]
// // 使用
// #circled(1) #circled(5) #circled(12)

// \u{1f433}. 海豚

#let dotted-dash-line = align(center)[#line(length: 100%, stroke: (dash: "loosely-dash-dotted"))]

#let dash-box(body) = box(
  stroke: (dash: "dashed"),
  inset: 10pt,
  outset: -2pt,
  radius: 4pt,
  baseline: 40%,
)[#align(center)[#body]]

#let gridLayout(columns: 3, gutter: 1em, ..items) = grid(
  columns: columns,
  gutter: gutter,
  ..items
)


#let highlight(content, color: rgb(255, 255, 0)) = {
  box(
    fill: color, // 设置背景色
    inset: 1pt, // 设置内边距（上下、左右）
    radius: 2pt, // 设置圆角
    text(content), // 确保文本大小一致
  )
}






// 类似于markdown的引用

#let colored-quote(body, color: blue, body-color: white.darken(2%), border-color: gray, stroke-width: 3pt) = clue(
  headless: true,
  body-color: body-color,
  accent-color: color,
  border-color: border-color,
  stroke-width: stroke-width,
  radius: 2pt,
  // border-color: white,
)[#body]


#let hline-zsx = rect(width: 100%, height: 0.5pt, fill: black)


#let AI-Quote(title: [AI 回答], ..args) = clue(
  title: title,
  icon: qwen,
  accent-color: rgb("#f88296"),
  header-color: rgb("FFC0CB"),
  ..args,
)


#let red-text(body) = text(fill: red.darken(30%))[#body]


// // Math 符号自定义




// #let R = math.bb($R$)           // 实数域
// #let p = math.upright($p$)      // 概率
// #let q = math.upright($q$)
// // ======================
// // 基础符号
// // ======================

// #let grad = math.equation($nabla$)
// #let defeq = math.colon.eq

// // ======================
// // 概率统计
// // ======================
// #let E = math.bb("E")
// #let Var = math.op("Var")
// #let Cov = math.op("Cov")


// // #let Ea(x) = E[ x ]
// // #let Eb(p, x) = E_(p)[ x ]
// // #let Vara(x) = Var[ x ]
// // #let Varb(p, x) = Var_(p)[ x ]

// #let kl(p, q) = math.equation($D_(upright(KL)) ( p ~ || ~ q )$)
// #let pdata = math.equation($p_(upright("data"))$)

// // ======================
// // 矩阵 / 向量
// // ======================
// #let bA = math.bold($A$)
// #let bI = math.bold($I$)
// #let bJ = math.bold($J$)
// #let bH = math.bold($H$)
// #let bL = math.bold($L$)
// #let bM = math.bold($M$)
// #let bQ = math.bold($Q$)
// #let bR = math.bold($R$)

// #let bzero = math.bold($0$)
// #let bone = math.bold($1$)

// #let bb = math.bold(math.upright($b$))
// #let bu = math.bold(math.upright($u$))
// #let bv = math.bold(math.upright($v$))
// #let bw = math.bold(math.upright($w$))
// #let bx = math.bold(math.upright($x$))
// #let by = math.bold(math.upright($y$))
// #let bz = math.bold(math.upright($z$))

// #let bxh = math.hat(bx)

// #let btheta = math.bold($theta$)
// #let bphi = math.bold($phi$)
// #let bepsilon = math.bold($epsilon$)
// #let bmu = math.bold($mu$)
// #let bnu = math.bold($nu$)
// #let bSigma = math.bold($Sigma$)

//数学符号自定义
#let grad = math.equation($nabla$)
#let mathbf(x) = math.bold(math.upright($#x$))
#let bar(x) = $overline(mathbf(#x))$
#let bf(x) = mathbf($#x$)
#let bx = bf($x$)
#let bv = bf($v$)
#let bI = bf($I$)
#let prod = math.equation($product$)
#let varepsilon = math.equation($epsilon$)
#let epsilon = math.equation($epsilon.alt$)
#let ard = math.equation($arrow.r.double$)
#let alrd = math.equation($arrow.l.r.double$)
#let ardl = math.equation($arrow.r.double.long$)
#let alrdl = math.equation($arrow.l.r.double.long$)
#let uparrow = math.equation($arrow.t$)
#let downarrow = math.equation($arrow.b$)
#let geq = math.equation($gt.eq.slant$)
#let leq = math.equation($lt.eq.slant$)
#let rtlb = math.equation($harpoons.rtlb$)
#let sim = math.equation($tilde.op$)
#let cdots = math.equation($dots.h.c$)
// 注意这里mid取代了原来的mid

#let mid = math.equation($mid(|)$)
#let mu = $mu$
#let sigma = $sigma$
#let epsilon = $epsilon$

#let rx = text(fill: red.darken(30%), size: 10pt)[$crossmark.heavy$]
#let gc = text(fill: green.darken(30%), size: 10pt)[$checkmark$]

#let pm = $plus.minus$
// #let bx(body) = mathbf($x_(#body)$)
// #let define-cmd(num, alias: none, handle: none) = {
//   (
//     (
//       kind: "cmd",
//       args: ("kind": "right", "pattern": (kind: "fixed-len", len: num)),
//       alias: alias,
//     ),
//     if handle != none {
//       (alias: alias, handle: handle)
//     } else {
//       none
//     },
//   )
// }


// #let mathbf = define-cmd(1, alias: "mitexmathbf", handle: it => math.bold(math.upright(it)))


#let equation_remark(body: [], ..items) = grid(
  columns: 1fr,
  gutter: 0.5em,
  [#body],
  [其中：],
  ..items,
)

#let title-quote(body) = colored-quote(
  body-color: white,
  color: red,
  stroke-width: 5pt,
  border-color: white,
)[#body]




#let title-quote-underline(
  accent-color: colors.accent,
  body,
) = {
  // 一级标题：大号 + 左侧装饰条 + 下划线
  // v(spacing.h1-gap)
  h(-spacing.h1-gap + 5pt)
  box[
    #box(
      baseline: 1em,
      width: decorations.h1-bar-width,
      height: 30pt,
      fill: accent-color,
      radius: decorations.h1-bar-radius,
    )
    #h(spacing.decor-gap)
    #underline(
      text(
        size: font-size.s3,
        weight: "black",
        fill: colors.text,
        [*#body*],
      ),
      offset: decorations.h1-underline-offset,
      stroke: decorations.h1-underline-stroke + accent-color,
    )
  ]
}


#let isolated-scope(body) = {
  context {
    let saved = counter(heading).get()
    body
    counter(heading).update(saved)
  }
}



