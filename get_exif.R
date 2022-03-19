
get_exif <- function(file) {
    call_exiftool <- paste("exiftool -n -csv", paste(shQuote(file), collapse = " "))
    
    return(read.csv(textConnection(system(
        call_exiftool, intern = T
    )), stringsAsFactors = F))
}


files <- glue::glue("data/photos/full size/{list.files('data/photos/full size/')}") 

exif_data <- get_exif(files) %>% 
    select(FileName,
           DateTimeOriginal,
           GPSLatitude,
           GPSLongitude)

descriptive_data_template <- exif_data %>% 
    select(FileName) %>% 
    mutate(is_for_sale = "",
           is_cared_for = "",
           corner = "")

rio::export(exif_data,glue::glue("{here()}/data/csv/data.csv"))

rio::export(descriptive_data_template,glue::glue("{here()}/data/csv/descriptivedata.csv"))
