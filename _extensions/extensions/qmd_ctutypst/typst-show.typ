#show: ctu_typst_template.with(
$if(title)$
  title: "$title$",
$endif$
$if(subtitle)$
  subtitle: "$subtitle$",
$endif$
$if(projectno)$
  projectno: "$projectno$",
$endif$
$if(toc)$
  toc: "$toc$",
$endif$
$if(logo)$
  logo: "$logo$", 
$endif$
$if(paper-size)$
  paper-size: "$paper-size$", 
$endif$
$if(by-author)$
  author: (
$for(by-author)$
$if(it.name.literal)$
    ( name: [$it.name.literal$],
      affiliation: [$for(it.affiliations)$$it.name$$sep$, $endfor$],
      email: [$it.email$] ),
$endif$
$endfor$
    ),
$endif$
$if(affiliation)$
  affiliation: "$affiliation$",
$endif$
$if(heading-numbering)$
  heading-numbering: $heading-numbering$,
$endif$
)
