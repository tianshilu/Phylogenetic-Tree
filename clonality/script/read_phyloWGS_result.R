#read json file
library("rjson")
all_trees= fromJSON(file = "/project/CRI/Zhu_lab/s171162/Tree/phylogenic_tree/TCGA_validation/phyloWGS/skcm_2015_TCGA-D3-A1Q1/phylo.summ.json.gz")
# Find the tree with highest llh
best_tree_idx=which.max(unlist(sapply(all_trees$trees,function(x) x$llh)))
best_tree=all_trees$trees[[best_tree_idx]]$structure
mutations_in_each_cluster= fromJSON(file = paste0('/project/CRI/Zhu_lab/s171162/Tree/phylogenic_tree/test_output6/PhyloWGS/',best_tree_idx,'.json'))

sciclone=read.table('/project/CRI/Zhu_lab/s171162/Tree/phylogenic_tree/test_output6/SciClone/sciclone_output.txt',sep='\t',stringsAsFactors = F,header = T)

pyclone=read.table('/project/CRI/Zhu_lab/s171162/Tree/phylogenic_tree/test_output6/PyClone/test_sample.table.txt',sep='\t',stringsAsFactors = F,header = T)

unlist(sapply(mutations_in_each_cluster$mut_assignments,function(x) length(x$ssms)))
table(sciclone$cluster)
table(pyclone$cluster_id)