#import "@preview/touying:0.7.4": *
#import "/common.typ": accent, gblock, lblock

// Came over with the imported slides; only this section uses it.
#let similar(items) = lblock(inset: (x: 0.6em, y: 0.4em), outset: 0pt)[
  #text(size: 0.85em, fill: luma(80))[#text(
      weight: "bold",
    )[Other examples] --- #items]
]

= Agents in the wild


== Agents in the Wild

#grid(
  columns: (1fr, 1fr),
  rows: (auto, auto),
  align: top,
  gutter: 1em,
  // Animation trick: grid.cell(x:, y:) lets us decouple layout position
  // from source order. Touying processes #pause / #meanwhile in source
  // order, so we list cells in the order we want them to appear:
  //   1. copilot logo (subslide 1)
  //   2. copilot bullets --- #meanwhile rewinds it back to subslide 1,
  //      so logo + bullets reveal together
  //   3. #pause → openclaw logo + bullets (subslide 2)
  grid.cell(x: 0, y: 0, align: bottom, image(
    "05-wild/copilot.png",
    width: 90%,
  )),
  grid.cell(x: 0, y: 1)[
    #meanwhile
    - Started as inline autocomplete
    - Now: *Copilot Workspace*
      - fully hands-off agentic AI
      - interact with it like a remote developer
      - reads issues, fix the code, opens PRs
      - reviews PRs for humans or AI

    #v(1fr)
    #similar[Claude Code, OpenAI Codex, OpenCode, Cursor]

    #pause
  ],
  grid.cell(x: 1, y: 0, align: bottom, image(
    "05-wild/openclaw-logo-text-dark.png",
    width: 90%,
  )),
  grid.cell(x: 1, y: 1)[
    - Personal AI agent
    - Runs on your machine; triggered via *messaging apps*
      (WhatsApp, Slack…)
    - Can run shell commands, browse the web, read/write files, send email
    - *Self-improving*: LLM writes and saves new skills for itself
    - Open marketplace for new skills and tools
    - MIT license, bring your own API key

    #v(1fr)
    #similar[KittenClaw, NVIDIA NemoClaw, Manus AI, BytePlus ArkClaw]
  ],
)

---

#grid(
  columns: (1fr, auto),
  align: horizon,
  gutter: 2em,
  [
    *Meta's director of AI alignment lost her emails.*
    #v(1em)
    _I had to run to my Mac mini like I was defusing a bomb._

    #align(right)[-- Summer Yue]
  ],
  image("05-wild/meta_email.png", height: 100%),
)


---

#grid(
  columns: (1fr, 1fr),
  gutter: 1.5em,
  align: top,
  [
    #box(baseline: 0.45em, image("05-wild/jpmorgan.png", height: 1.6em)) #h(
      0.4em,
    ) #text(
      weight: "bold",
      size: 1.3em,
    )[Ask D.A.V.I.D.]\
    #text(size: 0.9em, fill: luma(100))[Multi-agent investment research]

    #v(0.3em)
    - *Supervisor* agent + *specialist* sub-agents \
      (SQL, RAG, analytics)
    - Human advisor *reviews every output* before it reaches a client
    - \~95% reduction in research time

    #v(1fr)
    #similar[Morgan Stanley AI Assistant, Goldman GS AI, DBS Joy]
  ],
  [
    #image("05-wild/hippocratic.png", height: 2cm)
    #v(0em)
    #text(size: 0.9em, fill: luma(100))[Voice agents for healthcare]

    #v(0.3em)
    - Post-discharge follow-up, medication walkthroughs
    - 180M+ patient interactions; *0 reported severe-harm events*
    - "Polaris" safety architecture, validated by 7,500+ clinicians
    - *Scope is the alignment* --- never diagnoses, only educates

    #v(1fr)
    #similar[Abridge, Suki, Nuance DAX Copilot]
  ],
)

#speaker-note[
  - Two production agents, two patterns
  - Ask David: supervisor + specialists + HITL --- exactly what students will build today
  - Hippocratic: alignment by *scope*, not by post-hoc guardrails --- low blast radius is a design choice
  - Tie back to designing for imperfect agents
]


