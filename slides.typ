#import "@preview/touying:0.7.4": *
#import themes.metropolis: *

#import "@preview/tiaoma:0.3.0": qrcode
#import "@preview/numbly:0.1.0": numbly
#import "/common.typ": accent, big-section-slide, gblock, lblock

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  config-common(
    new-section-slide-fn: big-section-slide,
    receive-body-for-new-section-slide-fn: true,
  ),
  config-info(
    title: [Decision-Making in Business & AI],
    subtitle: [BMP5203 Competitive Strategy, Digitisation, and AI],
    author: [Dr. Gaurav Manek],
    date: datetime.today(),
    institution: [NUS BMP5203],
    logo: [🤖💥🧠],
  ),
)

#set heading(numbering: numbly("{1}.", default: "1.1"))

// Deck-wide list style. Slides that need tighter or looser bullets override the
// spacing only — the marker is set here, once.
#set list(marker: text(fill: accent)[•], spacing: 0.4em)

#title-slide()

#include "sections/00-open.typ"
#include "sections/01-filters.typ"
#include "sections/02-cases.typ"
#include "sections/03-hinge.typ"
#include "sections/04-agents.typ"
#include "sections/05-close.typ"
