# Contract: Visitor journeys

The public web portfolio must remain functionally equivalent. These journeys are the acceptance surface for FR-009 / SC-005.

| ID | Journey | Actor | Expected outcome |
|----|---------|-------|------------------|
| VJ-1 | Home / landing | Visitor | Introduction section loads (profile, contacts, resume entry). |
| VJ-2 | Navigate sections | Visitor | About, experience, and projects are reachable via app bar / drawer on all breakpoints. |
| VJ-3 | Project browsing | Visitor | Project cards list; detail/description and outbound project URL still work. |
| VJ-4 | Theme switch | Visitor | Dark/light toggle changes `themeMode` using tokens from `lib/src/constants/theme.dart`. |
| VJ-5 | Language switch | Visitor | Locale toggle switches between supported ARB languages; visible copy is localized. |
| VJ-6 | Contact / outbound | Visitor | Contact icons and other `url_launcher` links open the same targets as today. |
| VJ-7 | Responsive layout | Visitor | Layouts adapt at existing `Responsive` mobile / tablet / desktop breakpoints without overflow that did not exist before. |

**Invariants**:

- No new hard-coded user-visible strings.
- No ad-hoc colors/typography in feature widgets to “fix” FCS 8.
- Feature-first folders and Riverpod `ref.watch` / `ref.read` remain the state approach.
- Path URLs (no `#`) remain enabled via `usePathUrlStrategy()`.

**Verification**: Manual or widget-test walkthrough on a 3.47 web run/build at mobile, tablet, and desktop widths.
