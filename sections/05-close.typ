#import "@preview/touying:0.7.4": *
#import "@preview/tiaoma:0.3.0": qrcode
#import "/common.typ": gblock, lblock, accent

= Dangers

#speaker-note[
  - Last act. Specific dangers of AI and SaaS — then the short version
  - Four we will walk: no moat, platform risk, unexpected behaviour, model subsidy
  - And many, many more
]

== Specific dangers

#grid(
  rows: (1fr, auto),
  row-gutter: 0.7em,
  grid(
    columns: (1fr, 1fr),
    rows: (1fr, 1fr),
    gutter: 0.75em,
    lblock(inset: 0.9em, outset: 0pt)[
      #align(horizon)[
        #text(weight: "bold", size: 1.25em)[Moat]
        #v(0.35em)
        #text(size: 0.88em)[Can they clone you tomorrow?]
      ]
    ],
    lblock(inset: 0.9em, outset: 0pt)[
      #align(horizon)[
        #text(weight: "bold", size: 1.25em)[Platform risk]
        #v(0.35em)
        #text(size: 0.88em)[They own the floor you stand on.]
      ]
    ],
    lblock(inset: 0.9em, outset: 0pt)[
      #align(horizon)[
        #text(weight: "bold", size: 1.25em)[Unexpected behaviour]
        #v(0.35em)
        #text(size: 0.88em)[Agents are fallible. Treat them as such.]
      ]
    ],
    lblock(inset: 0.9em, outset: 0pt)[
      #align(horizon)[
        #text(weight: "bold", size: 1.25em)[AI model subsidy]
        #v(0.35em)
        #text(size: 0.88em)[Today's price is not the cost.]
      ]
    ],
  ),
  align(center)[
    #text(size: 1.05em, fill: luma(90))[…and many, many more.]
  ],
)

#speaker-note[
  - Very short summary. Four dangers, then we walk three of them
  - Unexpected behaviour was Replit / Chevy — do not re-litigate
  - The list is not exhaustive
]

== No defensible moat

#grid(
  columns: (1.05fr, 0.95fr),
  gutter: 1em,
  align: top,
  [
    Protect the firm from being cloned or cannibalised.

    #v(0.35em)
    #set list(marker: text(fill: accent)[•], spacing: 0.55em)
    - Innovation
    - IP — patents or secrets
    - Network effects
    - Trust and compliance

    #v(0.7em)
    #text(size: 0.88em, fill: luma(80))[
      Without one: ecosystem cannibalisation, cloning, being outpaced.
    ]
  ],
  [
    #block(radius: 0.3em, clip: true, width: 100%)[
      #image("/media/docusign-lovable.png", width: 100%, height: 10.4cm, fit: "cover")
    ]
    #v(0.35em)
    #align(center)[_What's their moat?_]
  ],
)

#speaker-note[
  - Easy to ship with no moat, especially with vibe-coding tools
  - DocuSign: trust + certifications + some network effects
  - Compliance is not that hard; the certification is costly
  - Spryngtime was built in two days on Lovable. What's their moat?
]

== Platform risk

#align(horizon)[
  Vendors sell a differentiated service. Relying on those differentiations is lock-in.

  #v(0.35em)
  Once locked in, they set *price*, *strategy*, *technology*, and *uptime*.

  #v(0.85em)
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 0.7em,
    lblock(inset: 0.75em, outset: 0pt)[
      #text(weight: "bold")[X API, 2023]
      #v(0.3em)
      #text(size: 0.82em)[Access restricted. Social-analytics and bot startups vanished overnight.]
    ],
    lblock(inset: 0.75em, outset: 0pt)[
      #text(weight: "bold")[ChatGPT vs Jasper]
      #v(0.3em)
      #text(size: 0.82em)[Free ChatGPT undercut Jasper's automated marketing tools.]
    ],
    lblock(inset: 0.75em, outset: 0pt)[
      #text(weight: "bold")[Google Maps, 2018]
      #v(0.3em)
      #text(size: 0.82em)[API price hike hit fitness apps, travel services, and property.]
    ],
  )
]

#speaker-note[
  - You are building on a foundation someone else owns
  - Price, strategy, technology, and uptime are not yours once you are locked in
  - Three only: X API 2023; ChatGPT vs Jasper; Google Maps 2018
  - Do not dump the eight-item list
]

== AI model subsidy

