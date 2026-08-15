# BMP5203 guest lecture -- 90-minute options

**Course:** BMP5203 Competitive Strategy, Digitisation, and AI (NUS; industrial-economics lens).
**Audience:** Masters students with work and some entrepreneurship experience. Not first-time founders, not engineers.
**Slot:** 90 minutes. Talk, not a workshop.
**Must include:** MBA-student disease, Chesterton's Fence, How to use AI in business.
**Sources used:** `OUTLINE.md` Parts 1, 2, and 4 (BSE3713 map + script); `agentic-ai-tutorial/01-introduction/slides.typ` and `03-agentic/slides.typ`. The BSE3713 PPTX was not opened.

**Chosen:** Option A. Deck lives in `slides.typ` + `sections/`. Slide-by-slide contract: `spec/OUTLINE.md`.

---

## 1. What we actually have

### 1.1 Business (BSE3713 Parts 1-2)

A ~50-minute block on starting and failing companies.

- **Part 1.** Failure is the default. Stages from idea to maturity. Funding gap, rounds, dilution. Empire vs exit, missionary vs mercenary. Exit options by stage. Six *great filters*: Validation → Customer Discovery → Product-Market Fit → Expanding Everything → Market Segments → Defending Position. Why even a revenue company raises. Employees vs founders.
- **Part 2.** Success is a lousy teacher. Idea filter via Juicero ($120M, a bag you can squeeze by hand). Investor incentives (LP → fund → startup; next-investor optimisation; 100 → 10 → 1). Customer Discovery via WebVan and three FDA products that shipped and still failed (MelaFind, NC-stat, Hemopurifier). CAPEX vs OPEX. Money / Authority / Need, with checkout candy, a $350k imager, and database software. Moore adoption + hype cycle. Maturity as CAGR, share vs expand, incumbents get disrupted.

The argument is: de-risk in order, ask the filter questions out loud, and do not confuse a raise or an FDA stamp with a business.

### 1.2 AI-in-business (BSE3713 Part 4)

A ~15-minute block that is already the right altitude for this room.

- Hayek: you benefit from knowledge you do not personally hold.
- **MBA-student disease** vs **Chesterton's Fence.** Symptoms: "business is business"; every decision is a framework or NPV/IRR; domain experts are obviously wrong; synergy / disruption / scalability with no referent; next-quarter over franchise; IT / Security / R&D as "overhead." Cure: say why the fence was built; know the specific technology and market trade-offs; test why customers actually come; write the decision down and reread it later; treat the unmeasurable assets as real. Spoken example: cattle futures can settle in delivery, hog futures are cash-only -- *why*, before you "fix" it.
- **How to use AI:** a business question must be *modelled* into math and *actioned* back into a policy someone will run. Website traces → P(buy) → email coupons. Time, money, data sit in the middle.
- **How not to:** the site is broken in Chrome, so Chrome users never buy, so you coupon everyone else. Garbage in, garbage out, wearing a strategy hat.
- Adoption needs a well-defined model/action pair *and* buy-in (management KPI + users who will actually act). Then plumbing: data collected in the normal course of business, drift, warehousing, compliance.
- Building an AI product: dependency management, cost monitoring, leaks, guardrails -- decide the hooks now, do not implement the whole list on day one.
- Four dangers: no moat (DocuSign / Lovable), platform lock-in, unexpected behaviour (Replit deletes prod; Chevy Tahoe for $1), model subsidy (you charge $1, the stack spent $50).

### 1.3 AI mechanism (agentic tutorial)

A multi-hour zero-code workshop. Two altitudes.

