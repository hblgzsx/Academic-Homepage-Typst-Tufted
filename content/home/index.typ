#import "../index.typ": template, tufted
#import "../../utils.typ": *
#import "../cv/lib.typ": *
#show: template
#import "@preview/citegeist:0.2.0": load-bibliography



= Edward R. Tufte

#tufted.margin-note[
  Statistician, Artist, and Professor Emeritus \
  Website: #link("https://www.edwardtufte.com")[edwardtufte.com] \
  Email: #link("mailto:noreply@edwardtufte.com")[`noreply@edwardtufte.com`]
]

Research in statistical evidence and analytical design for information visualization, integrating principles from statistics, graphic design, and cognitive science for the effective presentation of quantitative data.


// == Experience
// - *1983--Present*: Founder & Publisher, Graphics Press. Independent publishing house specializing in information design and data visualization.
// - *1977--1999*: Professor Emeritus, Yale University. Departments of Political Science, Statistics, and Computer Science.
// - *1967--1977*: Instructor, Princeton University. Woodrow Wilson School of Public and International Affairs.

== Artworks

#tufted.margin-note[
  #image("escaping-flatland.webp")
]

#tufted.margin-note[
  A homage to Edward R. Tufte's large stainless steel sculpture titled _Escaping Flatland_
]

Founder of Hogpen Hill Farms, a 234-acre sculpture park in Woodbury, Connecticut. Creator of large-scale works including _Larkin’s Twig_ and the _Escaping Flatland_ series, exhibited at the Aldrich Contemporary Art Museum.

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

== Papers
#{
  let bib = load-bibliography(read("papers.bib"))
  for item in bib.values().rev() [
    #let data = item.fields
    - #arxiv #data.author, "#data.title,", #data.year. URL: #link(data.url)[#data.url]
  ]
}

== #fa-graduation-cap Educational Background
#sidebar(with-line: true, side-width: 24%)[
  2025.09-2028.06
][
  *合肥工业大学* · *计算机科学与技术* //计算机科学与技术
]
#sidebar(with-line: true, side-width: 24%)[
  2021.09-2025.06
][
  *华北理工大学* · *智能科学与技术* //智能科学与技术
]


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
