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
library(openalexR)

Ajournals <- c(
  "The Lancet Infectious Diseases",
  "The Lancet HIV",
  "Journal of Infection",
  "Clinical Microbiology and Infection",
  "Open Forum Infectious Diseases",
  "Clinical Infectious Diseases", 
  "Journal of Hospital Infection",
  "PLoS neglected tropical diseases",
  "Journal of Clinical Microbiology",
  "Emerging infectious diseases",
  "The Journal of Infectious Diseases",
  "BMC Infectious Diseases",
  "Emerging Microbes & Infections",
  "PLoS Pathogens",
  "Nature Microbiology"
)

Bjournals <- c(
  "The Lancet",
  "New England Journal of Medicine",
  "BMJ",
  "Proceedings of the National Academy of Sciences",
  "JAMA",
  "PLoS Medicine"
)

GHjournals <- c("The Lancet Global Health",
                "BMJ Global Health",
                "Journal of Global Health",
                "Annals of Global Health",
                "Globalization and Health",
                "The Lancet",
                "BMJ",
                "New England Journal of Medicine",
                "JAMA",
                "PLoS Medicine")

GH_results <- lapply(GHjournals, function(jn) {
  oa_fetch(entity = "sources", search = jn)
}) %>% bind_rows()


GH_results_filtered <- GH_results %>%
  filter(display_name %in% GHjournals 
         & last_publication_year >= as.numeric(format(Sys.Date(), "%Y"))-1)

main_results <- lapply(Ajournals, function(jn) {
  oa_fetch(entity = "sources", search = jn)
}) %>% bind_rows()

main_results_filtered <- main_results %>%
  filter(display_name %in% Ajournals 
         & last_publication_year >= as.numeric(format(Sys.Date(), "%Y"))-1) %>%
  mutate(team = "A")

# Check none missing
Ajournals[!Ajournals %in% main_results_filtered$display_name]


# B team journals 
## This is for general journals where we only want the infection relevant stuff
secondary_results <- lapply(Bjournals, function(jn) {
  oa_fetch(entity = "sources", search = jn)
}) %>% bind_rows()

secondary_results_filtered <- secondary_results %>%
  filter(display_name %in% Bjournals & 
           last_publication_year >= as.numeric(format(Sys.Date(), "%Y"))-1) %>%
  mutate(team = "B")

journals <- rbind(main_results_filtered, secondary_results_filtered)

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