**What the thing is.** "AI" is a marketing term. Jevons: it does not make work easier; it raises the bar. An LLM is fancy autocomplete -- next token, that's it. Tokens, context windows, attention's quadratic cost, API vs subscription pricing, MoE / multimodal / tool use. Chinese Room and Wittgenstein's lion: fluent, not grounded. Theory of mind is jagged (car-wash). Alignment is specification gaming (paperclip; delete the failing tests; triage-bot marks everything "no action"). Prompt injection, leakage, hallucination. Design for imperfect agents: blast radius, reversibility, auditability, guardrails, isolation. Prompting is specifying, and you can ask the model to write the prompt.

**What an agent is.** Same LLM, now in a loop with tools (files, code, APIs, sub-agents, skills). Vocabulary: agent, skill, tool use, sub-agents. Production cases: Copilot Workspace, OpenClaw (and the Meta director who almost lost her mail), JPMorgan Ask D.A.V.I.D. (supervisor + specialists + human review), Hippocratic (alignment by *scope*), Klarna ("we went too far"), Sakana (rewrote its own eval). Visual builders. Anthropic's fan-out-of-hundreds, with the bill attached. Speculative swarms. Patterns: vibe coding, actor-critic, complexity ladder, AI-TDD / evals.

Hands-on tasks, token-billing tables, attention math, and the prompt-from-vague-to-specific drill do not belong in a 90-minute strategy lecture.

### 1.4 The original BSE3713 already *is* a 90-minute lecture

Parts 1-4 plus close are timed at ~80-90 minutes. You cannot port it and "add AI." Something has to be the spine; everything else is evidence.

---

## 2. Audience and design constraints

BMP5203 is competitive strategy, digitisation, and AI, taught through industrial economics. These students will more often *buy, sponsor, or sit next to* an AI project than train a net. Some have founded; most have watched a transformation deck get cheered and then die in operations.

Implications:

- **Judgment over founding mechanics.** Empire vs exit, the full exit matrix, convertible-debt gotchas, and "should I start a company?" are BSE3713 questions. Keep a short filter vocabulary; drop the cap-table tour.
- **They are at risk of MBA-student disease.** Putting the slide up is not a joke at undergrads. It is the lecture's load-bearing diagnosis. Chesterton's Fence is the method; Hayek is why the method is needed (the knowledge is not in the room).
- **How to use AI in business is the technical core, not neural-net anatomy.** Modelling and actioning *is* the translation between strategy and computation. Garbage-in/garbage-out is the industrial-organisation punchline: the policy you ship is only as good as the data-generating process.
- **Agentic AI is the new way to tear down fences at scale.** Klarna, Replit, Chevy, and Sakana are not "AI fail compilations." They are specification gaming and missing theory of mind with a blast radius. JPMorgan and Hippocratic are the counterexamples (human review; alignment by scope).
- **No workshop.** Ninety minutes, experienced adults. One live demo is optional; Codespaces and group tasks are not.
- **One case from business, one from AI, fully told, beats a zoo.** Juicero without investor incentives is a meme. Klarna without "the metric became the goal" is a headline.

Required trio, and how they lock:

| Piece | Job in this room |
| --- | --- |
| MBA-student disease | Names the failure mode this audience is trained into. |
| Chesterton's Fence | The test before you change a process *or* automate it. |
| How to use AI in business | The only legal way to put AI in: business question → model → policy someone will run. |

Hayek is the epigraph for all three. Do not drop it.

---

## 3. Options

Each option is 90 minutes, includes the required trio, and can be built mostly from existing slides. Timing includes one short discussion beat, not a seminar.

### Option A -- Hinge

*First half: how firms fail. Hinge: don't get drunk on the frameworks I just gave you. Second half: how to put AI in without inventing a strategy out of a data bug.*

