library(bibliometrix)

file <- "data/scopus.bib"

M <- convert2df(file = file, dbsource = "scopus", format = "bibtex")

# Create a country collaboration network

M <- metaTagExtraction(M, Field = "AU_CO", sep = ";")
NetMatrix <- biblioNetwork(M, analysis = "collaboration", network = "countries", sep = ";")

# Plot the network
net=networkPlot(NetMatrix, n = dim(NetMatrix)[1], 
                Title = "Country Collaboration", 
                type = "circle", size=TRUE, 
                remove.multiple=FALSE,labelsize=0.7,cluster="none")
