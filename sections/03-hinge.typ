#import "@preview/touying:0.7.4": *
#import "/common.typ": gblock, lblock, accent

#let cmp-col(title, items, fill: luma(90), stroke: 0.5pt + luma(220)) = block(
  fill: white,
  stroke: stroke,
  radius: 0.4em,
  inset: (x: 0.75em, y: 0.65em),
  width: 100%,
  height: 100%,
)[
  #set align(top + left)
  #text(weight: "bold", size: 0.88em, fill: fill)[#title]
  #v(0.4em)
  #set text(size: 0.74em)
  #set list(marker: text(fill: fill)[•], spacing: 0.38em)
  #for it in items [ - #it ]
]

#let ai-card(label, body) = block(
  fill: white,
  stroke: 0.5pt + luma(220),
  radius: 0.4em,
  inset: (x: 0.7em, y: 0.55em),
  width: 100%,
  height: 100%,
)[
  #text(size: 0.68em, fill: luma(110), weight: "bold")[#label]
  #v(0.22em)
  #text(weight: "bold", size: 0.92em)[#body]
]

#let pill(name) = box(
  fill: luma(245),
  stroke: 0.5pt + luma(200),
  radius: 0.22em,
  inset: (x: 0.45em, y: 0.18em),
)[#text(size: 0.7em, weight: "bold")[#box[\+ #name]]]

#let vlabel(name) = align(center + horizon)[
  #rotate(-90deg, reflow: true)[
    #text(weight: "bold", size: 0.68em, fill: accent, tracking: 0.14em)[#name]
  ]
]

#let diagram-cols = (1.25cm, 1fr, 2.7cm, 1fr)

#let ai-use-diagram(footer: none) = {
  let main = grid(
    columns: diagram-cols,
    rows: (5.6em, 1.45em, 6.4em),
    column-gutter: 0.4em,
    row-gutter: 0.28em,
    align: horizon,
    vlabel[BUSINESS],
    ai-card[Problem][Which website users will buy?],
    align(center + horizon)[
      #stack(
        dir: ttb,
        spacing: 0.1em,
        text(size: 0.65em, fill: luma(100), weight: "bold")[Actioning],
        text(size: 1.35em, fill: luma(150))[→],
      )
    ],
    ai-card[Actionable Policy][Email coupons to specific users.],
    [],
    align(center)[#text(size: 0.68em, fill: luma(100), weight: "bold")[Modeling ↓]],
    [],
    align(center)[#text(size: 0.68em, fill: luma(100), weight: "bold")[↑ Actioning]],
    vlabel[COMPUTATIONAL],
    ai-card[Problem][Predict likelihood to buy from website traces.],
    align(center + horizon)[
      #stack(
        dir: ttb,
        spacing: 0.22em,
        pill[Time],
        pill[Money],
        pill[Data],
      )
    ],
    ai-card[AI Solution][Given data, predicts odds that user will buy.],
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

#speaker-note[
  - Load-bearing act: I just handed you frameworks; now do not get drunk on them
  - Hayek, then the disease, then how to put AI in without inventing a strategy from a data bug
]

== Knowledge we do not possess

#align(center + horizon)[
  #text(size: 4.2em, fill: accent)[“]
  #v(-1.35em)
  #block(width: 88%)[
    #set par(leading: 0.5em)
    #text(size: 1.45em)[_Civilization rests on the fact that we all benefit from knowledge which we do not possess._]
  ]
  #v(1.1em)
  #text(size: 0.9em, fill: luma(100), tracking: 0.14em)[--- FRIEDRICH HAYEK]
]

#speaker-note[
  - Hayek: civilization rests on knowledge we do not possess
  - You will not personally hold the market, the stack, or the customer's tacit knowledge
  - That is why Chesterton applies in someone else's firm, and why a model cannot invent the fence
  - This is the hinge after the frameworks: the knowledge is not in the room
]

== You may have MBA-student disease if

#grid(
  columns: (1fr, 1fr),
  gutter: 0.85em,
  rows: 1fr,
  cmp-col(
    [Symptoms],
    (
      […you believe that “business is business”, regardless of scale, geography, or sector.],
      […you make every decision using a framework, or by NPV/IRR.],
      […you immediately find a decision where domain experts are obviously wrong.],
      […you use words like synergy, disruption, and scalability without being specific.],
      […you prioritize quick wins and next-quarter finances over long-term success.],
      […you think IT, Security, and R&D are “overheads.”],
    ),
  ),
  cmp-col(
    [The Cure · Chesterton's Fence],
    (
      [Before changing something, be able to articulate why it was in the first place.],
      [Understand the specific details of your technology or market and the trade-offs it imposes on your business.],
      [Understand the specific needs of your customers and why they come to your product. Test this often.],
      [Document your understanding and decision-making and revisit it often. Things in retrospect look very different than in prospect.],
      [Recognize that, quite often, the most valuable assets in a company are intangible and difficult to measure.],
    ),
    fill: accent,
    stroke: 1.6pt + accent,
  ),
)

