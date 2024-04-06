
# start: ------------------------------------------------------------------
# loading packages
suppressPackageStartupMessages({
  library(tidyverse)
  library(hexSticker)
  library(magick)
})

# logo 3: -----------------------------------------------------------------
logo <- ggplot2::ggplot() +
  geom_rect(aes(xmin = -1, xmax = 1, ymin = -1, ymax = 1), fill = "white") +
  geom_text(aes(x = 0, y = 0), label = "", size = 20, color = "darkblue") +
  theme_void()

hexSticker::sticker(
  subplot = logo,
  package = "idswb",
  # s - subplot details
  s_x=0, # centered
  s_y=0, # gives a little bit of margin with title
  s_width=0, # make it a little wider
  s_height=1,
  p_color = "white",
  p_fontface = "bold",
  p_size=50,
  p_x = 1,
  p_y = 1,
  h_fill = "lightblue",
  h_color = "green",
  h_size = 2,
  url = "https://github.com/Teal-Insights/",
  u_size = 4,
  u_color = "violetred",
  l_x = 1,
  l_y = 1,
  l_width = 3,
  l_height = 3,
  l_alpha = 0.3,
  dpi=500,
  filename = "inst/logo/inst_logo.png"
)

# usethis::use_logo("inst/logo/inst_logo.png")

# End: --------------------------------------------------------------------
