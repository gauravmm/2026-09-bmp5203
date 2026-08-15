#import "@preview/touying:0.7.4": *
#import "/common.typ": (
  accent, failure-stats, filter-card, gblock, hbar, lblock, section-quote,
  stage-callout, stage-cols, staged,
)

#let band(label, fill, stroke: 0.55pt + luma(190), height: 2.2em) = box(
  width: 100%,
  height: height,
  fill: fill,
  radius: 0.16em,
  stroke: stroke,
  inset: (x: 0.6em),
)[#align(horizon)[#text(size: 0.8em)[#label]]]

// Investment rounds as a staircase: row i starts one stage further right than
// row i-1 and spans two stages (the last one, IPO, spans one).
#let round-cascade(labels) = {
  labels
    .enumerate()
    .map(((i, label)) => {
      let span = if i == labels.len() - 1 { 1 } else { 2 }
      (
        ..range(i).map(_ => []),
        grid.cell(
          colspan: span,
          band(
            label,
            accent.lighten(80%),
            stroke: 0.8pt + accent,
            height: 1.6em,
          ),
        ),
        ..range(6 - i - span).map(_ => []),
      )
    })
    .flatten()
}

= From idea to exit

#section-quote[Starting a company is like staring into the abyss and eating glass.][Elon Musk]

#speaker-note[
  - First act: how firms fail, then the stages, then the filters
  - Toolkit first; the hinge later is "don't get drunk on the toolkit"
  - Musk: starting a company is like staring into the abyss and eating glass
  - The work is hard and psychologically brutal
  - Hold that in mind as we look at the failure numbers
]

== Startups tend to fail

#failure-stats(aside: uncover("2-", gblock[_How do we de-risk these?_]))

#speaker-note[
  - As a startup you are always teetering between life and death
  - US numbers: one in five gone in a year, half by year five, two-thirds by year ten
  - Failure is the default, and these are the usual reasons
  - Survival is predicated on assessing risks and carefully managing them
]

== Idea

#show: staged.with(active: "Idea")

#stage-callout("Idea")[
  You have an idea, and you're convinced that it solves a problem for someone in
  a way that they will pay you for.
]

#speaker-note[
  - Convinced it solves a problem for someone in a way they will pay you for
  - Nothing built yet; the whole stage is a bet on a belief
]

== Prototyping

#show: staged.with(active: "Prototyping")

#stage-callout("Prototyping")[
  You build the coarsest possible version of your solution, held together with
  spit and duct tape.
]

#speaker-note[
  - Coarsest possible version, spit and duct tape
  - The point is to learn, not to ship something durable
]

== Go-to-market

#show: staged.with(active: "Go-to-market")

#stage-callout("Go-to-market")[
  You receive money from a few people for your solution.
]

#speaker-note[
  - Money from a few people --- the first real signal
  - A few paying customers, not yet a repeatable machine
]

== Early Growth

#show: staged.with(active: "Early Growth")

#stage-callout("Early Growth")[
  You start making predictable sales.
]

#speaker-note[
  - Predictable sales: you can forecast, not just hope
]

== Growth

#show: staged.with(active: "Growth")

#stage-callout("Growth")[
  You make more and more sales, and expand across markets.
]

#speaker-note[
  - More sales, expand across markets
  - The problems become operational rather than existential
]

== Maturity

#show: staged.with(active: "Maturity")

#stage-callout("Maturity")[
  You attain stable, average, growth and now work to maintain market position.
]

#speaker-note[
  - Stable, average growth; now you defend position
  - We focus on the first half
]

/*
== Which stages you see

#show: staged.with(active: none)

// Columns mirror `stage-strip` exactly (6 × 1fr + the arrowhead's own column),
// so every band lines up with the stage pills above it.
#grid(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 0.7em),
  column-gutter: 0.3em,
  row-gutter: 0.58em,
  align: horizon,
  grid.cell(colspan: 6, band([As a founder.], rgb("#e8d9c8"))),
  [],

  [],
  [],
  grid.cell(colspan: 4, band([As a consultant.], accent.transparentize(68%))),
  [],

  [],
  [],
  grid.cell(
    colspan: 2,
    band(
      [As a founding employee\ (with equity).],
      accent.transparentize(82%),
      stroke: 0.8pt + accent,
    ),
  ),
  grid.cell(colspan: 2, band([As an employee.], luma(228))),
  [],

  [],
  ..("1–5", "3–15", "15–50", "50–100", "100–1000").map(s => align(
    center,
    text(size: 0.78em, weight: "bold")[#s],
  )),
  [],
)

#v(0.2em)
#text(size: 0.7em, fill: luma(100), tracking: 0.06em)[HOW BIG IS THE FIRM?]


#speaker-note[
  - Which stages you actually see depends on when you join and in what role
  - Founders see everything
  - Consultants see a mid-wide band
  - Founding employees see the middle
  - Ordinary employees usually only see late stages, once the firm is already large
]
*/

== The Funding Gap

#show: staged

