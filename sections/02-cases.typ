#import "@preview/touying:0.7.4": *
#import "/common.typ": gblock, lblock, accent

= Case studies

#speaker-note[
  - Short break in the argument
  - The rest of this part is case studies --- mostly failures, because those teach more than the wins
]

== Looking at failure

#align(center + horizon)[
  #text(size: 4.6em, fill: accent.transparentize(45%), weight: "bold")[“]
  #v(-1.15em)
  #block(width: 86%)[
    #set par(leading: 0.48em)
    #text(size: 1.55em, style: "italic")[
      Success is a lousy teacher. \
      It seduces smart people into thinking they can't lose.
    ]
  ]
  #v(0.75em)
  #text(size: 1.05em, fill: luma(90))[--- Bill Gates]
]

#speaker-note[
  - Bill Gates: success is a lousy teacher. It seduces smart people into thinking they can't lose.
  - We are going to look at failures on purpose.
]

== Filter: Idea

#grid(
  columns: 1fr,
  rows: (1fr, 1fr, 1fr, 1fr),
  row-gutter: 0.5em,
  ..(
    ([1], [Is the problem worth solving?]),
    ([2], [Does your idea solve the problem?]),
    ([3], [Can you collect money for solving the problem?]),
    ([4], [Can you raise funds?]),
  ).map(((n, q)) => lblock(inset: 0.7em, outset: 0pt)[
    #grid(
      columns: (1.7em, 1fr),
      column-gutter: 0.55em,
      align: horizon,
      text(fill: accent, weight: "bold", size: 1.35em)[#n],
      text(size: 1.15em)[#q],
    )
  ]),
)

#speaker-note[
  - Four questions at the Idea filter. Walk through them slowly; the Juicero case hangs on these.
  - Is the problem worth solving, does the idea solve it, can you collect money for solving it, and can you raise funds?
]

== Juicero

#grid(
  columns: (0.9fr, 1.25fr),
  gutter: 1.3em,
  align: horizon,
  block(radius: 0.4em, clip: true, width: 100%)[
    #image("/media/juicero.jpg", width: 100%)
  ],
  [
    #set list(marker: text(fill: accent)[•], spacing: 0.9em)
    - Machine that presses pre-made juices out of mylar packaging.
    - Sold machine for US\$400, juice pack for \$5--7.
    - DRM on juice pack so it would only squeeze original packs within their best-before date.
  ],
)

#speaker-note[
  - A US\$400 machine that squeezed pre-packed juice bags sold for \$5--7, plus DRM so it would only press original packs before their best-before date.
  - The product is the joke; the raise is the lesson.
]

== How did they raise \$120M?

#grid(
  columns: (1fr, 1fr),
  gutter: 0.8em,
  align: top,
  block(stroke: 0.5pt + luma(200), radius: 0.25em, clip: true, width: 100%)[
    #image("/media/juicero-guardian.png", width: 100%)
  ],
  block(stroke: 0.5pt + luma(200), radius: 0.25em, clip: true, width: 100%)[
    #image("/media/juicero-techcrunch.png", width: 100%)
  ],
)

#speaker-note[
  - They raised \$120 million.
  - The Guardian: a widely mocked startup shutting down after 16 months.
  - TechCrunch: Juicero may be the absurd avatar of Silicon Valley hubris, but boy is it well-engineered.
  - Next: what were investors actually looking for?
]

== What do investors look for?

#let flow-card(body) = block(
  fill: white,
  stroke: 0.5pt + luma(220),
  inset: 0.7em,
  radius: 0.4em,
  width: 100%,
  height: 100%,
)[#body]

#align(horizon)[
  #grid(
    columns: (1.45fr, auto, 1fr, auto, 0.9fr),
    rows: 7.2cm,
    column-gutter: 0.45em,
    align: horizon,
    flow-card[
      #text(weight: "bold")[Institutional investors]
      #v(0.35em)
      #set text(size: 0.82em)
      #set list(marker: text(fill: accent)[•], spacing: 0.32em)
      - Pension funds
      - Insurance companies
      - University endowments
      - Sovereign wealth funds
      - Family offices
      - High-net-worth individuals
    ],
    text(size: 1.7em, fill: accent)[→],
    flow-card[#align(center + horizon)[#text(weight: "bold")[Investment fund]]],
    text(size: 1.7em, fill: accent)[→],
    flow-card[#align(center + horizon)[#text(weight: "bold")[Startup]]],
  )

  #v(0.75em)
  #gblock(inset: 0.7em, outset: 0pt)[
    Investors raise an investment fund from their customers and have *5--7 years* to return the principal plus interest.
  ]
]

