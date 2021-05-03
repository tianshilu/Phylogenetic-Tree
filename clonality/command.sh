source activate pyclone
python generate_tree.py  -code_dir /project/CRI/Zhu_lab/s171162/Tree/code -method PyClone -sample_name test_sample -maf_file /project/CRI/Zhu_lab/s171162/Tree/data/input_files/TCGA_SKCM/TCGA-D9-A148-06.maf.txt -cnv_file /project/CRI/Zhu_lab/s171162/Tree/data/input_files/TCGA_SKCM/TCGA-D9-A148-06.cnv.txt  -output_dir /project/CRI/Zhu_lab/s171162/Tree/phylogenic_tree/test_output6 -phylo_code /project/CRI/Zhu_lab/s171162/Tree/package/phylowgs-master/
module load R/3.5.1-gccmkl
python generate_tree.py  -code_dir /project/CRI/Zhu_lab/s171162/Tree/code -method SciClone -sample_name test_sample -maf_file /project/CRI/Zhu_lab/s171162/Tree/data/input_files/TCGA_SKCM/TCGA-D9-A148-06.maf.txt -cnv_file /project/CRI/Zhu_lab/s171162/Tree/data/input_files/TCGA_SKCM/TCGA-D9-A148-06.cnv.txt  -output_dir /project/CRI/Zhu_lab/s171162/Tree/phylogenic_tree/test_output6 -phylo_code /project/CRI/Zhu_lab/s171162/Tree/package/phylowgs-master/
source activate phyloWGS
PERL5LIB=""
LD_LIBRARY_PATH=~/.conda/envs/phyloWGS/lib/
export LD_LIBRARY_PATH
python generate_tree.py  -code_dir /project/CRI/Zhu_lab/s171162/Tree/code -method PhyloWGS -sample_name test_sample -maf_file /project/CRI/Zhu_lab/s171162/Tree/data/input_files/TCGA_SKCM/TCGA-D9-A148-06.maf.txt -cnv_file /project/CRI/Zhu_lab/s171162/Tree/data/input_files/TCGA_SKCM/TCGA-D9-A148-06.cnv.txt  -output_dir /project/CRI/Zhu_lab/s171162/Tree/phylogenic_tree/test_output6 -phylo_code /project/CRI/Zhu_lab/s171162/Tree/package/phylowgs-master/
