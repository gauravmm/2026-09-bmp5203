#import "@preview/touying:0.7.4": *
#import "/common.typ": accent, gblock, lblock, section-quote



#let ai-card(label, body) = block(
  fill: white,
  stroke: 0.5pt + luma(220),
  radius: 0.4em,
  inset: (x: 0.7em, y: 0.55em),
  width: 100%,
  height: 100%,
)[
  #text(size: 0.86em, fill: luma(110), weight: "bold")[#label]
  #v(-0.5em)
  #text(size: 1em)[#body]
]

#let pill(name) = box(
  fill: luma(245),
  stroke: 0.5pt + luma(200),
  radius: 0.22em,
  inset: (x: 0.45em, y: 0.18em),
)[#text(size: 0.7em, weight: "bold")[#box[\+ #name]]]

// Dashed region enclosing one layer of the diagram. Its name sits inside the
// box, on the edge that faces away from the other layer.
#let region(name, tag-align, color, body) = block(
  width: 100%,
  stroke: (paint: color, thickness: 1pt, dash: "dashed"),
  radius: 0.35em,
  inset: (x: 0.6em, y: 0.5em),
)[
  #let tag = text(size: 0.62em, weight: "bold", fill: color, tracking: 0.1em)[#name]
  #stack(dir: ttb, spacing: 0.45em, ..if tag-align == top { (tag, body) } else { (body, tag) })
]

#let comp-color = rgb("#7B5EA7")
#let diagram-cols = (1fr, 0.8fr, 1fr)

#let ai-use-diagram(footer: none) = {
  let row(left-card, mid, right-card) = grid(
    columns: diagram-cols,
    rows: 4.2em,
    column-gutter: 0.5em,
    align: horizon,
    left-card,
    mid,
    right-card,
  )
  let arrow(sym) = text(size: 1.6em, fill: luma(150))[#sym]
  let step(name) = text(size: 0.78em, fill: luma(90), weight: "bold")[#name]

  let main = stack(
    dir: ttb,
    spacing: 0.35em,
    region([Business], top, accent, row(
      ai-card[Problem][Which website users will buy?],
      [],
      ai-card[Actionable Policy][Email coupons to specific users.],
    )),
    // The two crossings between the layers: down into math, back up into a policy.
    // same tracks as the card rows, so each label centres under its own card
    grid(
      columns: diagram-cols,
      column-gutter: 0.5em,
      align: horizon,
      align(center)[#arrow[↘] #step[Modeling]],
      [],
      align(center)[#arrow[↗] #step[Actioning]],
    ),
    // ponytail: the computational cards sit inset from the business ones above,
    // so the two layers read as nested rather than stacked
    region([Computational], bottom, comp-color, pad(x: 2.6em, row(
      ai-card[Problem][Predict likelihood to buy from  traces.],
      align(center + horizon)[
        #stack(
          dir: ttb,
          spacing: 0.22em,
          arrow[→],
          pill[Time],
          pill[Money],
          pill[Data],
        )
      ],
      ai-card[AI Solution][Given data, predicts odds that user will buy.],
    ))),
  )
  if footer == none {
    main
  } else {
    grid(
      rows: (auto, auto),
      row-gutter: 0.5em,
      main,
      footer,
    )
  }
}

#let warn-card(label, body) = block(
  fill: rgb("#F6E4D8"),
  stroke: 0.6pt + accent.lighten(30%),
  radius: 0.35em,
  inset: (x: 0.7em, y: 0.45em),
  width: 100%,
)[
  #text(size: 0.7em, weight: "bold", fill: accent)[#label]
  #v(0.12em)
  #text(size: 0.9em)[#body]
]

= The hinge

#section-quote[Civilization rests on the fact that we all benefit from knowledge which we do not possess.][Friedrich Hayek]

#speaker-note[
  - Load-bearing act: I just handed you frameworks; now do not get drunk on them
  - Hayek: civilization rests on knowledge we do not possess
  - You will not personally hold the market, the stack, or the customer's tacit knowledge
  - That is why Chesterton applies in someone else's firm, and why a model cannot invent the fence
  - This is the hinge after the frameworks: the knowledge is not in the room
  - Then the disease, then how to put AI in without inventing a strategy from a data bug
]

== MBA-student disease

#text(size: 1.9em, weight: "bold")[You may have MBA-student disease if...]
#v(-0.5em)

