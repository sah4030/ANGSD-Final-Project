# A treemap R script produced by the Revigo server at http://revigo.irb.hr/
# If you found Revigo useful in your work, please cite the following reference:
# Supek F et al. "REVIGO summarizes and visualizes long lists of Gene Ontology
# terms" PLoS ONE 2011. doi:10.1371/journal.pone.0021800

# author: Anton Kratz <anton.kratz@gmail.com>, RIKEN Omics Science Center, Functional Genomics Technology Team, Japan
# created: Fri, Nov 02, 2012  7:25:52 PM
# last change: Fri, Nov 09, 2012  3:20:01 PM

# -----------------------------------------------------------------------------
# If you don't have the treemap package installed, uncomment the following line:
# install.packages( "treemap" );
library(treemap) 								# treemap package by Martijn Tennekes

# Set the working directory if necessary
# setwd("C:/Users/username/workingdir");

# --------------------------------------------------------------------------
# Here is your data from Revigo. Scroll down for plot configuration options.

revigo.names <- c("term_ID","description","frequency","value","uniqueness","dispensability","representative");
revigo.data <- rbind(c("GO:0003682","chromatin binding",0.6287702097345026,4.757015200732303,0.9732490308838219,0.04652317,"chromatin binding"),
c("GO:0003735","structural constituent of ribosome",2.128498588986873,32.76490104278329,1,0,"structural constituent of ribosome"),
c("GO:0004386","helicase activity",1.24556595594382,6.185643122302086,0.826615719150703,-0,"helicase activity"),
c("GO:0003678","DNA helicase activity",0.542993136015758,5.441444607951386,0.8089233841200579,0.5294201,"helicase activity"),
c("GO:0008094","ATP-dependent activity, acting on DNA",1.0815180231420256,4.10593142618266,0.8116806658003404,0.71045809,"helicase activity"),
c("GO:0008186","ATP-dependent activity, acting on RNA",0.3621654318259864,3.0456108867121485,0.8715727130654867,0.50799254,"helicase activity"),
c("GO:0016887","ATP hydrolysis activity",4.018519084389943,4.124968138794948,0.8413610885435854,0.66885368,"helicase activity"),
c("GO:0017116","single-stranded DNA helicase activity",0.09534777456591127,3.810427984044314,0.8311239807046416,0.82447317,"helicase activity"),
c("GO:0140097","catalytic activity, acting on DNA",2.838298219401709,3.113557211533149,0.8758524011003433,0.63535854,"helicase activity"),
c("GO:0005198","structural molecule activity",3.1132296844467198,16.0069759875861,1,-0,"structural molecule activity"),
c("GO:0019843","rRNA binding",1.1153325776412018,6.219739522204373,0.8923603397506226,-0,"rRNA binding"),
c("GO:0003688","DNA replication origin binding",0.09251160070503868,4.587449913367507,0.9323515063060396,0.21869479,"rRNA binding"),
c("GO:0003729","mRNA binding",1.136762432364793,5.824885803953181,0.8922296101207572,0.58537936,"rRNA binding"),
c("GO:0008135","translation factor activity, RNA binding",0.7828527278914482,4.194665239642394,0.8391383832635558,0.26866772,"rRNA binding"),
c("GO:0045182","translation regulator activity",0.8397513870752873,3.9058026223089968,0.907501650492259,0.87534481,"rRNA binding"),
c("GO:0048027","mRNA 5'-UTR binding",0.018748905389896736,5.011470129114725,0.9172785639297454,0.40164308,"rRNA binding"),
c("GO:0019887","protein kinase regulator activity",0.3380590627551919,7.686308856814106,0.571434716944205,-0,"protein kinase regulator activity"),
c("GO:0004860","protein kinase inhibitor activity",0.056508380372647965,4.667532535966483,0.586783235049061,0.84547457,"protein kinase regulator activity"),
c("GO:0019207","kinase regulator activity",0.3743904720879025,7.239110764225237,0.6653654255316667,0.66575874,"protein kinase regulator activity"),
c("GO:0019210","kinase inhibitor activity",0.06047104080218617,4.775485828115032,0.5976438455380713,0.84984866,"protein kinase regulator activity"),
c("GO:0055105","ubiquitin-protein transferase inhibitor activity",0.003740911104997729,5.30710045314938,0.6992472745379014,0.47269655,"protein kinase regulator activity"),
c("GO:0055106","ubiquitin-protein transferase regulator activity",0.02346773101611794,3.8320913197108646,0.7148800064652348,0.5344899,"protein kinase regulator activity"),
c("GO:0061575","cyclin-dependent protein serine/threonine kinase activator activity",0.03565063890637136,3.507246811703768,0.609191217871053,0.81689962,"protein kinase regulator activity"),
c("GO:1990948","ubiquitin ligase inhibitor activity",0.0005654607775781984,5.600494686149185,0.7232373292891427,0.75014359,"protein kinase regulator activity"),
c("GO:0045296","cadherin binding",0.1230509176807522,5.349988873918076,0.889299411972845,0.03974533,"cadherin binding"),
c("GO:0019838","growth factor binding",0.08915431593149596,3.8021900447798145,0.8913644577797202,0.32662241,"cadherin binding"),
c("GO:0031625","ubiquitin protein ligase binding",0.17229700767469977,3.2617054326287422,0.8717005555785298,0.37354545,"cadherin binding"),
c("GO:0044389","ubiquitin-like protein ligase binding",0.18968658970516344,3.3023038043269723,0.8710610329763332,0.65826435,"cadherin binding"),
c("GO:0046977","TAP binding",0.00027718665567558746,3.378924236674604,0.9194588674549451,0.22989991,"cadherin binding"),
c("GO:0050839","cell adhesion molecule binding",0.35693436526007666,3.5877001001067472,0.8820777489323518,0.36335199,"cadherin binding"),
c("GO:0097371","MDM2/MDM4 family protein binding",0.0008093850345727155,3.1015414996667787,0.9153264330594846,0.2432709,"cadherin binding"),
c("GO:0140657","ATP-dependent activity",6.582928060571981,4.9377145996032255,1,-0,"ATP-dependent activity"));

stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;

stuff$value <- as.numeric( as.character(stuff$value) );
stuff$frequency <- as.numeric( as.character(stuff$frequency) );
stuff$uniqueness <- as.numeric( as.character(stuff$uniqueness) );
stuff$dispensability <- as.numeric( as.character(stuff$dispensability) );

# by default, outputs to a PDF file
pdf( file="revigo_treemap.pdf", width=16, height=9 ) # width and height are in inches

# check the tmPlot command documentation for all possible parameters - there are a lot more
treemap(
  stuff,
  index = c("representative","description"),
  vSize = "value",
  type = "categorical",
  vColor = "representative",
  title = "Revigo TreeMap",
  inflate.labels = FALSE,      # set this to TRUE for space-filling group labels - good for posters
  lowerbound.cex.labels = 0,   # try to draw as many labels as possible (still, some small squares may not get a label)
  bg.labels = "#CCCCCCAA",   # define background color of group labels
								 # "#CCCCCC00" is fully transparent, "#CCCCCCAA" is semi-transparent grey, NA is opaque
  position.legend = "none"
)

dev.off()

