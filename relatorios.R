library(pdftools)

arquivos <- dir("pdf/", full.names = TRUE)

relatorios <- purrr::map(arquivos, pdf_text)
destinos <- paste0("txt/ra", 12:18, ".txt")

purrr::walk2(relatorios, destinos, readr::write_lines)



