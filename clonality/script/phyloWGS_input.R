####################### user input ####################### 
args = commandArgs(trailingOnly =TRUE)
maf_file=args[1]
output_dir=args[2]
maf_file=read.table(maf_file,sep='\t',stringsAsFactors = F,header = T)
#six columns: id, gene, a, d, mu_r, mu_v
#a: number of reference-allele reads at the variant locus.
#d: total number of reads at the variant locus.
#mu_r: fraction of expected reference allele sampling from the reference population. 
#mu_v: fraction of expected reference allele sampling from variant population.
seq_error_rate=0.001 #suppose seq error rate is 0.001
#remove na first 
maf_file=maf_file[!is.na(maf_file$ref_reads) & !is.na(maf_file$var_reads+maf_file$ref_reads),]
ssm_data=data.frame(id=paste0('s',c(0:(dim(maf_file)[1]-1))),gene=paste0(maf_file$chr,'_',maf_file$pos),
                    a=maf_file$ref_reads,d=maf_file$var_reads+maf_file$ref_reads,rep(1-seq_error_rate,dim(maf_file)[1]),rep(0.5-seq_error_rate,dim(maf_file)[1]))
colnames(ssm_data)=c('id','gene','a','d','mu_r','mu_v')
write.table(ssm_data,file=paste0(output_dir,'/ssm_data.tsv'),quote=F,col.names = T,row.names = F,sep='\t')