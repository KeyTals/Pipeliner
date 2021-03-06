rule snpeff_somatic:
        input: "mutect_out/merged_somatic.vcf"
        output: "mutect_out/merged_somatic_snpEff.vcf"
        params: snpeff=config['bin'][pfamily]['SNPEFF'],regions=config['references'][pfamily]['REFFLAT'],genome=config['references'][pfamily]['SNPEFF_GENOME'],rname="pl:snpeff_somatic"
        shell: "module load snpEff; {params.snpeff} -v {params.genome} -interval {params.regions} -cancer -cancerSamples pairs {input} > {output}"