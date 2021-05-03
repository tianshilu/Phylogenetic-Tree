# Phylogenetic-Tree Pipeline
An emsembled software easy for inferring clones from mutations. 
## Dependencies
PhyloWGS:python2, NumPy and SciPy (python2), ETE2 (python2), GSL
SciClone:R (version >= 3.5), IRanges, devtools, 
Pyclone: python (version>2), numpy, pandas
## Guide
### Command for PhylowGS
```python generate_tree.py  -code_dir /project/CRI/Zhu_lab/s171162/Tree/code -method PhyloWGS -sample_name test_sample -maf_file /proje\
ct/CRI/Zhu_lab/s171162/Tree/data/input_files/TCGA_SKCM/TCGA-D9-A148-06.maf.txt -cnv_file /project/CRI/Zhu_lab/s171162/Tree/data/inpu\
t_files/TCGA_SKCM/TCGA-D9-A148-06.cnv.txt  -output_dir /project/CRI/Zhu_lab/s171162/Tree/phylogenic_tree/test_output6 -phylo_code /p\
roject/CRI/Zhu_lab/s171162/Tree/package/phylowgs-master/
```
 ### Command for PyClone
 ``` python generate_tree.py  -code_dir /project/CRI/Zhu_lab/s171162/Tree/code -method PyClone -sample_name test_sample -maf_file /projec\
t/CRI/Zhu_lab/s171162/Tree/data/input_files/TCGA_SKCM/TCGA-D9-A148-06.maf.txt -cnv_file /project/CRI/Zhu_lab/s171162/Tree/data/input\
_files/TCGA_SKCM/TCGA-D9-A148-06.cnv.txt  -output_dir /project/CRI/Zhu_lab/s171162/Tree/phylogenic_tree/test_output6 -phylo_code /pr\
oject/CRI/Zhu_lab/s171162/Tree/package/phylowgs-master/
```
### Command for SciClone
``` python generate_tree.py  -code_dir /project/CRI/Zhu_lab/s171162/Tree/code -method SciClone -sample_name test_sample -maf_file /proje\
ct/CRI/Zhu_lab/s171162/Tree/data/input_files/TCGA_SKCM/TCGA-D9-A148-06.maf.txt -cnv_file /project/CRI/Zhu_lab/s171162/Tree/data/inpu\
t_files/TCGA_SKCM/TCGA-D9-A148-06.cnv.txt  -output_dir /project/CRI/Zhu_lab/s171162/Tree/phylogenic_tree/test_output6 -phylo_code /p\
roject/CRI/Zhu_lab/s171162/Tree/package/phylowgs-master/
```
