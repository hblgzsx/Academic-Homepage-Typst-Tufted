#import "../index.typ": template, tufted
#import "../utils.typ": blog-info
#show: template

#blog-info(
  title: "变分持续学习",
  sub-title: "VCL论文个人解读总结",
  date: "2026-01-30",
  author: "cyrus.zhou",
  show-outline: true,
)

#import "@preview/cmarker:0.1.8"

#cmarker.render(
  read("OnlineLearning.md"),
  scope: (image: (source, alt: none, format: auto) => image(source, alt: alt, format: format)),
)
