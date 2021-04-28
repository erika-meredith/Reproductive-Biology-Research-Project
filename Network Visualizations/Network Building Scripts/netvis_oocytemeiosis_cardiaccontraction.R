#LOAD LIBRARIES

library(devtools)
library(disgenet2r)
library("biomaRt")
library("PANEV")

#LOAD DATASETS FROM JUPYTER: HIGH ENRICHMENT PROFILES IN BOTH OOCYTE AND HEART

df2_3XM_ooc_3XM_heart <- read.csv("Repro Project/df2_3XM_ooc_3XM_heart.csv")
df2_3XM_ooc_10XM_heart <- read.csv("Repro Project/df2_3XM_ooc_10XM_heart.csv")
df2_10XM_ooc_3XM_heart <- read.csv("Repro Project/df2_10XM_ooc_3XM_heart.csv")
df2_10XM_ooc_10XM_heart <- read.csv("Repro Project/df2_10XM_ooc_10XM_heart.csv")

#CONVERT GENE IDs FROM AFFYMETRIX TO ENTREZ

##################### OOCYTE 3X MEDIAN ENRICHMENT AND CARDIAC 3X MEDIAN ENRICHMENT #########################

my3by3IDs <- colnames(df2_3XM_ooc_3XM_heart)
write.csv(my3by3IDs, file = "my3by3IDs.csv", row.names = FALSE)
#writing gene ID list to csv so that I can perform manual queries of the BioGPS database
#need to split up each file into groups of about 530 IDs so query isn't too large
#saved and uploaded the entrez converted gene id list to scholar workspace for use in panev
my3by3IDs.converted <- panev.dataPreparation(in.file = "my3by3genelist.csv",
                                             gene_id = "entrez", 
                                             biomart.species =  "mmusculus_gene_ensembl")
#mapping by cardiac contraction and oocyte meiosis pathways
FL.gene <- c("path:map04114","path:map04260")
panev.network(in.file = "my3by3genelist_converted.txt", 
              out.file = "threebythree_network", 
              species = KEGG.species.mmu, 
              FL = FL.gene, 
              levels = 2)

##################### OOCYTE 3X MEDIAN ENRICHMENT AND CARDIAC 10X MEDIAN ENRICHMENT #########################

my3by10IDs <- colnames(df2_3XM_ooc_10XM_heart)
write.csv(my3by10IDs, file = "my3by10IDs.csv", row.names = FALSE)
my3by10IDs.converted <- panev.dataPreparation(in.file = "my3by10genelist.csv",
                                             gene_id = "entrez", 
                                             biomart.species =  "mmusculus_gene_ensembl")
FL.gene <- c("path:map04114","path:map04260")
panev.network(in.file = "my3by10genelist_converted.txt", 
              out.file = "threebyten_network", 
              species = KEGG.species.mmu, 
              FL = FL.gene, 
              levels = 2)

##################### OOCYTE 10X MEDIAN ENRICHMENT AND CARDIAC 3X MEDIAN ENRICHMENT #########################

my10by3IDs <- colnames(df2_10XM_ooc_3XM_heart)
write.csv(my10by3IDs, file = "my10by3IDs.csv", row.names = FALSE)
my10by3IDs.converted <- panev.dataPreparation(in.file = "my10by3genelist.csv",
                                              gene_id = "entrez", 
                                              biomart.species =  "mmusculus_gene_ensembl")
FL.gene <- c("path:map04114","path:map04260")
panev.network(in.file = "my10by3genelist_converted.txt", 
              out.file = "tenbythree_network", 
              species = KEGG.species.mmu, 
              FL = FL.gene, 
              levels = 2)

##################### OOCYTE 10X MEDIAN ENRICHMENT AND CARDIAC 10X MEDIAN ENRICHMENT #########################

my10by10IDs <- colnames(df2_10XM_ooc_10XM_heart)
write.csv(my10by10IDs, file = "my10by10IDs.csv", row.names = FALSE)
my10by10IDs.converted <- panev.dataPreparation(in.file = "my10by10genelist.csv",
                                              gene_id = "entrez", 
                                              biomart.species =  "mmusculus_gene_ensembl")
FL.gene <- c("path:map04114","path:map04260")
panev.network(in.file = "my10by10genelist_converted.txt", 
              out.file = "tenbyten_network", 
              species = KEGG.species.mmu, 
              FL = FL.gene, 
              levels = 2)

