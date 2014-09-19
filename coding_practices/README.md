Coding for Reusability & Reproducibility
-

####Organizing your data and code
If you want to reuse your code across multiple projects past, present and future,
or share your code and data in a reusable format with others, you will need
to organize the way that code and data are stored on the filesystem.  There
are a variety of different formats that people have used for their own projects(1).
The main point is to develop a common directory structure that is useful across multiple
similar projects.  You should also decide whether you want your code to be sharable with
the data from each individual project, or whether you want your code in a directory structure
outside of the project directories.  It is possible to use symbolic links, or even git submodules,
to link code from a common source into each project.

A pipeline that I developed for Greg Crawford and Terry Furey used a directory structure similar to the following:

/pipeline/control_scripts/

Control scripts were placed in this directory.  Control scripts were create to control individual parts of the
analysis pipeline.  Control scripts may call out to programs in standard locations (/usr/bin, /library/X86, etc.).

/data/

Data is organized by Cell Line (GM12878, HLAC, etc).  There were over 150 cell lines.
Each Cell line directory is further subdivided into separate directories for each protocol being tested (DNaseHS, and others).
Each protocol has directories for each separate biological replicate of sample submitted (B1).  At least two biological replicates
were collected.  Using this scheme, the data for the first biological replicate of the DNaseHS protocol applied to GM12878 cell line
tissue would be found at /data/GM12878/DNaseHS/B1.

####Parameterizing your code
Once you have settled on an organized directory structure, you then need to
adapt your code to intelligently use this directory structure.  The best way to
do this is using a small number of parameters (commandline arguments, configuration, etc.)
to inform the code how to find data in expected places within the 'root' directory relative to the project
as specified in the parameters.  The Crawford pipeline control scripts were designed such that only the
cell_line, protocol, replicate, and sometimes genome_build (hg19) and sex, needed to be passed as commandline
arguments.  The scripts would then find data in expected places within the directory structure, and/or produce files in
standard places within that same structure.

####Modularizing your code
It is important not to write one big program to do all of your analysis routines.  It is tempting for busy researchers to
write the one code to rule them all, and use commandline switches, or other configuration to run individual aspects of the
code to produce different outputs.  Instead, you should modularize your code into discreet units to produce specific outputs.
This provides a number of advantages:

+ independant programs can be run in parallel
+ bugs in one module do not affect other modules
+ new modules can be introduced into the system without affecting other modules, unless they are made to depend on the new modules outputs.
+ data for each module can be produced within module specific subdirectories within the overall project directory structure, making it easy to find their outputs

The Crawford pipeline had several modules in the form of individual control scripts:

bwa: expected fastq files to be in in /data/cell_line/protocol/replicate/raw.  Produced bam files by aligning raw files to
the sex specific $build genome in /data/cell_line/protocol/replicate/bwa_$build

initial_peaks: expected to find bam files in /data/cell_line/protocol/replicate/bwa_$build, produced output
in /data/cell_line/protocol/replicate/initial_peaks_$build

parzen_peaks: expected to find bam files in /data/cell_line/protocol/replicate/bwa_$build, produced output
in /data/cell_line/protocol/replicate/parzen_$build

final_peaks: expected files in both initial_peaks_$build and parzen_$build, produced /data/cell_line/protocol/replicate/peaks_$build

####Automation
Once you have your code modularized, and parameterized, it becomes possible to setup schemes to automate the way they are applied to
your data when it becomes available.  Wrapper scripts can be coded to read files, databases, or webservices to discover 'jobs' needing to be done,
e.g. data in projects that made available.  Unix Cron, or other scheduling systems, can be used to have these control scripts regularly run to find new jobs.

(1) [A Quick Guide to Organizing Computational Biology Projects](http://www.ploscompbiol.org/article/info%3Adoi%2F10.1371%2Fjournal.pcbi.1000424)
(2) [A Quick Guide for Developing Effective Bioinformatics Programming Skills](http://www.ploscompbiol.org/article/info%3Adoi%2F10.1371%2Fjournal.pcbi.1000589)
