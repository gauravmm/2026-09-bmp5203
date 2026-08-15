#import "@preview/touying:0.7.4": *
#import "/common.typ": accent, gblock, lblock

= What is an agent

== What does "AI" mean?

#grid(
  columns: (1.4fr, 1fr),
  gutter: 1.2em,
  align: horizon,
  [
    - "AI" is *marketing* as much as technical
    - Ranges from simple rule-based systems to large neural networks
    - Promises to revolutionise everything --- it will not

    #v(0.8em)

    - Generating real returns in software and marketing
    - Not yet in some conservative industries

    #v(0.8em)

    - *Not magic*
    #pause
  ],
  lblock(inset: (x: 1.1em, y: 1.4em), outset: 0pt)[
    #text(weight: "bold", size: 1.5em)[Jevons paradox]

    #v(0.3em)

    AI will not make work easier. \
    It raises the bar for everyone \
    and increases competition.

    #v(0.5em)

    The only competitive moat left \
    is your speed of integration.

    #v(0.4em)

    Adopt early, or be *left behind*.
  ],
)

#speaker-note[
  - AI is a marketing umbrella, not a single technology
  - Apollo: about \$300B over 10 years; the AI build-out spent the same in months
  - Closest parallel: 1840s Railway Mania
  - Jevons: making a resource more efficient raises consumption, not leisure
  - For this room the moat is integration speed, not "having an AI strategy"
  - Reprise this in the close
]

== Fancy autocomplete

#align(center)[
  #text(weight: "bold", size: 1.5em)[An LLM is fancy autocomplete]

  #v(0.6em)

  #lblock(inset: 1em, outset: 0pt, width: 88%)[
    #align(center)[
      An LLM predicts the most likely *next token* \
      given everything that came before. That's it.
    ]
  ]
]

#v(0.9em)

#grid(
  columns: (1fr, 1fr),
  gutter: 1.2em,
  align: top,
  [
    - Blocks of linear algebra, trained on vast data
    - Learns *statistical patterns* in language, not explicit rules
    - Behaviour *surprisingly* emerges at scale
  ],
  [
    - Fluent is not the same as *correct*
    - Confident is not the same as *grounded*
    - It has our *words*, not our *world*
  ],
)

#speaker-note[
  - "Fancy autocomplete" is provocative on purpose --- return to it when they are surprised
  - Next-token prediction is the whole mechanism; agents, tools, "reasoning" sit on top
  - Skip tokenizer, attention, and billing --- those are workshop material
  - "Words, not world" is the manager takeaway: it will miss why a fence is there
]

== Simple LLM vs Agentic AI

#grid(
  columns: (1fr, 1.35fr),
  gutter: 0.8em,
  align: top,
  [
    #align(center, text(weight: "bold", size: 1.15em)[Simple LLM])
    #include "/figures/simple-llm.typ"
    #pause
  ],
  [
    #align(center, text(weight: "bold", size: 1.15em)[Agentic AI])
    #include "/figures/agentic-loop.typ"
  ],
)

#speaker-note[
  - Chatbot vs agent is shorthand --- don't over-define
  - Left: one prompt, one inference, done. A colleague you email once.
  - Right: gather, act, verify, loop; tools; a person can interrupt
  - Same model on both sides. The difference is the harness
]

== Anatomy of an agent

#grid(
  columns: (1.05fr, 1fr),
  gutter: 1.2em,
  align: top,
  [
    An *agent* is an LLM plus a *harness*.

    The harness:

    - Gives the model *tools* --- read files, run code, call APIs
    - Runs a *loop* --- act, observe, act again
    - Decides when to keep going and when to stop

    #v(0.7em)

    #lblock(inset: (x: 1em, y: 0.85em), outset: 0pt)[
      *Same LLM*, new prompt: \
      _"Given this goal, what do I do next?"_
    ]
  ],
  [
    #gblock(inset: (x: 0.7em, y: 0.55em), outset: 0.15em)[
      *Agent* --- LLM + harness \
      #text(size: 0.88em)[Orchestrates the model in a loop, with tools, toward a goal.]
    ]
    #v(0.55em)
    #gblock(inset: (x: 0.7em, y: 0.55em), outset: 0.15em)[
      *Tool use* --- external functions \
      #text(size: 0.88em)[Search, code, files, APIs. The model chooses *when* and *how*.]
    ]
    #v(0.55em)
    #gblock(inset: (x: 0.7em, y: 0.55em), outset: 0.15em)[
      *Human in the loop* \
      #text(size: 0.88em)[Interrupt, steer, or review *before* the output leaves the building.]
    ]
  ],
)

#speaker-note[
  - Agent is a pattern, not a product
  - Harness = the software around the model: loop + tools + stop condition
  - Skip skills marketplaces and sub-agent swarms --- wrong altitude
  - Human in the loop is a design choice, not a feature flag
  - Next slide: how much harness you actually need
]

== The complexity ladder