#grid(
  columns: (1fr, 1.05fr),
  gutter: 1em,
  align: horizon,
  [
    #set par(spacing: 0.85em)
    You charge #h(0.2em) #text(size: 1.85em, weight: "bold", fill: accent)[\$1]

    They pay the lab #h(0.2em) #text(size: 1.85em, weight: "bold", fill: accent)[\$10]

    The lab spent #h(0.2em) #text(size: 1.85em, weight: "bold", fill: accent)[\$50]

    #v(0.55em)
    #text(size: 0.9em)[Forecast from first principles, not from today's sticker.]

    #v(0.55em)
    #gblock(inset: 0.7em, outset: 0pt)[
      Build to tolerate *vastly greater* prices for AI — especially LLMs.
    ]
  ],
  [
    #block(radius: 0.3em, clip: true, width: 100%)[
      #image("/media/ai-subsidy.png", width: 100%)
    ]
  ],
)

#speaker-note[
  - Fictitious stack: you charge \$1, they pay the lab \$10, the lab spent \$50
  - Labs are competing for the market-leader seat by subsidising access
  - Forecast cost from first principles, not from current prices
  - Build so the firm still works if LLM prices jump
]

= In summary

#speaker-note[
  - The remaining slides are the short version
  - Pascal: I have made this letter longer than usual, because I have not had time to make it shorter
]

== The short version

#align(center + horizon)[
  #text(size: 1.45em)[
    "I have made this letter longer than usual, \
    because I have not had time to make it shorter."
  ]
  #v(0.85em)
  #text(size: 1.05em, fill: luma(80))[— Blaise Pascal]
]

#speaker-note[
  - In summary. The remaining slides are the short version
  - We spent the time so they do not have to
]

== When working ON AI

#align(horizon)[
  #set list(marker: text(fill: accent)[•], spacing: 0.62em)
  - You must have more than just AI
  - Don't be an "LLM-wrapper"
  - Expect rising cost and aggressive competition
  - Models are CAPEX \
    #text(size: 0.82em, fill: luma(80))[Expensive. They depreciate. They need data and maintenance.]
  - Carefully consider renting
  - Institutional buy-in
  - Risk surface is greatly amplified — manage it well
]

#speaker-note[
  - Tell the Visigoth / Ocellivision product story if there is time
  - More than AI. Don't be an LLM-wrapper
  - Rising cost and competition. Models are CAPEX — rent
  - Buy-in. The risk surface is much larger; manage it
]

== When working in a firm

#align(horizon)[
  #set list(marker: text(fill: accent)[•], spacing: 0.7em)
  - Exploit a comparative advantage — and *protect* it \
    #text(size: 0.82em, fill: luma(80))[IP, secrets, trust, certifications.]
  - Talk to customers. Correlate what they say. \
    #text(size: 0.82em, fill: luma(80))[Watch them solve the problem with and without you.]
  - Every big company was a startup
  - Architecture, contracts, and "small" concessions survive \
    #text(size: 0.82em, fill: luma(80))[Software, regulatory pathway, exclusive deals, rights of first refusal.]
  - Prospect ≠ retrospect. What looks obvious later never was.
]

#speaker-note[
  - Merged startup and big-company list
  - Exploit and protect an advantage. Talk to customers
  - Every big company was a startup. Architecture and contracts stick
  - A small concession now is an outsize constraint later
  - Prospect is not retrospect
]

== Jevons paradox

#align(center + horizon)[
  #lblock(inset: (x: 1.3em, y: 1.5em), outset: 0pt, width: 88%)[
    #text(weight: "bold", size: 1.5em)[Jevons paradox]

    #v(0.45em)
    AI will not make work easier. \
    It raises the bar for everyone \
    and increases competition.

    #v(0.45em)
    The only competitive moat left \
    is your speed of integration.

    #v(0.35em)
    *Adopt early, or get left behind.*
  ]
]

#speaker-note[
  - Reprise. AI does not make the work easier; it raises the bar
  - The remaining moat is speed of integration
  - Adopt early, or get left behind
]

== Thank you

#grid(
  columns: (1fr, auto),
  align: horizon,
  gutter: 2em,
  [
    #text(weight: "bold", size: 12mm)[Dr. Gaurav Manek]

    #v(0.7em)
    #text(size: 1.15em)[
      #link("mailto:gaurav@gauravmanek.com")[gaurav\@gauravmanek.com]
    ]

    #v(0.35em)
    #text(size: 1.05em, fill: luma(80))[
      #link("https://gauravmanek.com")[gauravmanek.com]
    ]
  ],
  [
    #box(fill: white, inset: 0.7em)[
      #qrcode("https://gauravmanek.com", width: 6.2cm)
    ]
  ],
)

#speaker-note[
  - Thank you. Questions
  - Consulting: gaurav@gauravmanek.com
  - QR is gauravmanek.com
]
