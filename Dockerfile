FROM rockerjp/verse:latest
RUN tlmgr install \
    luatexja \
    luatexbase \
    ctablestack \
    adobemapping \
    ms \
    filehook
RUN Rscript -e "install.packages('boot')"
RUN Rscript -e "install.packages('pdp')"
RUN Rscript -e "install.packages('rpart')"
RUN Rscript -e "install.packages('glmnet')"
RUN Rscript -e "install.packages('pls')"
RUN Rscript -e "install.packages('rpart.plot')"
RUN Rscript -e "install.packages('caret')"
RUN Rscript -e "install.packages('cluster')"
RUN Rscript -e "install.packages('e1071')"
RUN Rscript -e "install.packages('ISLR')"
RUN Rscript -e "install.packages('pROC')"
RUN Rscript -e "install.packages('xgboost')"
RUN Rscript -e "install.packages('coefplot')"
RUN Rscript -e "install.packages('gbm')"
RUN Rscript -e "install.packages('MASS')"
RUN Rscript -e "install.packages('randomForest')"