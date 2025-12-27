#import "../config.typ": template, tufted
#import "../utils.typ": *
#import "cv/lib.typ": *
#show: template
#import "@preview/citegeist:0.2.0": load-bibliography



= 周树勋（Shuxun Zhou/Cyrus.zhou）

#tufted.margin-note[
  #profile-photo("assets/profile-photo.jpg")
]
// #tufted.margin-note[
//   #image("assets/arxiv.svg")
// ]
#tufted.margin-note[
  中国，安徽合肥，合肥工业大学，硕士研究生\
  Website: #link("https://hblgzsx.github.io/Academic-Homepage-Typst-Tufted/")[https://hblgzsx.github.io/Academic-Homepage-Typst-Tufted/] \
  Email: #link("mailto:cyrus.zhou@mail.hfut.edu.cn")[`cyrus.zhou@mail.hfut.edu.cn`]
]

Hi there!

我是一名专门研究计算机视觉和气象大模型的硕士生。我在华北理工大学完成了学士学位，现就读于合肥工业大学攻读硕士学位。您可以通过cyrus.zhou\@mail.hfut.edu.cn与我联系。


// == Experience
// - *1983--Present*: Founder & Publisher, Graphics Press. Independent publishing house specializing in information design and data visualization.
// - *1977--1999*: Professor Emeritus, Yale University. Departments of Political Science, Statistics, and Computer Science.
// - *1967--1977*: Instructor, Princeton University. Woodrow Wilson School of Public and International Affairs.

// == Artworks



// #tufted.margin-note[
//   A homage to Edward R. Tufte's large stainless steel sculpture titled _Escaping Flatland_
// ]

// Founder of Hogpen Hill Farms, a 234-acre sculpture park in Woodbury, Connecticut. Creator of large-scale works including _Larkin’s Twig_ and the _Escaping Flatland_ series, exhibited at the Aldrich Contemporary Art Museum.

// == Research Contributions
// Development of sparklines, a method for embedding high-resolution data graphics within text, and formulation of the data-ink ratio as a quantitative measure of graphical efficiency.

// == Books
// #{
//   let bib = load-bibliography(read("books.bib"))
//   for item in bib.values().rev() [
//     #let data = item.fields
//     - #strong(data.year): #emph(data.title)
//   ]
// }

== 📝 Publications
// #{
//   let bib = load-bibliography(read("assets/papers.bib"))
//   for item in bib.values().rev() [
//     #let data = item.fields
//     - #arxiv #data.author, "#data.title,", #data.year. URL: #link(data.url)[#data.url]
//   ]
// }

#{
  let bib = load-bibliography(read("assets/papers.bib"))

  // 自定义图标列表（顺序要和 bib 条目顺序对应）
  let icons = [
    "assets/arxiv.svg",
    "assets/arxiv.svg",
    "assets/arxiv.svg",
    "assets/arxiv.svg",
  ]

  tblr(
    columns: (1em, 2fr, 5fr, 2fr),
    header-rows: 1,
    hline: 0.03em,
    [
      for idx, item in bib.values().rev().enumerate() [
      // 第一列用自定义图标
      html.img(
      src: icons[idx],
      style: "height:1em; width:1em; vertical-align: middle;"
      ),
      #item["author"],
      #item["title"],
      #item["year"] + " / " + #link(item["url"])[#item["url"]]
      ]
    ],
  )
}



== #fa-graduation-cap Educational Background

2025.09-2028.06 *合肥工业大学* · *计算机科学与技术* //计算机科学与技术

2021.09-2025.06 *华北理工大学* · *智能科学与技术* //智能科学与技术



== #fa-award Honor and Awards

#item1(
  [ *第九/十/十一届全国大学生统计建模大赛* ],
  [ *省一/省一/国三* ],
  date[2025.10],
)

#item1(
  [ *2023MCM/2024 ICM 美国大学生数学建模竞赛* ],
  [ *Honorable/Meritorious* ],
  date[2024.05],
)

#item1(
  [ *第八/九届高校计算机大赛-团体程序设计天梯赛* ],
  [ *国二/国三* ],
  date[2023.04/2024.04],
)