#grid(
  columns: stage-cols,
  column-gutter: 0.3em,
  row-gutter: 0.45em,
  grid.cell(colspan: 2, band([Pre-Revenue], luma(228))),
  grid.cell(colspan: 4, band([Revenue Generating], accent.transparentize(72%))),
  [],

  grid.cell(colspan: 2)[
    #box(
      width: 100%,
      height: 0.7em,
      stroke: (
        left: 1.2pt + accent,
        right: 1.2pt + accent,
        bottom: 1.2pt + accent,
      ),
    )
    #v(0.15em)
    #align(center, text(size: 0.8em, weight: "bold")[The funding gap.])
  ],
  [], [], [], [], [],
)

#v(0.9em)
You spend money now hoping to make money later. It is an *existential* threat for
all early-stage startups. To survive, startups must manage their *runway* and
control their *burn rate*.

#speaker-note[
  - Pre-revenue you are spending with nothing coming in --- that is the funding gap
  - Existential: most early-stage failures happen here
  - Runway: how long the money lasts. Burn rate: how fast you spend it
]

== Investment Rounds

#show: staged

#grid(
  columns: stage-cols,
  column-gutter: 0.3em,
  row-gutter: 0.25em,
  align: horizon,
  grid.cell(rowspan: 5)[
    #text(size: 0.8em, weight: "bold")[Where does your investment come from?]
  ],
  ..round-cascade((
    [Pre-Seed or F/F/F],
    [Seed],
    [Series A],
    [Series B…],
    [IPO],
  ))
)

#v(0.8em)
// touying eats a literal `---` in body text (it is a subslide marker), so use the glyph
What do you trade for investment?
#pause
*Equity* — the value and ownership of your company.

#speaker-note[
  - Rounds step rightwards and downwards: each one comes later and buys less risk
  - Pre-Seed / friends, family and fools; then Seed, Series A, Series B and on
  - IPO is the exit, not the goal for most firms
  - What you trade is equity: value and ownership of your company
]

== Equity in a startup

#show: staged

#grid(
  columns: stage-cols,
  column-gutter: 0.3em,
  row-gutter: 0.25em,
  align: horizon,
  grid.cell(rowspan: 5)[
    #text(size: 0.8em, weight: "bold")[
      Where does your investment come from?\
      *How much equity do you give up?*
    ]
  ],
  ..round-cascade((
    [Pre-Seed or F/F/F: *10%*],
    [Seed: *20%*],
    [Series A: *25%*],
    [Series B…],
    [IPO],
  ))
)

#v(0.8em)
- You can dilute your share to nothing very easily.
- You can agree to innocuous terms that are very bad later.
- You are usually at an information disadvantage about external issues.

#speaker-note[
  - Rough rule of thumb: 10% pre-seed, 20% seed, 25% Series A --- it compounds
  - Dilution to nothing is easy; terms that look innocuous bite later
  - You are almost always the less-informed party at the table
]

/*
== The exit plan

#show: staged

// Each exit spans the stages where it is realistic — one band instead of the
// same label repeated in every column.
// Every band is two lines high, whether its label wraps or not.
#let exit-band(label) = band(label, accent.lighten(80%), stroke: 0.8pt + accent, height: 2.5em)

// Aside with a caret on its right edge, so it points at whatever follows it.
#let callout-right(body, fill: luma(235)) = grid(
  columns: (auto, 0.55em),
  align: horizon,
  box(fill: fill, radius: 0.3em, inset: (x: 0.7em, y: 0em), outset: (x: 0em, y: 0.3em))[
    #set text(size: 0.8em)
    #set align(left)
    #body
  ],
  polygon(fill: fill, (0pt, 0pt), (0.55em, 0.45em), (0pt, 0.9em)),
)

// One row of the grid; each band is (first stage, stages spanned, label).
// Bands must be given left to right. `note` fills the space before the first
// band, right-aligned so its caret meets the band. The row is padded out to the
// 7 columns of `stage-cols` (six stages plus the arrowhead).
#let exit-row(note: none, ..bands) = {
  let cells = ()
  let col = 0
  for (start, span, label) in bands.pos() {
    if note != none and col == 0 {
      cells.push(grid.cell(colspan: start, align: right + horizon, note))
    } else {
      cells += range(start - col).map(_ => [])
    }
    cells.push(grid.cell(colspan: span, align: horizon, exit-band(label)))
    col = start + span
  }
  cells + range(7 - col).map(_ => [])
}

#grid(
  columns: stage-cols,
  column-gutter: 0.3em,
  row-gutter: 0.25em,
  ..exit-row((1, 3, [Sell IP]), (5, 1, [IPO])),
  ..exit-row((2, 2, ["Acqui-hire"]), (5, 1, [Dividends])),
  ..exit-row(
    note: uncover("2", callout-right[
      A *"distressed asset"* sale.
    ]),
    (3, 3, [M\&A]),
  ),
  ..exit-row((4, 2, [Bought out by majority shareholders])),
  ..exit-row(
    note: uncover("3-", callout-right[
      *"Tag-along"* lets you sell on the same terms as the majority.\
      *"Drag-along"* makes you sell when they do.
    ]),
    (5, 1, [Bought out by private equity]),
  ),
)

#speaker-note[
  - Every exit is only available from some stage onwards; the earlier ones never go away
  - Sell IP is the early exit --- the team is the asset, or the patent is
  - Acquihire: hired by a competitor, product discarded
  - M\&A and buyout by majority shareholders once there is a real business to buy
  - IPO, dividends and private equity only at maturity
  - Tag-along lets you sell on the same terms as the majority; drag-along forces you to
]
*/
