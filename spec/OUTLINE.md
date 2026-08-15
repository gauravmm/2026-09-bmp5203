# Option A — slide contract

90-minute BMP5203 guest lecture. Touying + metropolis, same helpers as `agentic-ai-tutorial`. Compile from repo root:

```sh
typst compile --root . slides.typ
```

Each `sections/*.typ` is included from `slides.typ` after the theme is applied. Import what you need at the top of the section file:

```typst
#import "@preview/touying:0.7.4": *
#import "/common.typ": gblock, lblock, aside, hbar, filter-card, stub, accent
```

Do **not** apply the theme again. Use `== Slide title` for slides, `= Section` for numbered section dividers (auto via `big-section-slide`), `#speaker-note[...]`, `#pause`. One idea per slide. Prefer grids and `gblock`/`lblock` over dense bullets.

British spelling (optimise, specialise) except established US proper nouns.

Images live in `media/`. Figures in `figures/`. Include figures as `#include "/figures/simple-llm.typ"`.

If a slide is not ready to draw, use `#stub(( [outcome], ... ))[optional body]` rather than inventing a half-diagram.

---

## 00-open.typ — Opening (~5 min)

`= Outline <touying:hidden>` then a hidden-about? Follow 01-introduction: about-me is `<touying:hidden>` so it does not steal a section number. Opening content *before* the first real `=` section.

1. **About me** (`== About Me <touying:hidden>`). Portrait `media/portrait.jpg`. Bullets: Founder, Visigoth.ai (SaaS); Founder, Ocellivision @ A\*STAR; Research Scientist, IMCB, A\*STAR; PhD AI/ML, Carnegie Mellon; Sc.B. (Hons) CS, Brown. Tiny: opinions are my own; consulting `gaurav@gauravmanek.com`.
2. **Agenda** (`== Agenda <touying:hidden>`). Numbered 1–5, not the old four-part BSE3713 map:
   1. How firms fail — stages, great filters
   2. Case studies — Juicero, WebVan
   3. The hinge — MBA-student disease and Chesterton's Fence
   4. How to use AI — model, action, agents
   5. Dangers and close
3. Speaker notes: this is BMP5203, not a founding course; tools first, then a warning about the tools.

## 01-filters.typ — How firms fail (~18 min)

`= How firms fail`

1. Quote slide (use `=` or a quote layout, not a new section): Musk, "Starting a company is like staring into the abyss and eating glass." Overline: Starting up a company. Can be a `focus-slide` *only if* imported from `themes.metropolis`. Safer: a normal slide with a large quote and attribution, matching 01-introduction quote style (big text, em-dash name).
2. **Startups tend to fail.** Two columns of `hbar`: left 1/3/5/10 year failure 20/39/50/65; right causes Financial 38, Market need 35, Competition 20, Business model 19, Legal 18. Footer tiny: US numbers, forbes.com/advisor/business/software/startups-failure-rate/. Notes: always teetering; failure is the default.
3. **Startups tend to fail** (causes only + callout). Same five cause bars. `gblock` or `lblock`: *How do we de-risk these?* Notes: this lecture is the toolkit.
4. **Stages of starting up.** Six numbered steps in a 3+3 flow (Idea → Prototyping → Go-to-market / Early Growth → Growth → Maturity) with the short glosses from the PPTX. Callout: *We're going to focus on the first half.*
5. **Stages — common frameworks.** Three `lblock` cards (no book-cover images): Howard Love / Startup J-Curve; Max Marmer / Startup Genome; Hishmeh & Chernychko / 6 Startup Stages. Notes: names differ, journey is the same.
6. **Which stages you see.** Reconstruct the role × firm-size chart. Columns: 1–5, 3–15, 15–50, 50–100, 100–1000. Rows: founder (all five cells on), consultant (middle three), founding employee (two middle-late), employee (last two, paler). Use filled `box`es, not an image.
7. **The Great Filters.** One 3×2 `filter-card` grid, all six at once (compressed; do not do the original six-slide reveal):
    - Validation — Is the problem worth solving? Does it solve the problem? Can you collect money?
    - Customer Discovery — Will someone actually pay? Can they pay? (The M.A.N.) What else do you need? Will the team fall apart?
    - Product–Market Fit — Enough people with the same problem? Consistent sales? Minor changes to sell more?
    - Expanding Everything — Sales channels and marketing? Scale production/ops/distribution? How to set prices?
    - Market Segments — How to add a new segment? (Bowling-alley model.)
    - Defending Position — CAGR? Complacency? Large players? Disruption? Shareholder value?

