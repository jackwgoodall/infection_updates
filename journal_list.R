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
  "The New England Journal of Medicine",
  "BMJ",
  "Proceedings of the National Academy of Sciences",
  "JAMA"
)


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

journals_df <- rbind(main_results_filtered, secondary_results_filtered)
# Save csv for the papers.qmd 
write_csv(journals_df, file = "journals.csv")