#speaker-note[
  - Crazy example: cattle futures usually settle in delivery, sometimes in cash
  - Hog futures are always cash-only. Why?
  - Chesterton's fence: do not tear something down until you can say why it was built
  - You cannot NPV a fence you do not understand
  - Aimed at this room: the tools I just gave you are how people get the disease
]

== How to use AI in business

#align(horizon, ai-use-diagram())

#speaker-note[
  - A business problem exists, phrased in a business way
  - Production: can we reduce the cost of this step with a new method?
  - Forecasting: which customers can be motivated to buy?
  - A NN only takes and returns math
  - Modeling turns the business question into math
  - Actioning turns the math into a policy someone will actually run
]

== How #text(fill: accent)[NOT] to use AI in business

#align(horizon, ai-use-diagram(footer: grid(
  columns: diagram-cols,
  column-gutter: 0.4em,
  align: horizon,
  [],
  warn-card[Garbage in, garbage out.][Website doesn't work in Chrome.],
  align(center, text(size: 1.35em, fill: luma(150))[→]),
  warn-card[Bad policy][Email coupons to non-Chrome users.],
)))

#speaker-note[
  - Garbage in, garbage out
  - If the website does not work in Chrome, the traces say Chrome users never buy
  - The model is "right"; the policy becomes: email coupons to non-Chrome users
  - That is a data bug dressed up as a strategy
]

== AI adoption

#grid(
  columns: (1fr, 1.2fr),
  gutter: 0.85em,
  align: top,
  lblock(inset: (x: 0.75em, y: 0.65em), outset: 0pt)[
    #text(weight: "bold", size: 1.02em)[Well-defined modeling and actioning]
    #v(0.4em)
    #set text(size: 0.82em)
    #set list(marker: text(fill: accent)[•], spacing: 0.42em)
    - Translate Business ↔ Math
    - Well-defined business question and action
    - Well-defined (and realistic) success metric.
    - Matches the available data.
  ],
  lblock(inset: (x: 0.75em, y: 0.65em), outset: 0pt)[
    #text(weight: "bold", size: 1.02em)[Institutional buy-in]
    #v(0.35em)
    #grid(
      columns: (1fr, 1fr),
      gutter: 0.65em,
      [
        #text(size: 0.7em, fill: luma(100), weight: "bold", tracking: 0.06em)[Measure ROI]
        #v(0.2em)
        #set text(size: 0.74em)
        #set list(marker: text(fill: accent)[•], spacing: 0.32em)
        - Buy-in from management
        - Link to business KPI
        - Data and model as business assets
        - Funding to maintaining data pipeline
      ],
      [
        #text(size: 0.7em, fill: luma(100), weight: "bold", tracking: 0.06em)[Buy-in from users]
        #v(0.2em)
        #set text(size: 0.74em)
        #set list(marker: text(fill: accent)[•], spacing: 0.32em)
        - User-friendliness
        - Explainability of model output
        - Carefully choose which decisions to make, and which to leave to users
        - Regulations (privacy and security)
      ],
    )
  ],
)

#speaker-note[
  - Two requirements: well-defined modeling and actioning, and institutional buy-in
  - Buy-in from management *and* from users
  - A clever model with no KPI, no pipeline funding, and no one who will act on it is a science project
]

== AI adoption — plumbing

#grid(
  columns: (1.15fr, 1fr),
  gutter: 0.85em,
  align: top,
  lblock(inset: (x: 0.75em, y: 0.7em), outset: 0pt)[
    #text(weight: "bold", size: 1.05em)[Data pipeline]
    #v(0.4em)
    #set text(size: 0.86em)
    #set list(marker: text(fill: accent)[•], spacing: 0.48em)
    - Access to good quality and sufficient data.
    - Continuously collect data in the normal course of business.
    - Model drift: models degrade in quality over time as the world slowly changes.
  ],
  lblock(inset: (x: 0.75em, y: 0.7em), outset: 0pt)[
    #text(weight: "bold", size: 1.05em)[Infrastructure]
    #v(0.4em)
    #set text(size: 0.86em)
    #set list(marker: text(fill: accent)[•], spacing: 0.48em)
    - Data cleaning
    - Warehousing
    - Sunsetting
    - Compliance
  ],
)

#v(0.7em)

#gblock(inset: (x: 0.8em, y: 0.55em), outset: 0pt)[
  Models drift as the world changes --- they are *not* an install-once asset.
]

#speaker-note[
  - Adoption also fails on plumbing
  - Enough good data, collected in the normal course of business
  - Plus cleaning, warehousing, sunsetting, and compliance
  - Models drift as the world changes --- not an install-once asset
]
