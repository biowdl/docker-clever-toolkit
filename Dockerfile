################## BASE IMAGE ######################
FROM quay.io/biocontainers/clever-toolkit:2.4--py36hcfe0e84_6

################## METADATA ######################
LABEL base_image="quay.io/biocontainers/clever-toolkit:2.4--py36hcfe0e84_6"
LABEL version="1"
LABEL software="clever-toolkit"
LABEL software.version="2.4"
LABEL about.summary="The CLEVER Toolkit is a collection of tools to discover and genotype structural variations in genomes from paired-end sequencing reads."
LABEL about.home="https://bitbucket.org/tobiasmarschall/clever-toolkit/src"
LABEL about.documentation="https://bitbucket.org/tobiasmarschall/clever-toolkit/src/master/README.md"
LABEL about.license_file="https://bitbucket.org/tobiasmarschall/clever-toolkit/src/master/LICENSE"
LABEL about.tags="Structural variations"

################## MAINTAINER ######################
MAINTAINER SASC <sasc@lumc.nl>

################## INSTALLATION ######################
RUN sed -i -E "s/samtools_view = subprocess.Popen\(\[exe_dict\['samtools'\], 'view', '-h', bam_filename\] \+ regions, stdout\=subprocess\.PIPE\)/samtools_view = subprocess.Popen\(\[exe_dict\['samtools'\], 'view', '-h', bam_filename, '-L', regions_filename\], stdout\=subprocess\.PIPE\)/g" ./local/bin/mateclever

################## TOOL INFO ##################
# Clever-toolkit (mateclever) fails to run samtools due to limited argument size.