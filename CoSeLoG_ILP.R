rm(list=ls())
options(stringsAsFactors=FALSE)
setwd("~/Documents/Work/Courses/Coursera/process-mining/Projects/CoSeLoG")
source("~/Dropbox/datascience/R/mypetrinet.R")

ILP_pn <- petrinet(name="ILP",
                      trans_df=data.frame(id=1:9,
        name=c("TA","T02","T03","T04","T05","T06","T07-1","T10","T11"),
        x=c(      5,  15,    15,   25,   25,   15,     15,   15,   25),
        y=c(      0,   5,    10,   10,    5,    0,    -10,   -5,   -5)),
                      places_df=data.frame(id=1:8,
        name=c("Start", "ILP1", "ILP2", "ILP3", "ILP4", "ILP5","End_ILP1","End_ILP2"),
        x=c(         0,     10,     20,     10,     20,     10,        30,        30),
        y=c(         0,      5,      5,     -5,     -5,    -10,         5,        -5),
        M0=c(        1,      0,      0,      0,      0,      0,         0,         0)),
                      arcs_df=data.frame(
    begin=c("Start",  "TA",  "TA",  "TA"
, "ILP1",  "T02", "T03","ILP2","ILP2","ILP2", "T04","T05"
,          "T10",       "ILP3","ILP4","ILP3", "T06","T11"
, "ILP5","T07-1","ILP5"
),
    end  =c("TA"   ,"ILP1","ILP3","ILP5"
,  "T02", "ILP2","ILP1", "T03", "T05", "T04","ILP2","End_ILP1"
,         "ILP4",        "T06", "T11", "T10","ILP3","End_ILP2"
,"T07-1", "ILP5", "T10"
)))
ggplot.petrinet(ILP_pn)
replay.petrisim(ILP_pn, "TA,T02,T05") # tokens remaining in ILP3,ILP5
replay.petrisim(ILP_pn, "TA,T02,T04,T05") # tokens remaining in ILP3,ILP5
replay.petrisim(ILP_pn, "TA,T02,T03,T02,T05") # tokens remaining in ILP3,ILP5
replay.petrisim(ILP_pn, "TA,T02,T04,T03,T02,T05") # tokens remaining in ILP3,ILP5

replay.petrisim(ILP_pn, "TA,T10,T11") # tokens remaining in ILP1
replay.petrisim(ILP_pn, "TA,T10,T02") # followed by [T04]*,[T03,T02]*,T05
replay.petrisim(ILP_pn, "TA,T06") # followed by T10, T11
replay.petrisim(ILP_pn, "TA,T06") # followed by T10, T02

replay.petrisim(ILP_pn, "TA,T07-1") # followed by T10, T11
replay.petrisim(ILP_pn, "TA,T07-1") # followed by T10, T02