## 02-cases.typ — Juicero + WebVan (~18 min)

`= Case studies`

 1. Gates quote: "Success is a lousy teacher. It seduces smart people into thinking they can't lose."
 2. **Filter: Idea.** Four questions (problem worth solving / idea solves it / collect money / raise funds).
 3. **Juicero.** Image `media/juicero.jpg` + bullets: presses pre-made juice from mylar; machine US$400, pack $5–7; DRM so only original packs within best-before. Notes: product is the joke; the raise is the lesson.
 4. **How did they raise $120M?** Two screenshots: `media/juicero-guardian.png`, `media/juicero-techcrunch.png`. Notes: Guardian "widely mocked… shutting down"; TechCrunch "absurd avatar… but boy is it well-engineered."
 5. **What do investors look for?** Flow: Institutional investors (pension, insurance, endowments, SWF, family offices, HNW) → Investment fund → Startup. Caption: 5–7 years to return principal plus interest.
 6. **What do investors look for?** (light). Three points only: pressure (5–7 year window, compete for deals); they exit by selling to the *next* investor, so they optimise for the next investor — prone to fads; rule of thumb 100 → 10 break-even → 1 returns 100×. High-risk, high-return. Do not port the full three-card plus uncertainty essay.

`= Customer discovery` or keep under case studies — prefer a `==` not a new `=`.

 1. **Filter: Customer Discovery.** Four questions.
 2. **WebVan.** Image `media/webvan.gif` + raised $396M VC + $375M IPO; 1999 grocery delivery; famous 2001 bust. Callout: *Why did they go bankrupt?* Notes: ritual of grocery shopping; robotic warehouse capex; $2M/day burn; grocery is a tiny-margin business.

Skip FDA products, MAN candy/imager, Moore/hype, maturity CAGR.

## 03-hinge.typ — MBA disease, Chesterton, how to use AI (~22 min)

`= The hinge`

 1. Hayek quote: "Civilization rests on the fact that we all benefit from knowledge which we do not possess."
 2. **You may have MBA-student disease if** — two columns (`cmp-bad` / `cmp-good` via `lblock`, left slightly warmer/redder not required — use a bold "Symptoms" vs "The Cure · Chesterton's Fence"):
    Symptoms: "business is business" regardless of scale/geography/sector; every decision is a framework or NPV/IRR; immediately find where domain experts are obviously wrong; synergy / disruption / scalability without a referent; next-quarter over long-term; IT, Security, R&D are "overheads."
    Cure: articulate why it was built before changing it; know the specific technology/market trade-offs; test why customers actually come; document decisions and reread (prospect ≠ retrospect); the most valuable assets are often intangible.
    Notes: cattle futures settle in delivery (sometimes cash); hog futures are cash-only. *Why?*
 3. **How to use AI in business.** Reconstruct the 2×2:
    - Business row: Problem "Which website users will buy?" —(actioning)→ Policy "Email coupons to specific users."
    - Computational row: "Predict likelihood to buy from website traces." —(+ Time + Money + Data)→ "Given data, predicts odds that user will buy."
    - Down arrow labelled Modeling; up arrow labelled Actioning.
    Notes: a NN only takes/returns math. Modeling turns the business question into math; actioning turns math into a policy someone will run.
 4. **How NOT to use AI.** Same diagram, plus a bottom strip: Garbage in, garbage out — website doesn't work in Chrome → Email coupons to non-Chrome users.
 5. **AI adoption.** Two cards: (1) well-defined modeling and actioning — translate business ↔ math, realistic success metric, matches available data; (2) institutional buy-in — management KPI, pipeline funding, user-friendliness, which decisions stay with the user.
 6. **AI adoption — plumbing.** Data pipeline (quality, collected in the normal course of business, model drift) + infrastructure (cleaning, warehousing, sunsetting, compliance). Notes: not an install-once asset.

## 04-agents.typ — What an agent is + cases (~20 min)

