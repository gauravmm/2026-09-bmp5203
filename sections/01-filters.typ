#import "@preview/touying:0.7.4": *
#import "/common.typ": accent, filter-card, gblock, hbar, lblock, section-quote, staged

#let stage(n, title, gloss) = lblock(inset: 0.48em, outset: 0pt)[
  #text(fill: accent, weight: "bold", size: 0.7em, font: "DejaVu Sans Mono")[#n]
  #h(0.28em)
  #text(weight: "bold")[#title]
  #v(0.22em)
  #text(size: 0.66em, fill: luma(70))[#gloss]
]

#let flow-arrow = align(center + horizon)[
  #text(size: 1.3em, fill: luma(160))[→]
]

#let band(label, fill, stroke: 0.55pt + luma(190)) = box(
  width: 100%,
  height: 2.2em,
  fill: fill,
  radius: 0.16em,
  stroke: stroke,
  inset: (x: 0.6em),
)[#align(horizon)[#text(size: 0.8em)[#label]]]

= How firms fail

#section-quote[Starting a company is like staring into the abyss and eating glass.][Elon Musk]

#speaker-note[
  - First act: how firms fail, then the stages, then the filters
  - Toolkit first; the hinge later is "don't get drunk on the toolkit"
  - Musk: starting a company is like staring into the abyss and eating glass
  - The work is hard and psychologically brutal
  - Hold that in mind as we look at the failure numbers
]

== Startups tend to fail

#let pct(n) = [
  #text(size: 4em)[#n]#text(size: 1.0em, baseline: -1.6em)[%]
]

#let survival = grid(
  columns: (auto, auto),
  column-gutter: 0.45em,
  row-gutter: 1.5em,
  align: (right + horizon, left + horizon),
  ..(([1 year], 20), ([3 years], 39), ([5 years], 50), ([10 years], 65))
    .map(((l, n)) => (text(size: 1em)[#l], pct(n)))
    .flatten()
)

#let causes = grid(
  columns: (auto, auto),
  column-gutter: 0.45em,
  row-gutter: 1.0em,
  align: (right + horizon, left + horizon),
  ..(
    (38, [Financial Issues]),
    (35, [Lack of Market Need]),
    (20, [Competition]),
    (19, [Business Model]),
    (18, [Legal Challenges]),
  )
    .map(((n, l)) => (pct(n), text(size: 1em)[#l]))
    .flatten()
)

// ponytail: bracket measures the taller column so it tracks the chart's own height
#let bracket(side) = context {
  let s = 1.2pt + accent
  box(
    width: 0.5em,
    height: calc.max(measure(survival).height, measure(causes).height),
    stroke: (top: s, bottom: s) + side,
  )
}

#grid(
  columns: (auto, auto, auto, auto, auto, 1fr),
  column-gutter: 0.6em,
  align: horizon,
  align(right, survival),
  bracket((right: 1.2pt + accent)),
  [because],
  bracket((left: 1.2pt + accent)),
  align(left, causes),
  // ponytail: aside rides in the leftover column, so the chart keeps its own metrics
  align(center)[
    #uncover("2-")[
      #gblock[_How do we de-risk these?_]
    ]
  ],
)

#align(bottom + right)[
  #text(size: 0.62em, fill: luma(110))[
    Numbers from the US. See
    #link("https://www.forbes.com/advisor/business/software/startups-failure-rate/")[forbes.com/advisor/business/software/startups-failure-rate/].
  ]
]

#speaker-note[
  - As a startup you are always teetering between life and death
  - US numbers: one in five gone in a year, half by year five, two-thirds by year ten
  - Failure is the default, and these are the usual reasons
  - Survival is predicated on assessing risks and carefully managing them
]

== Stages of starting up

#grid(
  columns: (1fr, auto, 1fr, auto, 1fr),
  column-gutter: 0.35em,
  row-gutter: 0.55em,
  stage(
    [01],
    [Idea],
  )[You have an idea, and you're convinced that it solves a problem for someone in a way that they will pay you for.],
  flow-arrow,
  stage(
    [02],
    [Prototyping],
  )[You build the coarsest possible version of your solution, held together with spit and duct tape.],
  flow-arrow,
  stage([03], [Go-to-market])[You receive money from a few people for your solution.],

  stage([04], [Early Growth])[You start making predictable sales.],
  flow-arrow,
  stage([05], [Growth])[You make more and more sales, and expand across markets.],
  flow-arrow,
  stage([06], [Maturity])[You attain stable, average, growth and now work to maintain market position.],
)

#v(0.7em)
#pause
#gblock[
  _We're going to focus on the first half._
]

#speaker-note[
  - Idea: convinced it solves a problem for someone in a way they will pay you for
  - Prototyping: coarsest possible version, spit and duct tape
  - Go-to-market: money from a few people
  - Early Growth: predictable sales
  - Growth: more sales, expand across markets
  - Maturity: stable, average growth; now you defend position
  - We focus on the first half
]

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
  grid.cell(colspan: 3, band([As a consultant.], accent.transparentize(68%))),
  [],
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

== The Great Filters

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 0.55em,
  filter-card([Validation], (
    [Is the problem worth solving?],
    [Does it solve the problem?],
    [Can you collect money?],
  )),
  filter-card([Customer Discovery], (
    [Will someone actually pay?],
    [Can someone pay for it? (The M.A.N.)],
    [Other than the product, what do you need?],
    [Will your team fall apart?],
  )),
  filter-card([Product--Market Fit], (
    [Do enough people have the same problem to pay for it?],
    [Are you able to consistently sell?],
    [What minor changes can I make to sell more?],
  )),

  filter-card([Expanding Everything], (
    [How to build sales channels and marketing?],
    [How to scale production, operations, and distribution?],
    [How to set prices?],
  )),
  filter-card([Market Segments], (
    [How to add new market segments? (The bowling-alley model)],
  )),
  filter-card([Defending Position], (
    [How to grow at CAGR?],
    [How to avoid complacency?],
    [How to defend against large players?],
    [How not to be disrupted?],
    [How to create shareholder value?],
  )),
)

#speaker-note[
  - Great filters a startup has to pass, one after another. Earlier filters stay in force
  - Validation: is the problem worth solving, does the idea actually solve it, can you collect money?
  - Customer Discovery: will someone actually pay? Can they pay --- M.A.N. of money, authority, and need? What else do you need besides the product? Will the team fall apart?
  - Product--Market Fit: enough people with the same problem who will pay? Consistent sales? What minor changes would let you sell more?
  - Expanding Everything: sales channels and marketing; scale production, ops, distribution; how you set prices. A working product becomes an operating company
  - Market Segments: how do you add a new segment? Bowling-alley model --- knock down one pin, then the next adjacent one, not the whole lane at once
  - Defending Position: CAGR, complacency, large players, disruption, shareholder value
]
