// CTU Bern, typst template
// Alan Haynes, André Moser
// CTU Bern, Department of Clinical Research, University of Bern
// Some source https://github.com/LaPreprint/typst/blob/main/lapreprint.typ


// Last changes:
// - Added project number
// - Multiple authors
// - TOC

#let ctu_typst_template(
  title: none,
  subtitle: none,
  projectno: none,
  toc: false,
  author: (),
  affiliations: (),
  logo: none,
  date: datetime.today(),
  paper-size: "a4",
  font-face: "Arial",
  heading-numbering: "1.1.1",
  body,
) = {


  // Spacer for footer
  let spacer = text(fill: gray)[#h(8pt) | #h(8pt)]
  
  // Set document metadata
  set document(title: title)
  // Set the body font
  set text(font: font-face)

  // Configure title page
  set page(
    paper-size,
    margin: (left: 2cm, right: 2cm, top: 5cm, bottom: 2cm),
    header: block(
      width: 100%,
      inset: (top: 1pt, right: 2pt),
      if (logo != none) {
        place(
          top+right,
          dy: -2cm,
          float: false,
        box(
          width: 27%,
          image(logo, width: 130%)
        ),
      )
      }
    )
  )

  v(0.1fr)

  // Set title
  set align(left)
  text(size: 17pt, title, weight: "bold")
  v(0.01fr)
  // Set subtitle
  if subtitle != none {
  text(size: 14pt, subtitle, weight: "semibold")
  }
  v(0.01fr)
  // Set project number
  if projectno != none {
  text(size: 14pt, "Project number: ")
  text(size: 14pt, projectno)
  }
  v(0.01fr)
  
  // set text(size: 10pt)
  text("Date: ")
  date.display("[month repr:long] [day], [year]")
  v(0.05fr)
  // First horizontal line
  line(length: 100%)
  
  if author.len()>1 {
  text(size: 14pt, "Authors: ")
  v(0.01fr)
  }
  if author.len()==1 {
  text(size: 14pt, "Author: ")
  v(0.01fr)
  }
  
  if author != none and author != [] {
    let count = author.len()
    let ncols = calc.min(count, 3)
    grid(
      columns: (1fr,) * ncols,
      row-gutter: 1.5em,
      ..author.map(author =>
          align(left)[
            #author.name \
            #author.affiliation \
            #author.email
          ]
      )
    )
  }
  
  // Second horizontal line
  line(length: 100%)

  v(0.2fr)

  // Set counter for pages
  counter(page).update(0)


  // Table of content
  if toc != false {
  // Space between section heading
  show heading: it => {
    it.body
    v(0.7em)
  }
  
  pagebreak()
  counter(page).update(0)
  outline()
  }
  
  // Configure main document pages
  

  
  set page(
    paper-size,
    margin: (left: 2cm, right: 2cm, top: 5cm, bottom: 2cm),
    numbering: "1",
    number-align: right,
    header: block(
      width: 100%,
      inset: (top: 1pt, right: 2pt),
      if (logo != none) {
        place(
          top+right,
          dy: -2cm,
          float: false,
        box(
          width: 27%,
          image(logo, width: 130%)
        ),
      )
      }
    ),
    footer: block(
      width: 100%,
      stroke: (top: 1pt + gray),
      inset: (top: 8pt, right: 2pt),
      [
        #grid(columns: (75%, 25%),
          align(left, text(size: 9pt, fill: gray.darken(50%),
              (
                {emph(title)},
                if(date != none) {date.display("[month repr:long] [day], [year]")}
              ).filter(t => t != none).join(spacer)
          )),
          align(right)[
            #text(
              size: 9pt, fill: gray.darken(50%)
            )[
            #counter(page).display() of #locate((loc) => {counter(page).final(loc).first()})
            ]
          ]
        )
      ]
    )
  )

  pagebreak()
  
  // Configure headings.
  set heading(numbering: heading-numbering)

  // Space between section headings
  show heading: set block(above: 1cm, below: 0.5cm)

  set align(left)
  text(size: 9pt, body)
  
  set par(justify: true, leading: 2em)
}
