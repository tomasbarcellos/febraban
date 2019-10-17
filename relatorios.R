library(pdftools)
library(tidyverse)

compactar <- function(str) {
  str %>% 
    str_split("\\r?\\n") %>% 
    unlist()
}

arquivos <- dir("pdf/", full.names = TRUE)
destinos <- paste0("txt/ra", 12:18, ".txt")

relatorios <- map(arquivos, pdf_text)
relatorios_limpo <- map(relatorios, compactar) %>% 
  map(str_squish) %>% 
  map(str_trim)

walk2(relatorios_limpo, destinos, readr::write_lines)



