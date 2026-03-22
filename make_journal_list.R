# generate_journals.R
# ─────────────────────────────────────────────────────────────────────────────
# Run this from your Quarto project root whenever journals.csv changes.
#
#   Rscript generate_journals.R
#
# It prints two things to paste into papers.qmd:
#   1. The journal tag <span> elements  → inside <div id="aJournalTags"> / <div id="bJournalTags">
#   2. The JS Set lines                 → replace the selectedAJournals / selectedBJournals lines
# ─────────────────────────────────────────────────────────────────────────────

journals <- read.csv("journals.csv", stringsAsFactors = FALSE)

if (!"team" %in% names(journals)) journals$team <- "A"

a <- journals[journals$team == "A", ]
b <- journals[journals$team == "B", ]

build_tags <- function(jdf, team) {
  paste0(
    '    <span class="concept-tag active" data-id="', jdf$id,
    '" data-team="', team, '">',
    jdf$display_name, '</span>',
    collapse = "\n"
  )
}

a_ids <- if (nrow(a) > 0) paste0("'", a$id, "'", collapse = ", ") else ""
b_ids <- if (nrow(b) > 0) paste0("'", b$id, "'", collapse = ", ") else ""

cat("══ 1. Paste inside <div id=\"aJournalTags\"> ══════════════════════════\n\n")
if (nrow(a) > 0) cat(build_tags(a, "A"), "\n") else cat("  (no A-team journals)\n")

cat("\n══ 2. Paste inside <div id=\"bJournalTags\"> ══════════════════════════\n\n")
if (nrow(b) > 0) cat(build_tags(b, "B"), "\n") else cat("  (no B-team journals yet)\n")

cat("\n══ 3. Replace the two JS Set lines in <script> ═══════════════════════\n\n")
cat(paste0("  let selectedAJournals = new Set([", a_ids, "]);\n"))
cat(paste0("  let selectedBJournals = new Set([", b_ids, "]);\n"))
cat("\n")
cat("─── Summary: ", nrow(a), "A-team,", nrow(b), "B-team ───\n")