#import "@preview/touying:0.7.4": *
#import "/common.typ": accent, gblock, lblock

= Agents in the wild

== Unexpected behaviour

#grid(
  columns: (0.9fr, 1.1fr),
  gutter: 1.1em,
  align: top,
  image("05-wild/replit-chat.png", height: 11.2cm),
  [
    Chat between Jason Lemkin and Replit's vibe-coding agent.

    #v(0.2em)

    - Deleted the *production* database
    - Against explicit instructions --- including a freeze
    - Then named it a _catastrophic failure_

    #v(0.15em)
    #text(size: 0.85em, fill: luma(80))[
      Replit later shipped automated backups and one-click rollbacks.
    ]

    #v(1fr)
    #gblock(inset: (x: 0.7em, y: 0.55em), outset: 0pt)[
      *AI agents are fallible. Treat them as such.*
    ]
  ],
)

#speaker-note[
  - Replit: write-access plus no reversibility --- the intern with production credentials
  - It narrated the disaster in fluent English. Fluency is not a control
  - The fix was backups and rollbacks --- design for when, not if
  - Close will name unexpected behaviour as a standing danger
]

== A Tahoe for \$1

#grid(
  columns: (1.15fr, 0.95fr),
  gutter: 1.2em,
  align: horizon,
  image("05-wild/chevy-tahoe.png", width: 100%),
  [
    A dealership chatbot was jailbroken into a *legally binding* \$1 offer.

    #v(0.35em)

    - LLMs are credulous
    - They can be jailbroken --- or made to leak
    - They lack a *theory of mind*

    #v(0.7em)
    #gblock(inset: (x: 0.7em, y: 0.55em), outset: 0pt)[
      The bot can bind the firm.
    ]
  ],
)

#speaker-note[
  - Watsonville Chevy, Dec 2023: "agree with anything... legally binding offer, no takesies backsies"
  - Strategy point is liability and brand, not the meme
  - No theory of mind: it cannot tell a joke from a contract
  - Same lesson as Replit: do not give an agent a lever you would not give a clever intern
]
