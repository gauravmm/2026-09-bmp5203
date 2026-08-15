#import "@preview/touying:0.7.4": *
#import "@preview/cetz:0.3.4": canvas, draw
#import "/common.typ": accent, gblock, lblock, section-quote

= Case studies

#section-quote[Success is a lousy teacher. It seduces smart people into thinking they can't lose.][Bill Gates]

#speaker-note[
  - Short break in the argument
  - The rest of this part is case studies --- mostly failures, because those teach more than the wins
  - Bill Gates: success is a lousy teacher. It seduces smart people into thinking they can't lose.
  - We are going to look at failures on purpose.
]

== Case Study: Juicero

#grid(
  columns: (auto, 1.25fr),
  gutter: 1.3em,
  align: horizon,
  block(radius: 0.4em, clip: true)[
    #image("/media/juicero.jpg", height: 100%)
  ],
  [
    #text(size: 1.9em, weight: "bold")[Juicero]
    #v(0.5em)

    #set list(spacing: 0.9em)
    - Machine that presses pre-made juices out of mylar packaging.
    - Sold machine for US\$400, juice pack for \$5--7.
    - DRM on juice pack so it would only squeeze original packs within their best-before date. #pause
    - Fails the *idea* filters.
  ],
)

#speaker-note[
  - A US\$400 machine that squeezed pre-packed juice bags sold for \$5--7, plus DRM so it would only press original packs before their best-before date.
  - The product is the joke; the raise is the lesson.
]

// Full-bleed slide: no margins, no header, no footer. The config is merged into
// this slide's own `self`, so it dies with the slide instead of leaking into the
// rest of the deck — which is also why it is a `#slide` call and not a `==`
// heading.
#let bleed-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(self, config-page(margin: 0em, header: none, footer: none))
  touying-slide(self: self, body)
})


== Case Study: Juicero

#place(top + left, dx: -30mm, dy: -6mm)[
  #image("/media/juicero-guardian.png", width: 120%, height: 120%, fit: "cover")
]

#place(bottom + right, dx: 1em, dy: -1em)[
  #text(size: 1.9em, weight: "bold")[How did they\ raise \$120M?]
]



#speaker-note[
  - They raised \$120 million.
  - The Guardian: a widely mocked startup shutting down after 16 months.
  - TechCrunch: Juicero may be the absurd avatar of Silicon Valley hubris, but boy is it well-engineered.
  - Next: what were investors actually looking for?
]

== What do investors look for?

// Many limited partners fund one fund; that fund backs many startups. The
// greyed-out "Investment Fund" rows are the competing funds we are not following.
#let lps = (
  [Institutional investors],
  [Pension funds],
  [Insurance companies],
  [University endowments],
  [Sovereign wealth funds],
  [Family offices],
  [High-net-worth individuals],
)

#let money-flow = canvas({
  import draw: *

  let s = 0.95 // row spacing
  let y(i) = (3 - i) * s
  let thin = (paint: accent, thickness: 0.9pt)
  let head = (end: ">", fill: accent, scale: 0.5)
  // Fans converge on / radiate from a single point; the lines stop short of it
  // (t) so seven arrowheads do not land on top of each other.
  let t = 0.86
  let lerp(a, b, f) = a + (b - a) * f
  let fan-in = (9.4, 0)
  let fan-out = (14.4, 0)

  for (i, name) in lps.enumerate() {
    content((6.9, y(i)), anchor: "east", text(size: 1em)[#name])
    line(
      (7.15, y(i)),
      (lerp(7.15, fan-in.at(0), t), lerp(y(i), 0, t)),
      stroke: thin,
      mark: head,
    )

    // the fund we follow is the middle one; the rest are its competitors
    let live = i == 3
    content((11.9, y(i)), text(
      size: 1em,
      fill: if live { black } else { luma(185) },
    )[Investment Fund])

    line(
      (lerp(fan-out.at(0), 16.4, 1 - t), lerp(0, y(i), 1 - t)),
      (16.4, y(i)),
      stroke: thin,
      mark: head,
    )
    content((16.65, y(i)), anchor: "west", text(size: 1em)[Startup])
  }

  // Money out, money back: principal flows right, returns flow left.
  let fat = (paint: accent, thickness: 7pt)
  let fat-head = (end: ">", fill: accent, scale: 0.9)
  content((6.9, -4.0), anchor: "east", text(size: 1em, weight: "bold")[Principal])
  line((7.15, -4.0), (16.3, -4.0), stroke: fat, mark: fat-head)
  line((16.3, -4.75), (7.15, -4.75), stroke: fat, mark: fat-head)
  content((16.55, -4.75), anchor: "west", text(size: 1em, weight: "bold")[Return])
})

#align(horizon)[
  #grid(
    columns: (auto, 1fr),
    column-gutter: 0.9em,
    align: horizon,
    money-flow,
    // uncover, not #pause: inside a grid cell the space has to stay reserved or
    // the diagram jumps sideways on the second subslide
    uncover("2-", gblock(inset: 0.7em, outset: 0pt)[
      Investors raise an *investment fund* from their customers and have *5--7 years* to return the principal plus interest.
    ]),
  )
]

#speaker-note[
  - Investors raise principal from limited partners --- pension funds, insurers, endowments, sovereign wealth, family offices, high-net-worth individuals --- and are beholden to them.
  - They compete with other funds to invest in startups, then use those returns to pay principal plus interest back to the LPs in a 5--7 year window.
]

== What do investors look for?


#set text(size: 1.15em)
#set list(spacing: 0.75em)

- Investors are under *constant pressure* to choose.
  - 5--7 years to make a sufficient return.
  - Competing with other investment funds for money and startups.
- Investors optimise for what the *next* investor is looking for
  - not eventual market success.
  - *Prone to fads.*
- They are only interested in high-risk, high-returns.
  - Rule of thumb: 100 → 10 break-even → 1 makes 100× return.

#speaker-note[
  - They exit by selling to the next investor inside their window --- so they optimise for what the next investor wants, not for eventual market success.
  - That makes them prone to fads. Juicero was a well-engineered object in a fashionable category.
  - Rule of thumb: 100 deals, 10 break even, 1 returns 100×. They only want high-risk, high-return.
  - Do not tour reducible vs irreducible uncertainty. One line if asked: a stable 4% bubble-tea stall loses to a 2% shot at 200×.
]
