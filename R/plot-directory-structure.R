# DiagrammeR directory structure
library(DiagrammeR)
library(DiagrammeRsvg)
library(rsvg)

my_dirs <- grViz(
  "digraph{
  # Up-down orientation
  graph[rankdir = UD]
  
  # Define node shape and font
  node[shape = folder, fontname = 'Atkinson Hyperlegible']
  
  # Define some nodes and relabel A
  1; A; B; C; D; E; F; G; H; I;   # J;
  
  1[label = '/', color = '#74C9E5']
  B[color = '#74C9E5']
  E[color = '#74C9E5']
  H[color = '#74C9E5']
  #J[color = '#74C9E5']
  
  
  # Define the edges to be in black
  edge[color = black, arrowhead = none]
  1 -> A 1 -> C 1 -> D
  B -> F B -> G E -> I
  
  # Define the edges for the path in red                   
  edge[color = '#E73037', arrowhead = none]
  1 -> B E -> H B -> E  #H -> J
  }" 
)

my_dirs

my_dirs |> export_svg() |> 
  charToRaw() |>  
  rsvg_svg("img/directory-structure.svg")
  #rsvg_png("img/directory-structure.png", width = 1600, height = 1600)

relative_path <- grViz(
  "digraph{
  # Up-down orientation
  graph[rankdir = UD]
  
  # Define node shape and font
  node[shape = folder, fontname = 'Atkinson Hyperlegible']
  
  # Define some nodes and relabel A
  PP; data; R; img; outputs; survey; script; plot; table
  
  PP[label = 'penguin-project', color = '#74C9E5']
  data[color = '#74C9E5']
  survey[label = 'survey-2024-02-27.csv', color = '#74C9E5']
  script[label = 'analysis-2024-02-27.R', color = '#74C9E5']
  R[color = '#74C9E5']
  plot[label = 'plot-2024-02-14.png']
  table[label = 'table-2024-02-20.csv']
  
  # Define the edges to be in black
  edge[color = black, arrowhead = none]
  PP -> outputs PP -> img img -> plot outputs -> table
  
  
  # Define the edges for the path in red                   
  edge[color = '#E73037', arrowhead = none]
  PP -> data PP -> R data -> survey R -> script 
  
  }" 
)

relative_path|> 
  export_svg() |> 
  charToRaw() |>  
  rsvg_svg("img/relative-path.svg")
