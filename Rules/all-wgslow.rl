rule all_wgslow:
    input:  expand("QC/{s}.R1_fastqc.html",s=samples),
#            expand("QC/{s}.R1."+config['project']['filetype']+"_filtered",s=samples),
#            expand("{s}.R1.trimmed.fastq.bz2",s=samples),
#            expand("QC/{s}.qualimapReport",s=samples),
            expand("QC/{s}.{r}.trimmed_fastqc.html",s=samples,r=['R1','R1']),
            expand("QC/{s}.{r}_screen.txt",s=samples,r=['R1','R1']),
            expand("QC/{s}.{r}_screen.png",s=samples,r=['R1','R1']),
            expand("{s}.dedup.bam",s=samples),
            "multiqc_report.html",
            expand("QC/{s}_run_trimmomatic.err",s=samples),
            expand("QC/{s}.qualimapReport/genome_results.txt",s=samples),
            expand("{s}.recal.bam", s=samples),
#            config['project']['id']+"_"+config['project']['flowcellid']+".xlsx"
    output: 