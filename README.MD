# Mapping Vacant Lots in Toledo, Paraná, Brazil

First of all, the goal of this small project was to figure out how to extract GPS data from pictures and use it on a leaflet map. 

The easiest way to achieve that seems to be using the command line application from ExifTool. The function used can be found in the file get_exif.R and was made using this tutorial: https://paleolimbot.github.io/tutorial/rexiftool.html

Afterwards, I used the magick library to compress the photos, since the output is a html flexdashboard file I didn't want it occupy too much space.

One small discovery that I made, while trying to build the popups using crosstalk objects, is that you need to extract the photos paths as a vector from the crosstalk object to be able to plot it on a leaflet map, works flawlessly and does not mess up with the finicky nature of the crosstalk lib.

the final product can be found here: https://sterndavi.github.io/vacant.lots.toledo/
