export PATH="/Users/jiangyiqun/Dropbox/Myung Lab Shared Data/Single-cell Analysis/homer/bin:$PATH"

conda activate /Users/jiangyiqun/opt/anaconda3/envs/sc

awk '{printf "%s\t%s\t%d\t%d\t%s\n",$4,$1,$2,$3,0}' 2\ rep\ E13\ 3T\ wildtype\ vs\ EX3.bed > 2\ rep\ E13\ 3T\ wildtype\ vs\ EX3.txt

findMotifsGenome.pl 2\ rep\ E13\ 3T\ wildtype\ vs\ EX3.txt mm10 ./RQ22923/output

annotatePeaks.pl ../2\ rep\ E13\ 3T\ wildtype\ vs\ EX3.txt mm10 > annotated_2\ rep\ E13\ 3T\ wildtype\ vs\
EX3.txt

#FOR TF 
#(If IgG signal strong):
module load MACS2
macs2 callpeak -f BAMPE -g mm -p 1e-5 -t $dir/removed_dup_paired.bam -c $cont_dir/removed_dup_paired.bam -n $name --outdir $dir

#FOR TF 
#(If IgG signal is really low, can use this, but don’t really use):
module load MACS2
macs2 callpeak -f BAMPE -g mm -t $dir/removed_dup_paired.bam -c $cont_dir/removed_dup_paired.bam -n $name --outdir $dir