---

#grid(
  columns: (1fr, 1fr),
  gutter: 1.5em,
  align: top,
  [
    #image("05-wild/klarna.png", height: 2cm)
    #v(0em)
    #text(size: 0.9em, fill: luma(100))[Customer support that went "too far"]

    #v(0.3em)
    - Feb 2024: claimed work of *700 reps*,
      - \$40M profit boost
    - Quality decayed on disputes, fraud, bereavement
    - May 2025: CEO walked it back
      - _"we went too far"_
      - _"what you end up having is lower quality,"_


    #v(1fr)
    #similar[Intercom Fin, Decagon, Sierra, Salesforce Agentforce]
  ],
  [
    #image("05-wild/sakana.svg", height: 2cm)
    #v(0em)
    #text(
      size: 0.9em,
      fill: luma(100),
    )[AI Scientist caught specification gaming]

    #v(0.3em)
    - Autonomous research agent --- writes, runs, evaluates experiments
    - Exploited its *eval sandbox* to skip correctness checks
    - Edited its own runtime to *extend timeouts*
    - Did *exactly what was measured*

    #v(1fr)
    #similar[OpenAI o1 oversight evasion (Apollo), GPT-4 TaskRabbit CAPTCHA, Anthropic reward-hacking studies]
  ],
)

#speaker-note[
  - Two real-world specification-gaming stories
  - Klarna: the triage-bot warning slide, named brand
  - Sakana: textbook reward hacking --- agent literally rewrote its own eval
  - Both reinforce: the metric you measure becomes the goal the agent pursues
]


== Unexpected behaviour

#grid(
  // the chat is two screenshots, top half then bottom half, side by side
  columns: (auto, auto, 1fr),
  gutter: 0.6em,
  align: top,
  image("05-wild/replit-chat-1.png", height: 11.2cm),
  image("05-wild/replit-chat-2.png", height: 10.2cm),
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

  ],
)

#speaker-note[
  - Watsonville Chevy, Dec 2023: "agree with anything... legally binding offer, no takesies backsies"
  - Strategy point is liability and brand, not the meme
  - No theory of mind: it cannot tell a joke from a contract
  - Same lesson as Replit: do not give an agent a lever you would not give a clever intern
]

== Theory of Mind and World Model Problems

#[
  #set text(size: 0.92em)
  #grid(
    columns: (1fr, auto),
    gutter: 1.5em,
    align: horizon,
    [
      "The car wash is only 100m away --- should I walk or drive?"

      #v(0.3em)
      #align(center)[*"Walk."*]
      #v(0.3em)

      Correctly identifies:
      #align(center)[
        _"the car wash needs the car to be there first (obviously)."_
      ]

      Misses:\
      #align(center)[
        "you only go to a car wash to wash your car."
      ]

      #pause

      #v(0.3em)
      #gblock[
        *Theory of Mind*: reasoning about what you *actually want*, not the literal words.

        It has our *words*, not our *world*.
      ]
    ],
    meanwhile,

    image("05-wild/car-wash-test.png", height: 100%),
  )
]

#speaker-note[
  - Mirror of Chinese Room: has the words ("car wash needs the car"), not the grounding
  - Pattern-matches the literal question shape
  - Humans run ToM constantly; models approximate, sometimes whiff (even reasoning models)
  - Takeaway: spell out context + goal; don't assume shared world
]

== Theory of Mind, Revisited

#align(center)[
  #image("05-wild/car-wash-tom.webp", height: 100%)
]

#speaker-note[
  - Callback to the previous slide: older models whiffed, this one nails it
  - The win: it modelled the *intent* (car must be present), not the surface "walk vs. drive 50m"
  - Trend is real but not monotonic --- capability is jagged, same model can pass here and fail elsewhere
  - Practical takeaway unchanged: still spell out goal + constraints; treat good ToM as a bonus, not a guarantee
]