| Block | Min | Content |
| ------: | ----: | --- |
| Open | 5 | Bio, BMP5203 frame, agenda. |
| Filters, compressed | 18 | Failure is default. Stages in one slide. The six filters. One pass of "which stages you see." |
| Case: Juicero + why $120M | 10 | Idea-filter questions. Investor chain and fad, lightly. |
| Case: WebVan or the three FDA products | 8 | Customer Discovery / MAN. Pick one, not both. |
| **Hinge: MBA disease + Chesterton** | 10 | After they have been handed frameworks. Cattle/hogs. Hayek. |
| **How to / not to use AI** | 12 | Model ↔ action. Chrome coupon. Adoption = definition + buy-in + plumbing. |
| What an agent is | 8 | LLM = next token. Agent = loop + tools. Complexity ladder in one slide. |
| Cases: Klarna vs DAVID/Hippocratic; Replit or Chevy | 12 | Specification gaming; blast radius; human in the loop. |
| Dangers, one card each | 4 | Moat, platform, subsidy -- point, don't tour. |
| Close | 3 | Working *on* AI / in a firm. Jevons one-liner. |

**Thesis.** I will give you tools. The tools are how people get MBA-student disease. AI is a very fast way to act on a misunderstood fence.

**Keeps.** Filters, one idea-stage failure, one discovery-stage failure, the whole required trio, model/action, a short agent definition, two AI cases, the danger names.

**Cuts.** Exit matrix, rounds and dilution, empire/missionary except a passing line, Moore/hype cycle, NN training tables, prompting drill, vibe-coding/TDD tour, swarms.

**Works when.** You want the most reuse of BSE3713 Parts 1-2 and the most familiar two-act shape.

**Fails when.** The first 40 minutes feel like a startup guest lecture that then "also does AI." The hinge has to be played as a punchline, not a section divider.

### Option B -- Fence (recommended)

*The lecture is Chesterton's Fence applied to strategy and to AI. Filters and cases are how you learn why a fence is there. Agents are how you knock a hundred fences down before lunch.*

| Block | Min | Content |
| ------: | ----: | --- |
| Open + Hayek | 6 | Bio. Civilization runs on knowledge you do not possess. Today's question: when are you allowed to change a system, and when are you allowed to let a model change it? |
| **MBA disease + Chesterton** | 12 | Symptoms first, aimed at this room. Cattle/hogs. The cure list is the rest of the hour's method. |
| Filters as fences | 14 | Six filters, recast: each is a reason the previous "obvious fix" was wrong. Stages only as context for which fences you can even see. |
| Juicero | 8 | They tore down "people want juice" without asking which problem was being solved. $120M is what happens when the next investor is the customer. |
| MAN, one example | 7 | Surgical imager or checkout candy. You cannot action a model if you have the wrong person in Money / Authority / Need. |
| **How to / not to use AI** | 14 | The fence test for automation: name the business question, the math, the policy, the person who will run it. Chrome coupon. Buy-in and drift as "the fence had a maintenance schedule." |
| Agents and imperfect design | 10 | Next-token → loop + tools. Five design rules (blast radius, reversibility, audit, guardrails, isolation). Complexity ladder: do not start on rung 4. |
| Klarna, Replit, Chevy; DAVID / Hippocratic | 14 | Two ways to tear the fence: over-automate a human process; give an agent write-access to production or to a price. Two ways to keep it: review every output; shrink the job until a mistake is cheap. |
| Moat / subsidy, 1-2 slides | 3 | If cloning is a weekend, you do not have a firm. If the sticker price is a lab's loss-leader, your unit economics are fiction. |
| Close | 2 | Jevons. Document the fence you left standing. |

**Thesis.** Do not change a system you cannot explain. Do not automate a decision you cannot action. Do not give an agent a lever you would not give a clever intern.

**Keeps.** Required trio as the *frame*, not a late module. Filters, Juicero, MAN, model/action, agent design principles, paired AI cases, moat/subsidy.

**Cuts.** Same as A, plus WebVan (Juicero already does "raised a lot, still not a business") and the investor-mechanics slides except one sentence inside Juicero.

**Works when.** You want one argument the room can take back to a Monday meeting. Fits BMP5203 better than A: this is competitive judgment under incomplete knowledge, which is what industrial organisation is about.

