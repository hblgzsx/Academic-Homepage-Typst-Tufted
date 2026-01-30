#import "../index.typ": template, tufted
#import "../utils.typ": blog-info
#import "@preview/mitex:0.2.6": mitex
#show: template
#set text(font: ("Source Han Sans", "SimSun"), lang: "zh")

#show: doc => blog-info(
  title: "变分持续学习",
  sub-title: "VCL论文个人解读总结",
  author: "cyrus.zhou",
  date: "2026-01-30",
  show-outline: true, // 想关掉大纲改成 false 即可
  doc, // 把剩下的内容传进去
)

#import "@preview/cmarker:0.1.8"

#cmarker.render(
  read("OnlineLearning.md"),
  scope: (image: (source, alt: none, format: auto) => image(source, alt: alt, format: format)),
  math: mitex,
)