#speaker-note[
  - Investors raise principal from limited partners --- pension funds, insurers, endowments, sovereign wealth, family offices, high-net-worth individuals --- and are beholden to them.
  - They compete with other funds to invest in startups, then use those returns to pay principal plus interest back to the LPs in a 5--7 year window.
]

== What do investors look for?

#let inv-card(title, items) = block(
  fill: white,
  stroke: 0.5pt + luma(220),
  inset: 0.75em,
  radius: 0.4em,
  width: 100%,
  height: 100%,
)[
  #text(weight: "bold")[#title]
  #v(0.4em)
  #set text(size: 0.88em)
  #set list(marker: text(fill: accent)[•], spacing: 0.4em)
  #for it in items [ - #it ]
]

#align(horizon)[
  #grid(
    columns: (1fr, 1fr, 1fr),
    rows: 6.6cm,
    gutter: 0.7em,
    inv-card([Pressure], (
      [5--7 years to return the fund],
      [Competing with other funds for money and for startups],
    )),
    inv-card([Next-investor optimisation], (
      [They exit by selling to the *next* investor],
      [So they optimise for that buyer, not the market],
      [Prone to fads],
    )),
    inv-card([100 → 10 → 1], (
      [100 deals],
      [10 break even],
      [1 returns 100×],
    )),
  )

  #v(0.7em)
  #gblock(inset: 0.65em, outset: 0pt)[
    High-risk, high-return. A raise is not a business.
  ]
]

#speaker-note[
  - They exit by selling to the next investor inside their window --- so they optimise for what the next investor wants, not for eventual market success.
  - That makes them prone to fads. Juicero was a well-engineered object in a fashionable category.
  - Rule of thumb: 100 deals, 10 break even, 1 returns 100×. They only want high-risk, high-return.
  - Do not tour reducible vs irreducible uncertainty. One line if asked: a stable 4% bubble-tea stall loses to a 2% shot at 200×.
]

== Filter: Customer Discovery

#grid(
  columns: 1fr,
  rows: (1fr, 1fr, 1fr, 1fr),
  row-gutter: 0.5em,
  ..(
    ([1], [Will someone actually pay?]),
    ([2], [Can someone pay for it?]),
    ([3], [Other than the product, what do you need?]),
    ([4], [Will your team fall apart?]),
  ).map(((n, q)) => lblock(inset: 0.7em, outset: 0pt)[
    #grid(
      columns: (1.7em, 1fr),
      column-gutter: 0.55em,
      align: horizon,
      text(fill: accent, weight: "bold", size: 1.35em)[#n],
      text(size: 1.15em)[#q],
    )
  ]),
)

#speaker-note[
  - Same four Customer Discovery questions we saw in the filters.
  - Will someone actually pay, can they pay, what else do you need besides the product, and will the team fall apart?
  - We will run WebVan through them. Do not expand M.A.N. here.
]

== WebVan

#grid(
  columns: (1.15fr, 1fr),
  gutter: 1.1em,
  align: horizon,
  block(stroke: 0.5pt + luma(200), radius: 0.25em, clip: true, width: 100%)[
    #image("/media/webvan.gif", width: 100%)
  ],
  [
    #set list(marker: text(fill: accent)[•], spacing: 0.75em)
    - Original grocery delivery website in 1999. One of the most famous busts of the 2001 dotcom bubble.
    - Raised \$396M from VCs and \$375M in an IPO.

    #v(0.7em)
    #gblock(inset: 0.7em, outset: 0pt)[
      #align(center)[_Why did they go bankrupt?_]
    ]
  ],
)

#speaker-note[
  - Poor customer discovery --- people had a ritual of going to buy groceries, and no trust or culture for ordering food online.
  - Poor investment --- a giant robotic warehouse whose capex was too high for the cost savings.
  - Poor burn-rate management --- losing \$2M a day at the peak.
  - Grocery is a tiny-margin business, and you need that.
]