`= What is an agent`

These slides do **not** exist in the PPTX. Port from `agentic-ai-tutorial` *compressed*, or stub.

 1. **What "AI" means + Jevons.** Port the 01-introduction "What Does AI Mean?" claim: AI is a marketing term; not magic. `lblock` Jevons: AI will not make work easier; it raises the bar; the moat is speed of integration.
 2. **Fancy autocomplete.** One slide: an LLM predicts the next token. That's it. Skip tokenizer, attention, billing tables.
 3. **Simple LLM vs Agentic AI.** Two columns including `/figures/simple-llm.typ` and `/figures/agentic-loop.typ`.
 4. **Anatomy / vocabulary.** Agent = LLM + harness (loop + tools). One short grid: Agent, Tool use, Human in the loop. Skip skills marketplace and sub-agent swarms.
 5. **Complexity ladder.** Four rungs: (1) single well-crafted prompt → (2) chain of prompts with checks → (3) single agent with memory + tools → (4) full multi-agent pipeline. Punchline: match tool and problem complexity; errors at lower rungs are cheaper.
 6. If 27–29 are too tight to finish well, ship **one** `#stub` named "What is an agent" with outcomes: (a) contrast chatbot vs agent, (b) name the loop, (c) name the ladder and why you start on rung 1.

`= Agents in the wild` or continue under the same section.

 1. **Two production patterns.** Left: Klarna — claimed work of 700 reps / $40M, quality decayed, CEO "we went too far." Logo `media/klarna.png`. Right: JPMorgan Ask D.A.V.I.D. — supervisor + specialists, human reviews every output; ~95% research-time cut. Logo `media/jpmorgan.png`. Notes: metric became the goal vs human-in-the-loop.
 2. **Alignment by scope.** Hippocratic — voice agents, post-discharge, never diagnoses; 0 reported severe-harm. Logo `media/hippocratic.png`. Optional second column: specification gaming one-liner (delete the failing tests / mark everything "no action").
 3. **Unexpected behaviour — Replit.** Image `media/replit-chat.png` (or `replit-1.png`). Deleted production DB against instructions; "catastrophic failure"; later backups/rollbacks. Callout: *AI agents are fallible; treat them as such.* Chevy (`media/chevy-tahoe.png`) is optional as a second slide or a one-line "also: a Tahoe for $1." Prefer one slide unless space is clean.

## 05-close.typ — Dangers + close (~7 min)

`= Dangers`

 1. Four cards: Moat, Platform risk, Unexpected behaviour, AI model subsidy. Sub: …and many, many more.
 2. **No defensible moat.** Short list (innovation / IP / network / trust-compliance). Image `media/docusign-lovable.png`. Caption: *What's their moat?* Notes: DocuSign = trust + certifications + some network effects; vibe-coding makes cloning cheap.
 3. **Platform risk.** Locked in on price, strategy, technology, uptime. Three examples max (X API 2023; ChatGPT vs Jasper; Google Maps 2018 hike). Do not dump the eight-item list.
 4. **AI model subsidy.** Image `media/ai-subsidy.png`. You charge $1, they pay the lab $10, the lab spent $50. Forecast from first principles. Callout: build to tolerate vastly greater AI prices.

`= In summary` (or hidden close)

 1. Pascal quote (optional, short).
 2. **When working on AI.** More than AI; don't be an LLM-wrapper; rising cost and competition; models are CAPEX; rent; buy-in; risk surface.
 3. **When working in a firm.** Merge startup + big-company: exploit and protect a comparative advantage; talk to customers; every big company was a startup; architecture/contracts/small concessions survive; prospect ≠ retrospect.
 4. Jevons one-liner reprise if it is not already on 25.
 5. **Thank you.** Name, email, optional QR via `#qrcode("https://gauravmanek.com")` or omit. No "should I build a startup?" slide.

---

## Cuts (do not port)

Exit plan matrix, investment rounds, dilution, empire vs exit, missionary vs mercenary, funding-gap deep dive, employees vs founders, FDA trio, MAN candy/imager/database, Moore + hype cycle, maturity CAGR, NN training tables, tokenizer/attention/billing, prompting workshop, OpenClaw, swarms, LangFlow, hands-on tasks.
