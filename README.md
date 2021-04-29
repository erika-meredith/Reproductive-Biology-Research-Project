# REPRODUCTIVE BIOLOGY RESEARCH PROJECT
 
 Developing network visualizations and dataset sorting protocols as part of a computational framework for identifying and analyzing the role of certain oocyte-enriched proteins in cardiovascular and other body systems. More info here:
 
https://docs.google.com/document/d/1th9heHaqQxIMf9pjSuLGwXiMder7LXRZebHK_QeqJ5E/edit?usp=sharing

## WORKFLOW

### PYTHON VIA JUPYTER NOTEBOOKS:
- Load data from BioGPS database 
- Sort dataframe into subsets based on various conditional expression levels
- Export subsets as CSV files labeled to indicate its conditional parameters

### R VIA RSTUDIO:
- Load CSV files in R
- Extract list of Affymetrix IDs from each dataset
- Manually query BioGPS database with retrieved Affymetrix IDs in ~600 gene batches 
- Export entrez gene lists from BioGPS and upload them to scholar
- Load new gene list files as CSV
- run PANEV dataPreparation function with each gene list to generate a dataset of the genes and their corresponding identifiers in various databases (ensembl, entrez, common, etc.)
- run PANEV networkVisualization with each dataPreparation output file to generate a folder including the resulting raw gene data in TXT format and the network visualization in HTML format 


## TODO
- [ ] need csvs for original and resulting gene lists 
- [ ] add just heart and just oocyte sets as well
- [ ] RShiny application/Building Modularity (function making!)
- [ ] Build out sort functionality for the full pathway list CSV file
