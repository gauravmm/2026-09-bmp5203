// Shared helpers for all slide decks in this repo.
// Import what you need, e.g.:  #import "/common.typ": gblock, lblock, big-section-slide
#import "@preview/touying:0.7.4": *
#import themes.metropolis: *

// Custom section divider: mirrors metropolis' new-section-slide but with a
// larger title and the section number styled like the principle index
// (big, bold, grey). Wire in via the theme:
//   #show: metropolis-theme.with(config-common(new-section-slide-fn: big-section-slide), ...)
#let big-section-slide(config: (:), level: 1, numbered: true, body) = touying-slide-wrapper(self => {
  let slide-body = {
    set std.align(horizon)
    show: pad.with(x: 12%, y: 20%)
    set text(size: 1.9em)
    // Number hangs in its own column, to the left of the centred title block.
    let section-number = text(weight: "bold", size: 3em, fill: luma(160))[
      #utils.display-current-heading(
        level: level,
        numbered: numbered,
        style: (setting: body => body, numbered: true, current-heading) => setting({
          if numbered and current-heading.numbering != none {
            numbering(
              current-heading.numbering,
              ..counter(heading).at(current-heading.location()),
            )
          }
        }),
      )
    ]
    let section-title = utils.display-current-heading(
      level: level,
      numbered: numbered,
      style: (setting: body => body, numbered: true, current-heading) => setting(
        current-heading.body,
      ),
    )
    // Title row: number hangs left of the title and bar only, so a
    // following epigraph does not pull the numeral down.
    grid(
      columns: (1fr, 16cm, 1fr),
      column-gutter: .8em,
      align: (right + bottom, left + bottom),
      section-number,
      stack(
        dir: ttb,
        spacing: .3em,
        text(self.colors.neutral-darkest, section-title),
        block(
          height: 2pt,
          width: 100%,
          spacing: 0pt,
          components.progress-bar(height: 2pt, self.colors.primary, self.colors.primary-light),
        ),
      ),
    )
    // Quote / notes sit under the title column. Absolute size so the
    // 1.9em title setting does not inflate the epigraph.
    grid(
      columns: (1fr, 16cm, 1fr),
      column-gutter: .8em,
      [],
      {
        set text(size: 20pt, fill: self.colors.neutral-dark)
        body
      },
    )
  }
  self = utils.merge-dicts(self, config-page(fill: self.colors.neutral-lightest))
  touying-slide(self: self, config: config, slide-body)
})

// Grey filled block — used for callouts / definition boxes.
#let gblock(body, inset: 0.4em, outset: 0.4em, width: 100%) = block(
  fill: luma(235),
  inset: inset,
  outset: outset,
  radius: 0.4em,
  width: width,
)[#body]

// White bordered block — lighter-weight callout.
#let lblock(body, inset: 0.4em, outset: 0.4em, width: 100%) = block(
  fill: white,
  stroke: 0.5pt + luma(220),
  inset: inset,
  outset: outset,
  radius: 0.4em,
  width: width,
)[#body]

// Metropolis default primary — use for bars, accents, comparison "good" sides.
#let accent = rgb("#EB811B")

// Epigraph for a `=` section slide. Lives in the section body so
// `big-section-slide` can place it under the title instead of on the next slide.
#let section-quote(quote, by) = {
  v(1.15em)
  block(
    width: 100%,
  )[
    #set text(size: 1.05em, style: "italic", fill: luma(70))
    #set par(leading: 0.5em)
    “#quote”
    #v(0.0em)
    #align(right, text(size: 0.72em, style: "normal", fill: luma(110))[--- #by])
  ]
}

// Grey titled box that fills its grid cell. From 01-introduction.
#let aside(title, body) = box(
  fill: luma(240),
  width: 100%,
  height: 100%,
  radius: 0.5em,
  inset: 0.5em,
  grid(
    rows: (2em, 1fr),
    align: horizon,
    text(weight: "bold", size: 1.5em)[#title],
    body,
  ),
)

// Horizontal percentage bar. `pct` is 0–100.
#let hbar(label, pct, fill: accent) = grid(
  columns: (9.2em, 1fr, 2.6em),
  column-gutter: 0.45em,
  align: horizon,
  text(size: 0.82em)[#label],
  box(width: 100%, height: 0.72em, fill: luma(230), radius: 0.12em)[
    #place(left, box(
      width: 100% * (pct / 100),
      height: 100%,
      fill: fill,
      radius: 0.12em,
    ))
  ],
  align(right, text(size: 0.82em, weight: "bold")[#pct%]),
)

// Card used in the great-filters grid.
#let filter-card(title, items) = lblock(inset: 0.55em, outset: 0pt)[
  #text(weight: "bold", size: 0.95em)[#title]
  #v(0.25em)
  #set text(size: 0.72em)
  #set list(marker: text(fill: accent)[•], spacing: 0.35em)
  #for it in items [- #it]
]

// Draft placeholder for a slide we will write together.
// Call as `#stub(( [outcome], ... ))[optional body]` or `#stub((...))`.
#let stub(outcomes, body) = lblock(inset: (x: 0.8em, y: 0.7em), outset: 0pt)[
  #text(size: 0.75em, fill: luma(110), weight: "bold", tracking: 0.08em)[STUB]
  #if body != [] [
    #v(0.35em)
    #body
  ]
  #v(0.4em)
  #text(weight: "bold")[Learning outcomes]
  #set text(size: 0.9em)
  #set list(spacing: 0.4em)
  #for o in outcomes [- #o]
]
