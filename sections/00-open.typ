#import "@preview/touying:0.7.4": *
#import "/common.typ": lblock

== About Me <touying:hidden>

#grid(
  columns: (1fr, 2fr),
  gutter: 2em,
  align(center + horizon)[
    #block(radius: 0.5em, clip: true)[
      #image("00-open/portrait.jpg", width: 100%, height: 120mm)
    ]
  ],
  align(horizon)[
    #text(weight: "bold", size: 12mm)[Dr. Gaurav Manek]
    #v(0.3em)
    - *PhD* in AI/ML --- Carnegie Mellon University
    #v(0.1em)
    - Founder, *Ocellivision* \@ A\*STAR
    #v(0.1em)
    - Founder, *Visigoth.ai* (SaaS)
    #v(0.1em)
    - Research Scientist, IMCB, A\*STAR
    #v(1em)

    #text(size: 0.85em, fill: luma(100))[
      Opinions here are my own, not my employers'

      For consulting: #link("mailto:gaurav@gauravmanek.com")[gaurav\@gauravmanek.com]
    ]
  ],
)

#speaker-note[
  - BMP5203 guest lecture, not a founding course
  - I have started companies and I work on AI products
  - Opinions mine
]

== Agenda <touying:hidden>

#grid(
  columns: (1fr, 1fr),
  gutter: 1.4em,
  [
    + *How firms fail* \
      #text(size: 0.85em, fill: luma(80))[Stages · great filters]

    + *Case studies* \
      #text(size: 0.85em, fill: luma(80))[Juicero · WebVan · what investors buy]

    + *The hinge* \
      #text(size: 0.85em, fill: luma(80))[MBA-student disease · Chesterton's Fence]

    4. *How to use AI* \
      #text(size: 0.85em, fill: luma(80))[Model · action · agents]

    5. *Dangers* \
      #text(size: 0.85em, fill: luma(80))[Moat · platform · subsidy · Jevons]

  ],
  [
    #lblock(inset: (x: 0.8em, y: 0.7em), outset: 0pt)[
      I will give you tools. \
      The tools are how people get \
      *MBA-student disease.*
    ]
  ],
)

#speaker-note[
  - Two-act shape: judgement toolkit, then don't get drunk on it
  - AI is a very fast way to act on a misunderstood fence
  - 90 minutes, talk not workshop
]
