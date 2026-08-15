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
    // one entry per `=` heading, in deck order
    #set enum(spacing: 0.7em)
    #let sub(body) = text(size: 0.85em, fill: luma(80))[#body]

    + *From idea to exit* \
      #sub[Stages · funding · rounds · equity]

    + *What do investors look for?* \
      #sub[where the money comes from]

    + *How firms fail* \
      #sub[The great filters]

    + *The hinge* \
      #sub[MBA-student disease · how to use AI in business]

    + *What is an agent* \
      #sub[Tokens · billing · agents using agents]

    + *Agents in the wild* \
      #sub[Copilot · Klarna · Replit · theory of mind]

    + *Dangers* \
      #sub[Moat · platform · subsidy · Jevons]
  ],
  align(horizon)[
    #lblock(inset: (x: 0.9em, y: 0.8em), outset: 0pt)[
      *90 minutes.* Interrupt me --- questions are better than my notes.

      #v(0.5em)
      #text(size: 0.85em, fill: luma(80))[
        Slides and reading list are on the last slide, or at
        #link("https://gauravmanek.com/lectures")[gauravmanek.com/lectures].
      ]
    ]
  ],
)

#speaker-note[
  - Two-act shape: judgement toolkit, then don't get drunk on it
  - AI is a very fast way to act on a misunderstood fence
  - 90 minutes, talk not workshop
]
