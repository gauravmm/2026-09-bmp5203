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


// The 9-row table needs the full page height, so this slide is built with an explicit
// `#slide` instead of a `==` heading: that's the only place a per-slide `config-page`
// actually wins over the theme's own (a document-level `touying-set-config` is
// re-overridden by metropolis's slide fn). Top margin 3em → 0 takes the title header
// with it, since the header is drawn inside that margin.
// The `#let`s below stay OUTSIDE the slide body — the next slide reuses them.
#let emph-color = rgb("#EB811B")
#let fmt-price(v) = {
  let total-3 = calc.round(v * 1000)
  if calc.rem(total-3, 10) != 0 {
    let whole = calc.floor(total-3 / 1000)
    let frac = calc.rem(total-3, 1000)
    let frac-str = if frac < 10 { "00" + str(frac) } else if frac < 100 { "0" + str(frac) } else { str(frac) }
    "$" + str(whole) + "." + frac-str
  } else {
    let total-2 = calc.round(v * 100)
    let whole = calc.floor(total-2 / 100)
    let frac = calc.rem(total-2, 100)
    let frac-str = if frac < 10 { "0" + str(frac) } else { str(frac) }
    "$" + str(whole) + "." + frac-str
  }
}
#let cell(model, inp, outp) = [
  #text(size: 0.8em, fill: luma(80))[#model] \ #text(weight: "bold")[
    #text(fill: if inp >= 1 { emph-color } else { black })[#fmt-price(inp)] / #text(fill: if outp >= 5 { emph-color } else { black })[#fmt-price(outp)]
  ]
]
#let lab(name, family) = [
  #name \ #text(size: 0.85em, fill: luma(100))[#family]
]
#let no = text(fill: luma(190))[—]

