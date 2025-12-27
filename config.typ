#import "@preview/tufted:0.1.0"
#import "lib.typ": *

#let template = tufted.tufted-web.with(
  header-links: (
    "/Academic-Homepage-Typst-Tufted/": "Home",
    // "/Academic-Homepage-Typst-Tufted/docs/": "Docs",
    "/Academic-Homepage-Typst-Tufted/blog/": "Blog",
    // "/Academic-Homepage-Typst-Tufted/cv/": "CV",
  ),
  css: (
    // "https://cdnjs.cloudflare.com/ajax/libs/tufte-css/1.8.0/tufte.min.css",
    "/Academic-Homepage-Typst-Tufted/assets/tufted.css",
    "/Academic-Homepage-Typst-Tufted/assets/tufte.min.css",
    // "/Academic-Homepage-Typst-Tufted/assets/custom.css",
  ),
  title: "周树勋",
)

#set text(
  font: config.body-font,
  lang: "zh",
  region: "cn",
  size: config.text-size,
)
