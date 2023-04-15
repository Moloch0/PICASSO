

#parameter:
#$1/$dir: the path of project (only have the child folder called 'rawdata')
##fq files should be renamed to fastq and not uncompressed


day=$(date +'%Y-%m')
dir=$1
shell_name=$0

module load apps/FastQC/0.11.9
mkdir ${dir}/1_fastqc_${day}
mkdir ${dir}/1_fastqc_${day}/data
ln -s ${dir}/rawdata/ ${dir}/1_fastqc_${day}/data
mkdir ${dir}/1_fastqc_${day}/output
mkdir ${dir}/1_fastqc_${day}/script
mkdir ${dir}/1_fastqc_${day}/script/log.out
fastqc -o ${dir}/1_fastqc_${day}/output/  ${dir}/1_fastqc_${day}/data/*/*fastq.gz 1> ${dir}/1_fastqc_${day}/script/log.out/${shell_name}.out 2> ${dir}/1_fastqc_${day}/script/log.out/${shell_name}.err
fastqc -version | cat > {dir}/1_fastqc_${day}/script/log.out/version