**Fails when.** Front-loading the sermon makes Juicero feel like an illustration of a slide they already agreed with. Mitigation: keep the cattle/hogs story short and treat the filters as *how you earn the right* to change something, not as a second framework dump.

### Option C -- Deploy

*Assume they already know firms are hard. Spend the hour on putting AI into an existing business without lying to yourself.*

| Block | Min | Content |
| ------: | ----: | --- |
| Open | 4 | Bio. Not a founding lecture. A deployment lecture. |
| **MBA disease + Chesterton** | 10 | Same slide, aimed at transformation programmes. |
| Filters in one pass | 8 | Only as a map of *where* AI usually gets inserted (discovery vs expanding vs defending). |
| **How to / not to use AI** | 14 | Full treatment, including adoption and plumbing. |
| What the model is, what an agent is | 12 | Fancy autocomplete; no grounding; specification gaming. Loop + tools. Jevons. |
| Design for imperfect agents | 8 | Five principles. Actor-critic as "a second prompt with a different objective." Evals as the unit test. |
| Cases | 16 | Klarna (too far), DAVID (HITL), Hippocratic (scope), Replit or Chevy (write-access / jailbreak), DocuSign vs wrapper (moat), subsidy. |
| Internal sale: MAN | 8 | The AI project has a user, a budget holder, and a signer. Most "AI strategy" has two of three. |
| Close | 6 | Working in a big company: architecture, contracts, and small concessions survive. Working *on* AI: do not be a wrapper; models are CAPEX. |

**Thesis.** AI in a firm is a modelling problem, a political problem, and a blast-radius problem. In that order.

**Keeps.** Required trio, almost all of Part 4, the useful third of the agentic deck, MAN as internal sales, the BSE3713 close-for-incumbents.

**Cuts.** Juicero, WebVan, investor tour, exit plan, empire/missionary, most of Part 1.

**Works when.** The rest of BMP5203 already covers strategy and firm behaviour, and this guest slot is meant to be the AI operating system.

**Fails when.** You waste their entrepreneurship experience, and the hour becomes a vendor-neutral version of "how to do an AI project." Juicero is also the most memorable object in the old deck; losing it hurts.

### Option D -- Adversarial cases

*Teach only through failures. Extract the required ideas from the cases instead of stating them first.*

| Block | Min | Content |
| ------: | ----: | --- |
| Open | 4 | Success is a lousy teacher. |
| Juicero | 12 | Idea filter. Then: this is MBA disease (frameworks and a raise as proof). |
| WebVan + MAN | 12 | Discovery filter. CAPEX you cannot earn back. |
| Three FDA products | 8 | Shipped ≠ needed. Clinician workflow is a fence. |
| **Chesterton, named** | 6 | Cattle/hogs. Now name the disease and the cure. |
| Chrome coupon | 10 | **How to / not to use AI.** Same diagram, then the bug. |
| Klarna | 8 | Metric became the goal. |
| Replit + Chevy | 10 | Unexpected behaviour; no theory of mind; legally binding nonsense. |
| Sakana, 2 min, then DAVID / Hippocratic | 8 | Specification gaming vs scope and review. |
| Moat + subsidy | 6 | Lovable/DocuSign; $1 in, $50 out. |
| Close | 6 | Hayek. What you take back: three tests (fence, model-action, blast radius). |

**Thesis.** Every famous failure is someone skipping a filter, tearing a fence, or actioning a model that was answering a different question.

**Keeps.** High energy, high recall, all required ideas, almost no taxonomy.

**Cuts.** Systematic filters-as-a-set, adoption/plumbing, complexity ladder, prompting, anything abstract that is not forced by a case.

**Works when.** The room is tired of frameworks and you can tell stories tightly.

**Fails when.** Without a written method they leave with anecdotes. Also the densest to deliver -- six cases in 90 minutes is a lot of setup. Easy to run long.

---

