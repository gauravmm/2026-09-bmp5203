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
    - Confident is not the same as *correct*
    - Fluent is not the same as *cogent*
    - It has our *words*, not our *world*
  ],
)

#speaker-note[
  - "Fancy autocomplete" is provocative on purpose --- return to it when they are surprised
  - Next-token prediction is the whole mechanism; agents, tools, "reasoning" sit on top
  - Skip tokenizer, attention, and billing --- those are workshop material
  - "Words, not world" is the manager takeaway: it will miss why a fence is there
]

== What is a Token?

#let aside(title, body) = box(
  fill: luma(240),
  width: 100%,
  height: 100%,
  radius: 0.5em,
  inset: 0.5em,
  grid(
    rows: (2em, 1fr),
    align: horizon,
    text(weight: "bold", size: 1.5em)[#title],
    body,
  ),
)

#let tok-colors = (rgb("#FFD966"), rgb("#B6D7A8"), rgb("#9FC5E8"), rgb("#EA9999"))
#let tok(n, content) = box(
  fill: tok-colors.at(calc.rem(n, tok-colors.len())),
  inset: (x: 0.2em, y: 0.15em),
  radius: 0.1em,
)[#content]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [
    Tokens are *chunks* of text

    - Roughly 1 token ≈ ¾ of an English word
    - Varies for code, other languages, numbers
    - Punctuation and spaces count

    Basic unit of computation for an LLM. Everything in and out is in tokens.

    #v(0.5em)

    *Matters because:*
    - Pay per token ingested
    - Pay per token produced
    - Context windows are measured in tokens
  ],
  aside([GPT-5.x Tokenizer], [
    #[
      #set text(font: "DejaVu Sans Mono", size: 0.78em)
      #tok(0)[Many]#tok(1)[ words]#tok(2)[ map]#tok(3)[ to]#tok(4)[ one]#tok(5)[ token]#tok(6)[,]#tok(7)[ but]#tok(
        8,
      )[ some]#tok(9)[ don]#tok(10)['t]#tok(11)[:]#tok(12)[ indiv]#tok(13)[isible]#tok(14)[.]

      #v(0.4em)
      #tok(0)[Unicode]#tok(1)[ characters]#tok(2)[ like]#tok(3)[ emojis]#tok(4)[ may]#tok(5)[ be]#tok(
        6,
      )[ split]#tok(
        7,
      )[ into]#tok(8)[ many]#tok(9)[ tokens]#tok(10)[ containing]#tok(11)[ the]#tok(12)[ underlying]#tok(
        13,
      )[ bytes]#tok(14)[:]#tok(15)[ ◆]#tok(16)[◆]#tok(17)[◆]#tok(18)[◆]

      #v(0.4em)
      #tok(0)[Sequences]#tok(1)[ of]#tok(2)[ characters]#tok(3)[ commonly]#tok(4)[ found]#tok(5)[ next]#tok(6)[ to]#tok(
        7,
      )[ each]#tok(8)[ other]#tok(9)[ may]#tok(10)[ be]#tok(11)[ grouped]#tok(12)[ together]#tok(13)[:]#tok(
        14,
      )[123]#tok(
        15,
      )[456]#tok(16)[789]#tok(17)[0]
    ]

    #v(1em)
    #h(1fr)from the #link("https://platform.openai.com/tokenizer")[OpenAI Tokenizer Demo]
  ]),
)

#speaker-note[
  - Output is from the real GPT-5.x tokenizer
]


== How Usage Is Billed

TODO

== Simple LLM vs Agentic AI

#grid(
  columns: (1fr, 1.35fr),
  gutter: 0.8em,
  align: top,
  [
    #align(center, text(weight: "bold", size: 1.15em)[Simple LLM])
    #include "/figures/simple-llm.typ"
    #align(center, [_"What is the answer to this question?"_])
    #pause
  ],
  [
    #align(center, text(weight: "bold", size: 1.15em)[Agentic AI])
    #include "/figures/agentic-loop.typ"


    #align(center, [_"Given this goal, what do I do next?"_])
  ],
)

#speaker-note[
  - Chatbot vs agent is shorthand --- don't over-define
  - Left: one prompt, one inference, done. A colleague you email once.
  - Right: gather, act, verify, loop; tools; a person can interrupt
  - Same model on both sides. The difference is the harness
]


// Full-bleed image slide: drop the right + bottom margins via slide config
// (a mid-slide `#set page` would inject a blank page in touying).
== Agents using Agents using Agents using...
#slide(
  config: config-page(margin: (top: 3em, bottom: 0pt, left: 2em, right: 0pt)),
)[
  // `overlap`: width of the text box. Raise it to extend the text rightward
  // over the image; lower it to pull the text back to the left.
  #let overlap = 7cm
  #box(width: 100%, height: 100%)[
    #place(right + horizon, image("04-agents/whatsapp-1.jpeg", height: 100%))
    #place(left + top, dy: 1em, box(width: overlap, text(
      size: 1.8em,
      weight: "bold",
    )[Agents all the way down.]))
  ]

  #speaker-note[
    - Agent teams (left): a few agents talk peer-to-peer
    - Dynamic workflows (right): one orchestrator fans out to N tasks — implementer → verifiers → fixer — then returns when done
    - N can be in the hundreds: this is the autonomous end of the complexity ladder
  ]
]

// Full-bleed image slide: drop the right + bottom margins via slide config
// (a mid-slide `#set page` would inject a blank page in touying).
#slide(
  config: config-page(margin: (top: 3em, bottom: 0pt, left: 2em, right: 0pt)),
)[
  // `overlap`: width of the text box. Raise it to extend the text rightward
  // over the image; lower it to pull the text back to the left.
  #let overlap = 7cm
  #box(width: 100%, height: 100%)[
    #place(right + horizon, image("04-agents/whatsapp-2.jpeg", height: 100%))
    #place(left + top, dy: 1em, box(width: overlap, text(
      size: 1.8em,
      weight: "bold",
    )[Agents all the way down.

      #emph[Maybe].]))
  ]

  #speaker-note[
    - Same diagram, now with the price tag attached
    - Every box is a model call; fan-out multiplies token spend fast
    - The fat cat got rich on your bill — budget and cap autonomous runs before you let them loose
  ]
]

