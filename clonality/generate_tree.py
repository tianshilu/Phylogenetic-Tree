import sys
import os
############################### help ###########################
args=sys.argv
help_menu='''\n Pipeline to build phylogenic tree.                                                                                                      
    **Command**: python generate_tree.py  -code_dir directory/to/code -method PyClone -sample_name test_sample -maf_file maf_file.txt -cnv_file cnv_file.txt  -output_dir directory/to/output -phylo_code directory/to/phyloWGS/package                                                                    
    **Parameters**:                                                                                                                                     
    -code_dir: the directory to the downloaded code                                                                            
    -method: user can choose 'SciClone'OR 'PhyloWGS' OR 'PyClone' you need to activate the corresponding environment when using one method                            
    -sample_name: the name of your sample                                                                                                                      
    -maf_file: the directory to the maf file                                                                                                                       
    -cnv_file: the directory to the cnv file                                                                                                                             
    -output_dir: the output folder you want to write the result
    -phylo_code: the directory to phyloWGS package
'''
if '-h' in args or '-help' in args or len(args)==1:
    print help_menu
    sys.exit(0)
############################### user input #############################
args=sys.argv
code_dir=args[args.index('-code_dir')+1]
method=args[args.index('-method')+1] #choose from SciClone, PhyloWGS, PyClone
if method not in ['SciClone','PhyloWGS','PyClone']:
    print('Please use one the following method: SciClone, PhyloWGS, PyClone!')
sample_name=args[args.index('-sample_name')+1]
maf_file=args[args.index('-maf_file')+1]
cnv_file=args[args.index('-cnv_file')+1]
output_dir=args[args.index('-output_dir')+1]
phylo_code=args[args.index('-phylo_code')+1]
if method=='SciClone':
    ############################### SciClone ################################
    #create result folder
    if os.path.isdir(output_dir+'/SciClone')==True:
        os.system('rm -r '+output_dir+'/SciClone')
    os.makedirs(output_dir+'/SciClone')
    sci_output=output_dir+'/SciClone'
    os.system('module load R/3.5.1-gccmkl')
    os.system('Rscript '+code_dir+'/script/sciclone.R '+sample_name+' '+maf_file+' '+cnv_file+' '+sci_output)
    ############################### PhyloWGS #################################
    #create result folder
elif method=='PhyloWGS':
    if os.path.isdir(output_dir+'/PhyloWGS')==True:
        os.system('rm -r '+output_dir+'/PhyloWGS')
    os.makedirs(output_dir+'/PhyloWGS')
    phylo_output=output_dir+'/PhyloWGS'
    #activate environment
    os.system('source activate phyloWGS')
    os.system('PERL5LIB=""')
    os.system('LD_LIBRARY_PATH=~/.conda/envs/phyloWGS/lib/')
    os.system('export LD_LIBRARY_PATH')
    #generate ssm_data.txt (cannot generate cnv data because the ratio of cells contianing CNV is unknow)
    os.system('Rscript '+code_dir+'/script/phyloWGS_input.R '+maf_file+' '+phylo_output)
    os.system('touch '+phylo_output+'/cnv_data.tsv')
    os.system('python2 '+phylo_code+'/multievolve.py --num-chains 32 --ssms '+phylo_output+'/ssm_data.tsv --cnvs '+phylo_output+'/cnv_data.tsv --output-dir '+phylo_output)
    #write results to json file
    os.system('python2 '+phylo_code+'/write_results.py '+sample_name+' '+phylo_output+'/trees.zip '+phylo_output+'/'+sample_name+'.summ.json.gz '+phylo_output+'/'+sample_name+'.muts.json.gz '+phylo_output+'/'+sample_name+'.mutass.zip')
    os.system('unzip '+phylo_output+'/'+sample_name+'.mutass.zip -d '+phylo_output)
    #os.system('rm '+phylo_output+'/trees.zip')
    #os.system('rm '+phylo_output+'/*/trees.zip')
    ############################### PyClone #################################
    #generage tsv file
elif method=='PyClone':
    os.system('source activate pyclone')
    if os.path.isdir(output_dir+'/PyClone')==True:
        os.system('rm -r '+output_dir+'/PyClone')
    os.makedirs(output_dir+'/PyClone')
    py_output=output_dir+'/PyClone'
    os.system('Rscript '+code_dir+'/script/tsv_pyclone.R '+sample_name+' '+maf_file+' '+cnv_file+' '+py_output)
    #set up pyclone analysis
    os.system('PyClone setup_analysis --prior total_copy_number --in_files '+py_output+'/'+sample_name+'.tsv'+' --working_dir '+py_output)
    os.system('PyClone run_analysis --config_file '+py_output+'/config.yaml')
    os.system('PyClone build_table --config_file '+py_output+'/config.yaml --out_file '+py_output+'/'+sample_name+'.table.txt --table_type loci')