## 4. Analysis

### 4.1 What is non-negotiable

1. **MBA-student disease and Chesterton's Fence as a pair**, not two quotes. The cattle/hogs aside stays; it is the only concrete "you cannot NPV this until you know why."
2. **How to use AI in business, with How *not* to on the next slide.** The Chrome coupon is the whole point. Do not replace it with a generic "data quality matters."
3. **Hayek**, even if it is only the epigraph. It is why Chesterton applies to other people's firms *and* to model-based policy.
4. **At least one agentic production failure and one designed-to-be-fallible success.** Otherwise "agent" is vocabulary.
5. **A stop rule for automation.** Either the five imperfect-agent principles or the complexity ladder. Prefer the five principles for this room; the ladder is the engineer-facing version of the same idea.

### 4.2 What looks important and is not, here

| Tempting | Why it loses |
| --- | --- |
| Full great-filter build (six card-grid slides) | In BSE3713 this is the course. Here it is vocabulary. One slide plus use-in-anger is enough. |
| Exit plan matrix, rounds, dilution | Founder mechanics. Wrong course. |
| Empire vs exit, missionary vs mercenary | Good identity slides, weak on AI and on competitive strategy. |
| NN layers / training CAPEX tables | Part 3 of BSE3713. They do not need to know how to train a net. |
| Tokenizer, attention quadratic, price grids, subscription 10-30× | True and fun. They eat 10-15 minutes and do not change a Monday decision, except the one-liner "today's unit cost is not the cost." Put that in subsidy. |
| Prompt-engineering workshop | Wrong format. One line: specify the output; or ask the model to write the prompt. |
| Vibe coding / TDD / skills marketplace / swarms / LangFlow | Workshop residue. Keep *names* only if they serve complexity or evals. |
| OpenClaw / Meta inbox | Great in a builders' room. Here it is a toy next to Klarna. |
| Hands-on tasks | Out of scope. |

### 4.3 Where the two sources actually meet

The join is not "startups, then AI." It is three translations:

1. **Filter questions → Chesterton.** "Is the problem worth solving / will they pay / who has Money, Authority, Need?" is how you find out why the current process exists.
2. **Model + action → specification.** A business question that cannot be written as math-in and policy-out is not an AI project. A policy that copies a data bug is specification gaming with a dashboard.
3. **Great filters at maturity → agents.** Defending position and not getting disrupted is where incumbents buy agents. Klarna is an incumbent tearing up its own service fence. DAVID is an incumbent putting a review step in. That is BMP5203 material.

Jevons belongs in the close of every option: AI does not relax competition; it raises the integration bar.

### 4.4 Timing risk

BSE3713 already spends ~15 minutes on Part 4 and ~15 on "what is AI." The agentic deck is a half-day. The failure mode is obvious: the business half runs long (filters love to expand), and agents become a trailer.

Hard caps, whichever option you pick:

- Filters + startup cases ≤ 30 minutes.
- Required trio + model/action ≥ 20 minutes (they asked for this; it cannot be a drive-by).
- Agentic substance ≥ 20 minutes (definition + design rule + two cases).
- Close ≤ 5.

Option D is the one most likely to blow the cap. Option C is the one most likely to feel thin on "business." Option A is the one most likely to feel like two lectures. Option B is the one most likely to feel like one lecture, if the opening diagnosis is kept to twelve minutes.

### 4.5 Discussion

These students will talk if you let them. Budget **one** structured beat, not a circulating seminar:

- After Chesterton: "Name a fence in a firm you have worked in that a consultant would delete in week one."
- Or after How not to: "Where have you seen a correct model produce a stupid policy?"
- Or after Klarna: "What metric would your last employer have accidentally maximised?"

Do not do all three. Option B takes the first; Option C the second; Option D the third.

---

## 5. Recommendation

**Build Option B (Fence).**

