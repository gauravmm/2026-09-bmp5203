#import "@preview/touying:0.7.4": *
#import "/common.typ": accent, filter-card, gblock, hbar, lblock, section-quote

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

#let band(fill, stroke: 0.55pt + luma(190)) = box(
  width: 100%,
  height: 2.2em,
  fill: fill,
  radius: 0.16em,
  stroke: stroke,
)

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

#grid(
  columns: (1fr, auto, 1fr),
  column-gutter: 0.7em,
  align: horizon,
  [
    #hbar([1 year], 20)
    #v(0.55em)
    #hbar([3 years], 39)
    #v(0.55em)
    #hbar([5 years], 50)
    #v(0.55em)
    #hbar([10 years], 65)
  ],
  align(center)[
    #text(size: 0.72em, fill: accent, weight: "bold", tracking: 0.06em)[BECAUSE]
  ],
  [
    #hbar([Financial Issues], 38)
    #v(0.45em)
    #hbar([Lack of Market Need], 35)
    #v(0.45em)
    #hbar([Competition], 20)
    #v(0.45em)
    #hbar([Business Model], 19)
    #v(0.45em)
    #hbar([Legal Challenges], 18)
  ],
)

#v(0.85em)
#text(size: 0.62em, fill: luma(110))[
  Numbers from the US. See
  #link("https://www.forbes.com/advisor/business/software/startups-failure-rate/")[forbes.com/advisor/business/software/startups-failure-rate/].
]

#speaker-note[
  - As a startup you are always teetering between life and death
  - US numbers: one in five gone in a year, half by year five, two-thirds by year ten
  - Failure is the default, and these are the usual reasons
]

== Startups tend to fail

#block(width: 78%)[
  #hbar([Financial Issues], 38)
  #v(0.45em)
  #hbar([Lack of Market Need], 35)
  #v(0.45em)
  #hbar([Competition], 20)
  #v(0.45em)
  #hbar([Business Model], 19)
  #v(0.45em)
  #hbar([Legal Challenges], 18)
]

#v(0.95em)
#pause
#gblock[
  #text(size: 1.15em)[_How do we de-risk these?_]
]

#v(0.7em)
#text(size: 0.62em, fill: luma(110))[
  Numbers from the US. See
  #link("https://www.forbes.com/advisor/business/software/startups-failure-rate/")[forbes.com/advisor/business/software/startups-failure-rate/].
]

#speaker-note[
  - Always teetering between life and death
  - Survival is predicated on assessing risks and carefully managing them
  - This whole lecture is the toolkit to assess and de-risk these failure modes
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

== Stages --- common frameworks

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 0.9em,
  lblock(inset: (x: 0.75em, y: 0.95em), outset: 0pt)[
    #text(size: 0.72em, fill: luma(100))[Howard Love]
    #v(0.4em)
    #text(weight: "bold", size: 1.12em)[Startup J-Curve]
    #v(0.4em)
    #text(size: 0.82em, fill: luma(60))[The Six Steps to Entrepreneurial Success]
  ],
  lblock(inset: (x: 0.75em, y: 0.95em), outset: 0pt)[
    #text(size: 0.72em, fill: luma(100))[Max Marmer]
    #v(0.4em)
    #text(weight: "bold", size: 1.12em)[Startup Genome]
    #v(0.4em)
    #text(size: 0.82em, fill: luma(60))[Introducing the Startup Genome Project]
  ],
  lblock(inset: (x: 0.75em, y: 0.95em), outset: 0pt)[
    #text(size: 0.72em, fill: luma(100))[Jason Hishmeh \& Stas Chernychko]
    #v(0.4em)
    #text(weight: "bold", size: 1.12em)[6 Startup Stages]
    #v(0.4em)
    #text(size: 0.82em, fill: luma(60))[How non-technical founders build profitable, scalable startups]
  ],
)

#speaker-note[
  - Common frameworks. They disagree on names and how many boxes to draw
  - They all describe a similar journey from idea to a stable company
]

== Which stages you see

#align(horizon)[
  #text(size: 0.7em, fill: luma(100), tracking: 0.06em)[HOW BIG IS THE FIRM?]

  #v(0.55em)
  #grid(
    columns: (13.6em, 1fr, 1fr, 1fr, 1fr, 1fr),
    column-gutter: 0.32em,
    row-gutter: 0.58em,
    align: horizon,
    [],
    ..("1–5", "3–15", "15–50", "50–100", "100–1000").map(s => align(
      center,
      text(size: 0.78em, weight: "bold")[#s],
    )),

    text(size: 0.82em)[As a founder.],
    grid.cell(colspan: 5, band(rgb("#e8d9c8"))),

    text(size: 0.82em)[As a consultant.],
    [],
    grid.cell(colspan: 3, band(accent.transparentize(68%))),
    [],

    text(size: 0.82em)[As a founding employee (with equity).],
    [],
    grid.cell(colspan: 2, band(accent.transparentize(82%), stroke: 0.8pt + accent)),
    [],
    [],

    text(size: 0.82em)[As an employee.],
    [],
    [],
    [],
    grid.cell(colspan: 2, band(luma(228))),
  )
]

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