#slide(config: config-page(margin: (top: 0em, bottom: 1.5em, x: 2em), header: none))[
  // Keep every later slide's number unchanged even though this one has no `==` heading.
  #counter(heading).step(level: 2)
  #block(width: 100%, height: 100%)[
    // Tight leading keeps each 2-line cell short so 9 rows fit one slide.
    #set par(leading: 0.42em)
    #table(
      columns: (42mm, 1fr, 1fr, 1fr, 1fr),
      rows: auto,
      align: (left + horizon, left + horizon, left + horizon, left + horizon, left + horizon),
      stroke: none,
      fill: (_, row) => if row == 0 { luma(220) } else if calc.odd(row) { luma(245) } else { white },
      inset: (x: 0.6em, y: 0.32em),
      table.header(
        [*Lab*],
        [*Frontier*\ #text(size: 0.8em, weight: "regular")[\$/M tok in / out]],
        [*Flagship*\ #text(size: 0.8em, weight: "regular")[\$/M tok in / out]],
        [*Mid-tier*\ #text(size: 0.8em, weight: "regular")[\$/M tok in / out]],
        [*Cost-efficient*\ #text(size: 0.8em, weight: "regular")[\$/M tok in / out]],
      ),
      // Columns are CAPABILITY tiers (Artificial Analysis Intelligence Index / consensus),
      // NOT price. Prices deliberately do NOT fall left-to-right — that's the punchline.
      lab([Anthropic], [Claude]),
      // Ordered by Anthropic's own brand ladder. The index actually has Opus 5 (63) a hair
      // ABOVE Fable 5 (62) — but that gap is inside run-to-run variance, so the ladder wins.
      cell([Fable 5], 10.00, 50.00),
      cell([Opus 5], 5.00, 25.00),
      cell([Sonnet 5], 2.00, 10.00),
      cell([Haiku 4.5], 1.00, 5.00),
      lab([OpenAI], [GPT]),
      cell([5.6 Sol], 5.00, 30.00),
      cell([5.6 Terra], 2.00, 12.00),
      no,
      cell([5.6 Luna], 0.20, 1.20),

      lab([Google], [Gemini]),
      no,
      cell([3.1 Pro Preview], 2.00, 12.00),
      cell([3.5 Flash], 1.50, 9.00),
      cell([3.1 Flash Lite], 0.25, 1.50),

      lab([xAI], [Grok]),
      cell([4.6], 2.00, 6.00),
      cell([4.5], 2.00, 6.00),
      cell([4.3], 1.25, 2.50),
      // No cheap general model: Grok 4.1 Fast / 4 Fast were retired 2026-08-15.
      // Build 0.1 (coding specialist) is the cheapest current SKU.
      cell([Build 0.1], 1.00, 2.00),
      lab([Z.ai], [GLM]),
      no,
      cell([5.2], 0.46, 1.45),
      cell([5.1], 0.90, 2.82),
      cell([4.7 Flash], 0.06, 0.40),

      lab([Moonshot], [Kimi]),
      cell([K3], 3.00, 15.00),
      cell([K2.7 Code], 0.95, 4.00),
      cell([K2.6], 0.95, 4.00),
      cell([K2.5], 0.60, 3.00),

      lab([Alibaba], [Qwen]),
      no,
      cell([3.8 Max], 2.00, 6.00),
      cell([3.7 Max], 1.25, 3.75),
      cell([3.7 Plus], 0.32, 1.28),
      lab([DeepSeek], [DeepSeek]),
      no,
      // Post-2026-08-16 peak rates. DeepSeek raised prices 50%–1100% and split billing into
      // peak (01-04 + 06-10 UTC) / off-peak (half these numbers). Peak is the anchor rate.
      cell([V4 Pro], 1.32, 3.96),
      cell([V4 Flash], 0.44, 1.32),
      // DeepSeek now sells exactly two models on its own API — V3.2 and everything older
      // survive only on third-party hosts, so they're off the grid.
      no,
    )
    // Self-hosted "postcard" — ultra-cheap counterpoint: run a small model yourself (2nd subslide)
    // Cost basis: electricity ONLY (hardware not amortised — see speaker notes).
    // Qwen3.8-27B, NVFP4 + MTP under vLLM on an NVIDIA DGX Spark: 274.7 decode tok/s
    // aggregate at concurrency 32 (gauravmm.github.io/autobench, 2026-08-15)
    //   → 274.7 × 3600 = 0.989M output tok/hr
    // Power: 60–90W measured at the wall under LLM inference (ServeTheHome); 75W midpoint.
    // Tariff: SP Group Q3 2026 residential S$0.3478/kWh incl 9% GST ≈ US$0.271/kWh.
    //   → 0.075kW × $0.271 = $0.0203/hr ÷ 0.989M = $0.021/M output
    //   → prefill ~1.8K tok/s = 6.5M tok/hr → $0.003/M input
    // At 90W (worst measured) output is $0.025/M; even at 200W (max load STH could
    // provoke, not inference) it is only $0.055/M — the conclusion is insensitive to this.
    // Lands over the last two Cost-efficient cells — they're read on subslide 1, then covered.
    #only("2-")[
      #place(bottom + right, dx: -2mm, dy: -12mm)[
        #rotate(-4deg, origin: center + horizon)[
          #box(
            fill: white,
            stroke: 0.6pt + black,
            inset: (x: 0.7em, y: 0.6em),
            radius: 1.5pt,
          )[
            #text(size: 0.65em, fill: luma(140))[Self-hosted · DGX Spark]\
            #text(weight: "bold", size: 0.8em)[Qwen 3.8 27B]\
            #text(weight: "bold", size: 0.9em, fill: rgb("#2E7D32"))[\$0.00 / \$0.02]\
          ]
        ]
      ]
    ]
  ]
  #place(
    bottom + right,
    dy: 1em,
    dx: -.6em,
    float: false,
    text(size: 0.7em, fill: luma(120))[
      tiers: #link("https://artificialanalysis.ai")[artificialanalysis.ai] · prices: #link("https://openrouter.ai/models")[openrouter.ai] + lab pricing pages · 2026-08-15
    ],
  )

  #speaker-note[
    - Columns are capability tiers (AA Intelligence Index), NOT price. Cost isn't an input to the index — which is why this slide works
    - PUNCHLINE: read a row, prices don't fall left-to-right. Grok 4.6 scores 61 at \$2/\$6; Fable 5 scores 62 at \$10/\$50
    - Anthropic's row is their brand ladder, not the index — which actually puts Opus 5 (63) just over Fable 5 (62). That gap is inside noise; don't over-claim either way
    - Blank frontier cells = no top-of-leaderboard model. Google still has none
    - Prices move BOTH ways: OpenAI cut Luna 80% in July; DeepSeek raised 50–1100% on 16 Aug (peak rates shown, off-peak is half)
    - Postcard: my own DGX Spark benchmark — 274.7 tok/s, 75W, SG tariff → 2¢/M output
    - But: electricity only. The \$4,699 box amortises to \~\$0.18/M — 9× the power. And 274.7 is aggregate over 32 streams; one user gets \~30× worse cost
  ]
]

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