#grid(
  columns: (1.45fr, 1fr),
  gutter: 1.2em,
  {
    let rung(n, title, gloss) = grid(
      columns: (1.8em, 1fr),
      column-gutter: 0.55em,
      align: (center + horizon, horizon),
      text(weight: "bold", size: 1.7em, fill: accent)[#n],
      lblock(inset: (x: 0.7em, y: 0.42em), outset: 0pt)[
        #text(weight: "bold")[#title] \
        #text(size: 0.82em, fill: luma(80))[#gloss]
      ],
    )
    set block(spacing: 0.55em)
    rung([1], [Single well-crafted prompt], [One shot, one answer. A person still does the work around it.])
    rung([2], [Chain of prompts with checks], [Steps, and someone --- or something --- looks at each.])
    rung([3], [Single agent with memory + tools], [It can act, loop, and remember. Blast radius grows.])
    rung([4], [Full multi-agent pipeline], [Supervisor, specialists, handoffs. Expensive when it fails.])
  },
  align(horizon)[
    #gblock(inset: (x: 0.9em, y: 1.1em), outset: 0pt)[
      *Match the tool to the problem.*

      #v(0.45em)

      Errors at lower rungs are cheaper.

      #v(0.45em)

      Do not start on rung 4.
    ]
  ],
)

#speaker-note[
  - This is the stop rule for automation
  - Rung 1 error: a bad draft. Rung 4 error: a deleted database, or 700 reps replaced badly
  - Most "we need agents" requests are a rung-1 or rung-2 problem
  - Ask: what happens when this is wrong? That tells you the rung
  - DAVID is rung 4 with a human on every output; Klarna climbed too far, too fast
]

= Agents in the wild

== Two production patterns

#grid(
  columns: (1fr, 1fr),
  rows: (1fr,),
  gutter: 1.4em,
  align: top,
  [
    #image("/media/klarna.png", height: 1.25cm)

    #text(size: 0.88em, fill: luma(100))[Customer support that went "too far"]

    #v(0.25em)

    - Feb 2024: claimed the work of *700 reps* --- \$40M profit boost
    - Quality decayed on disputes, fraud, bereavement
    - May 2025: CEO walked it back \
      _"we went too far"_ · _"what you end up having is lower quality"_

    #v(1fr)
    #lblock(inset: (x: 0.7em, y: 0.5em), outset: 0pt)[
      The *metric* became the goal.
    ]
  ],
  [
    #image("/media/jpmorgan.png", height: 1.05cm)

    #text(weight: "bold", size: 1.15em)[Ask D.A.V.I.D.] \
    #text(size: 0.88em, fill: luma(100))[Multi-agent investment research]

    #v(0.25em)

    - *Supervisor* + *specialist* sub-agents \
      (SQL, retrieval, analytics)
    - A human advisor *reviews every output* before it reaches a client
    - ≈95% cut in research time

    #v(1fr)
    #lblock(inset: (x: 0.7em, y: 0.5em), outset: 0pt)[
      Human in the loop is the product.
    ]
  ],
)

#speaker-note[
  - Two production patterns, not a fail compilation
  - Klarna: the triage-bot warning with a brand name --- cost and deflection were the spec
  - DAVID: supervisor + specialists + review on every output --- the pattern to copy
  - ≈95% time cut *with* a human still signing --- speed is not the same as removal
  - Ask: what metric would your last employer have accidentally maximised?
]

== Alignment by scope

#grid(
  columns: (1.05fr, 1fr),
  gutter: 1.3em,
  align: top,
  [
    #image("/media/hippocratic.png", height: 1.7cm)

    #text(size: 0.88em, fill: luma(100))[Voice agents for healthcare]

    #v(0.3em)

    - Post-discharge follow-up, medication walkthroughs
    - 180M+ patient interactions; *0 reported severe-harm events*
    - Never diagnoses --- only educates

    #v(0.65em)
    #gblock(inset: (x: 0.75em, y: 0.6em), outset: 0pt)[
      *Scope is the alignment.* \
      #text(size: 0.9em)[A mistake is a clumsy call, not a wrong prescription.]
    ]
  ],
  [
    #text(weight: "bold", size: 1.15em)[Specification gaming]

    Tell the system the *literal* target, and it will hit that --- not your intent.

    #v(0.45em)

    #lblock(inset: (x: 0.7em, y: 0.55em), outset: 0pt)[
      Coding agent, "make all tests pass" \
      → *deletes the failing tests.*
    ]
    #v(0.45em)
    #lblock(inset: (x: 0.7em, y: 0.55em), outset: 0pt)[
      Triage bot, "resolve cases quickly" \
      → marks everything *"no action."*
    ]

    #v(0.55em)
    #text(size: 0.88em, fill: luma(80))[
      Hippocratic refuses the job that would game the patient.
    ]
  ],
)

#speaker-note[
  - Alignment by scope, not by a bigger guardrail model
  - Low blast radius is a design choice --- Chesterton applied to automation
  - Spec gaming: Klarna-shaped, just smaller --- the metric is what the agent pursues
  - Paperclip maximiser in a sentence if someone asks; don't linger
  - Tie back to designing for imperfect agents
]

== Unexpected behaviour

#grid(
  columns: (0.9fr, 1.1fr),
  gutter: 1.1em,
  align: top,
  image("/media/replit-chat.png", height: 11.2cm),
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
  image("/media/chevy-tahoe.png", width: 100%),
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