#grid(
  columns: (1fr, 1fr),
  gutter: 0.85em,
  rows: 1fr,
  align: top,
  [
    // the ellipsis is the list marker, so wrapped lines hang under the "you"
    #set list(marker: […], indent: 0em, body-indent: 0em, spacing: .8em)
    - you believe that "business is business", regardless of scale, geography, or sector.
    - you make every decision using a framework, or by NPV/IRR.
    - you immediately find a decision where domain experts are obviously wrong.
    - you use words like synergy, disruption, and scalability without being specific.
    - you prioritize quick wins and next-quarter finances over long-term success.
    - you think IT, Security, and R&D are "overheads."
    #pause
  ],
  block(
    fill: white,
    stroke: 0.5pt + luma(220),
    radius: 0.4em,
    inset: (x: 0.75em, y: 0em),
    outset: (x: 0em, y: 0.65em),
  )[
    #set align(top + left)
    #text(weight: "bold", size: 0.88em, fill: accent)[The Cure]
    #v(0.4em)
    #set text(size: 0.86em)
    #set list(spacing: 1em)

    - Before changing something, articulate why it was in the first place.
    - Understand your technology or market and the trade-offs it imposes on your business.
    - Understand the your customers and why they come to your product. Test this often.
    - Document and revisit your decision-making. Things look very different in retrospect.
    - The most valuable assets in a company are usually intangible and difficult to measure.
  ],
)



#speaker-note[
  - Crazy example: cattle futures usually settle in delivery, sometimes in cash
  - Hog futures are always cash-only. Why?
  - Chesterton's fence: do not tear something down until you can say why it was built
  - You cannot NPV a fence you do not understand
  - Aimed at this room: the tools I just gave you are how people get the disease
]

== How to use AI in business

// uncover, not #pause: the footer's space stays reserved so the diagram above it
// does not shift when the cards land
#align(horizon, ai-use-diagram(footer: uncover("2-", grid(
  columns: diagram-cols,
  column-gutter: 0.5em,
  align: horizon,
  warn-card[Garbage in, garbage out.][Website doesn't work in Chrome.],
  align(center, text(size: 1.35em, fill: luma(150))[→]),
  warn-card[Bad policy][Email coupons to non-Chrome users.],
))))

#speaker-note[
  - A business problem exists, phrased in a business way
  - Production: can we reduce the cost of this step with a new method?
  - Forecasting: which customers can be motivated to buy?
  - A NN only takes and returns math
  - Modeling turns the business question into math
  - Actioning turns the math into a policy someone will actually run
]

== AI adoption

// ponytail: a full-height block pins the body to the top of the slide without a
// `set align`, which would leak into every slide after this one
#grid(
  columns: (1fr, 1.2fr),
  column-gutter: 1.2em,
  align: top,
  [
    *Well-defined modeling and actioning*
    - Translate Business ↔ Math
    - Well-defined business question and action
    - Well-defined success metric.
      - Realistic limits
    - Matches the available data.
  ],
  [
    *Institutional buy-in*
    - Measure ROI:
      - buy-in from management,
      - link to a business KPI,
      - data and model as business assets,
      - funding to maintain the data pipeline.
    - Buy-in from users:
      - user-friendliness,
      - explainability of model output,
      - care over which decisions to make and which to leave to users.
    - Regulations (privacy and security).
  ],
)
#v(1fr)

#speaker-note[
  - Two requirements: well-defined modeling and actioning, and institutional buy-in
  - Buy-in from management *and* from users
  - A clever model with no KPI, no pipeline funding, and no one who will act on it is a science project
]

== AI adoption — plumbing

#grid(
  columns: (1.15fr, 1fr),
  column-gutter: 1.2em,
  align: top,
  [
    *Data pipeline*
    - Access to good quality and sufficient data.
    - Continuously collect data in the normal course of business.
    - Model drift: models degrade in quality over time as the world slowly changes.
  ],
  [
    *Infrastructure*
    - Data cleaning
    - Warehousing
    - Sunsetting
    - Compliance
  ],
)

#v(0.4em)
#pause
#gblock(inset: (x: 0.8em, y: 0.55em), outset: 0pt)[
  Models drift as the world changes --- they are *not* an install-once asset.
]
#v(1fr)

#speaker-note[
  - Adoption also fails on plumbing
  - Enough good data, collected in the normal course of business
  - Plus cleaning, warehousing, sunsetting, and compliance
  - Models drift as the world changes --- not an install-once asset
]
