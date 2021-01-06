FROM rocker/r-ver:4.0.0

RUN apt-get update && \
	apt-get install -y \
		zlib1g-dev \
		libxml2 \
		libbz2-dev \
		liblzma-dev \
		libpcre3-dev \
		libicu-dev \
		libcurl4-openssl-dev

#install r packages from CRAN
RUN install2.r --error \
	devtools \
	BiocManager

#install specific version of matrixStats
RUN R -e "install.packages('https://cran.rstudio.com/src/contrib/matrixStats_0.57.0.tar.gz', repos=NULL, type='source')"
#methylkit latest commit
RUN R -e "devtools::install_github('al2na/methylKit@dd8f40c129c95bc4844552e747669a3da8a122ab', build_vignettes=FALSE, repos=BiocManager::repositories(), dependencies=TRUE)"