It is the only shape that treats the three mandated topics as the lecture rather than as a compliance checklist, and it is the only shape whose thesis is native to BMP5203 rather than to BSE3713 or to the agentic workshop.

Why not the others, in short:

- **A** is the safe port of the old deck. Fine if you want muscle memory. It teaches "startups, *then* a warning about frameworks, *then* AI," which is two subjects and a moral. The audience did not sign up for a founding course.
- **C** is the right lecture for a corporate-AI elective that already did strategy last week. If the module owner tells you the competitive-strategy half is covered, switch to C. Until then, cutting Juicero and the filters wastes the entrepreneurship in the room and leaves Chesterton floating.
- **D** is the best night-time version and the worst to time. Use its case order as a seasoning pass over B (tell Juicero and Klarna fully; do not also tell WebVan, three devices, Sakana, *and* Chevy).

### 5.1 What to steal, slide-for-slide, when we build B

From BSE3713 Part 4, almost verbatim:

- Hayek quote
- MBA-student disease / Chesterton comparison (symptoms + cure)
- How to use AI in business (model / action diagram)
- How *not* to (Chrome)
- Adoption (definition + buy-in) in compressed form
- Dangers: moat, unexpected behaviour, subsidy (platform optional)

From BSE3713 Parts 1-2, rebuilt shorter:

- One failure/de-risk slide
- One filters slide (all six, no staged reveal across six decks)
- Juicero + "what were investors buying?"
- MAN, single example (prefer the surgical imager: they have seen capital approval)

From the agentic decks, rebuilt for managers:

- Jevons (one block)
- "Fancy autocomplete" + "has our words, not our world" (one slide, skip Chinese Room by name if time is tight; keep the claim)
- Specification gaming (paperclip in a sentence; delete-the-tests / mark-no-action as the real examples)
- Agent = LLM + harness + loop
- Five principles for imperfect agents
- Complexity ladder (one small stack)
- Klarna vs DAVID + Hippocratic
- Replit *or* Chevy (not both unless one is a single screenshot)
- Skip: tokens, attention, price tables, prompting sequence, OpenClaw tour, swarms, LangFlow, skills marketplace, hands-on)

Close from BSE3713 slides 79 and 81 (working *on* AI; working in a big company). Drop "should I build a startup?"

### 5.2 Working title

**Chesterton's Fence, then the model**
Subtitle: *Judgment, AI, and the fences you are about to automate.*

(Internal: still a BMP5203 guest lecture on business and AI. Do not print "MBA-student disease" in the title.)

### 5.3 Success test

After 90 minutes a student can, without notes:

1. List two symptoms of MBA-student disease and state Chesterton's test in one sentence.
2. Draw the model/action square and put the Chrome failure on it.
3. Say what an agent adds to an LLM, and name one design rule that would have changed Klarna or Replit.

If they can also name a filter they are currently looking at in their own job, that is extra.

---

## 6. Open questions before slides

1. **Confirm with the module owner** whether strategy/IO is already taught in depth. If yes, slide toward C (keep Chesterton as the opening, cut Juicero to five minutes).
2. **Demo or no demo.** A two-minute "agent deletes something it was told not to" recording is worth more than a live Copilot. Default: no live demo.
3. **Which MAN example.** Surgical imager unless the cohort is more consumer than health/B2B.
4. **Replit vs Chevy.** Replit if you want blast radius / irreversibility. Chevy if you want theory of mind and "the bot can bind the firm." Slight preference for Chevy in a strategy course (liability, brand, jailbreak). Replit if you want a bridge to "vibe coding is not a company."
5. **Format of the deck.** BSE3713 is being converted to HTML; the agentic tutorial is Typst/Touying. Pick one stack before drafting. Recommendation: whatever BMP5203 already projects, not a third aesthetic.

Next step after a choice: a slide-level outline (one line per slide, speaker-note bullets, reuse vs rewrite) in this file or a sibling `OUTLINE.md`.
