library("MASS")
library("GenomicRanges")
load("/Users/LALS07/Desktop/ESF_final_data_freeze/SMC_neoadj.RData")
Mutations <- ESF$mut_call
Mutations <- Mutations[!Mutations$mut_effect %in% c("noncoding","noncoding_rna","synonymous","ambiguous","","splice_site"),]

Mutations$Variant <- paste(Mutations$chrom,Mutations$position,Mutations$gene_symbol,Mutations$ref,Mutations$var,sep="")

Mutations <- Mutations[!duplicated(Mutations$Variant),]

Mutations$start <- Mutations$position
Mutations$end <- Mutations$position

# #Mutations[Mutations$mut_type=="insertion",]$start <- Mutations[Mutations$mut_type=="insertion",]$start + (nchar(Mutations[Mutations$mut_type=="insertion",]$var)-1)
# 
# 
# Mutations[Mutations$mut_type=="deletion",]$end <- Mutations[Mutations$mut_type=="deletion",]$end + (nchar(Mutations[Mutations$mut_type=="deletion",]$var)-2)
# 
# Mutations <- Mutations[,c("chrom","start","end","ref","var")]

#write.table(Mutations[,c("chrom","start","end")],"/Users/LALS07/Desktop/SMC_Indel_SNVs_lists.txt",sep="\t",col.names=T,row.names=F,quote=F)

# Read in and parse mutations.
f1 <- read.table("/Users/LALS07/Desktop/OB_15_0053_WES_1.readcount_edited",sep="\t",header=F,fill=TRUE,col.names= paste0("V",seq_len(25)))

f1 <- f1[,!colnames(f1) %in% names(which(sapply(f1, function(x)all(is.na(x)))))]

colnames(f1)[1:4] <-c("chrom","position","Ref","Total.Reads")

library(stringr)


#apply(f1,1,function(x){str_split(x,":")[[1]]})
