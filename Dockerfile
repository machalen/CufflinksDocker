#########################################################################
#RNA-seq Tools
#Dockerfile to use Cufflinks Cuffcompare Cuffmerge and Cuffdiff 2.2.1
#Ubuntu 14.04
##########################################################################
#Build the image based on Ubuntu
FROM ubuntu:14.04

#Install required libraries in ubuntu
RUN apt-get update && apt-get install --yes wget unzip python
#Set wokingDir in /bin
WORKDIR /bin

#Download Cufflinks
RUN wget http://cole-trapnell-lab.github.io/cufflinks/assets/downloads/cufflinks-2.2.1.Linux_x86_64.tar.gz
#Unzip Cufflinks
RUN tar zxvf cufflinks-2.2.1.Linux_x86_64.tar.gz
#Clean
RUN rm cufflinks-2.2.1.Linux_x86_64.tar.gz

#Install and Configure samtools
RUN wget http://github.com/samtools/samtools/releases/download/1.5/samtools-1.5.tar.bz2
RUN tar jxf samtools-1.5.tar.bz2
RUN cd samtools-1.5
RUN ./configure
RUN make
RUN rm /bin/samtools-1.5.tar.bz2

#Add Cufflinks to the path variable
ENV PATH $PATH:/bin/cufflinks-2.2.1.Linux_x86_64
ENV PATH $PATH:/bin/samtools-1.5

#Remove no installed packages wget and unzip
RUN apt-get purge --yes wget unzip

#Set the default Working Directory
WORKDIR /
