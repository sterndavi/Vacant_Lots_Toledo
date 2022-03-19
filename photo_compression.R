library(magick)

path_photos <- 
    "data/photos/"


pics <- list.files(glue::glue("{path_photos}full size"), pattern = ".jpeg")
pics <- append(pics, list.files(glue::glue("{path_photos}full size"),pattern = ".jpg"))
pics <- append(pics, list.files(glue::glue("{path_photos}full size"),pattern = ".png"))

resize_pics <- function(files,from,to){
    
    
    for(i in files){
        
        filename <- i
        foto <- magick::image_read(glue::glue("{from}{i}"))
        foto <- image_scale(foto, "x600")
        
        image_write(foto, quality = 0.7, path = glue::glue("{to}{filename}"))
    }                  
    
}

resize_pics(files = pics,
            from = glue::glue("{path_photos}/full size/"),
            to = glue::glue("{path_photos}/compressed/")
            )
            
            