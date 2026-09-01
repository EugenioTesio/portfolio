# Contract: Highlight styling

Applies to every experience description rendered in `ExperienceCard`.

## Theme token

| Theme | Token | Value |
|-------|--------|--------|
| Light | `HighlightColors.emphasis` | `#C2410C` (`Color(0xFFC2410C)`) |
| Dark | `HighlightColors.emphasis` | `#FF8000` (`Color(0xFFFF8000)`) |

- Defined and attached in `lib/src/constants/theme.dart` (constitution IV).
- Feature widgets MUST use `Theme.of(context).extension<HighlightColors>()`.
- MUST NOT introduce a new pub color package.

## HTML mapping

| Markup in ARB | Visual |
|---------------|--------|
| `<strong>…</strong>` | Bold + `HighlightColors.emphasis` |
| `<b>…</b>` | Same as `strong` (alias) |
| Unmarked text | Default body color and weight |
| `<ul>` / `<li>` | Bullet list; no extra highlight |

Unmarked bullets still render. Empty `<strong></strong>` MUST NOT crash the parser.

## Html style keys (ExperienceCard)

Required `Html(style:)` entries:

- `body`: zero margin and padding (card already pads 12).
- `ul`: compact left padding for bullets; no large default HTML indent that overflows mobile.
- `li`: spacing between bullets that still fits SC-005 wrapping.
- `strong` and `b`: `fontWeight: FontWeight.bold`, `color: emphasis`.

Do not style `em` as orange unless a future spec asks for italics-as-highlight. Company context (`ueno bank`) is italic **company line** text, not HTML `<em>` inside the description (unless the description itself contains the product name in `<strong>`).

## Contrast and themes

- Switching light/dark MUST change emphasis to the matching token without a reload beyond existing theme provider behavior.
- Highlight color MUST remain distinct from surrounding body text in both themes.
- Mobile wrapping MUST not clip the last line of a bullet.

## Out of scope

- Downloadable resume PDFs.
- Highlighting technology chips (chips stay as today).
- Orange highlights in About or Projects.
