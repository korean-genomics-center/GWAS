## For phenotype normalization and standardization ##


##
library(data.table)
##

## Main ##
dt <- fread("<File: Phenotype data.txt>")
dt_colname <-colnames(dt)

refined_dt <- dt$ID
for(i in 2:ncol(dt))
{
        list <- dt[,get(dt_colname[i])]
        target_mean <- mean(dt[,get(dt_colname[i])], na.rm=TRUE)
        target_sd <- sd(dt[,get(dt_colname[i])], na.rm=TRUE)

        max_cut <- target_mean + 3*target_sd
        min_cut <- target_sd - 3*target_sd

        list[list > max_cut] <- NA
        list[list < min_cut] <- NA

        INT_list <- qnorm((rank(list,na.last="keep")-0.5)/sum(!is.na(list)))

        temp <- as.data.table(INT_list)
        refined_dt <- cbind(refined_dt, temp)

}
colnames(refined_dt) <- dt_colname
write.table(refined_dt,"<File: output file>", sep = "\t", quote = FALSE, row.namse = FALSE)
####


