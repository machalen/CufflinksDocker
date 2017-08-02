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
