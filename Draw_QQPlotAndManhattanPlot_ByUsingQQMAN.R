##
library(qqman)
library(data.table)
##


## Main ##
dt <- fread("<File: plink gwas result file>")

manhattan(dt,
        col = c("blue4", "orange3"),
        )

qq(dt$P)
####


