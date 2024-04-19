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
revigo.data <- rbind(c("GO:0005925","focal adhesion",0.13162046255283416,7.996139266840531,0.970253482541397,3.493E-05,"focal adhesion"),
c("GO:0030055","cell-substrate junction",0.14270996670365818,8.12538044292046,0.9702532108190064,0.74818542,"focal adhesion"),
c("GO:0016328","lateral plasma membrane",0.06016857338386815,3.2423324973226126,0.9885418772250045,3.258E-05,"lateral plasma membrane"),
c("GO:0022626","cytosolic ribosome",1.5308261628412307,46.77479350840934,0.5936109252021499,0,"cytosolic ribosome"),
c("GO:0000775","chromosome, centromeric region",0.37549513281836755,3.0237813644155356,0.6070620497869089,0.85409804,"cytosolic ribosome"),
c("GO:0000781","chromosome, telomeric region",0.10283446533408082,4.900640196871665,0.6394069921332957,0.5865487,"cytosolic ribosome"),
c("GO:0000792","heterochromatin",0.058563415489753794,2.8282210095234235,0.5410022399245389,0.56073149,"cytosolic ribosome"),
c("GO:0000793","condensed chromosome",0.4223503377863461,2.8254209779851354,0.6205126626216213,0.66316356,"cytosolic ribosome"),
c("GO:0000796","condensin complex",0.024497293619308528,3.0283641738134626,0.5785239477809756,0.52496239,"cytosolic ribosome"),
c("GO:0000922","spindle pole",0.19454712457829196,4.339096960938584,0.6749745812996456,0.39229009,"cytosolic ribosome"),
c("GO:0005657","replication fork",0.3452803959879799,3.8157728360827408,0.6259460589025597,0.65103561,"cytosolic ribosome"),
c("GO:0005721","pericentric heterochromatin",0.026919939047731878,2.7826680994098276,0.5472847893993897,0.70503236,"cytosolic ribosome"),
c("GO:0005791","rough endoplasmic reticulum",0.07583749858554778,3.360561413717007,0.843006301837754,0.11715284,"cytosolic ribosome"),
c("GO:0005813","centrosome",0.4724431909525151,3.7364271209447852,0.6537233484086896,0.6885681,"cytosolic ribosome"),
c("GO:0005819","spindle",0.47891103305527,3.5653017407238097,0.6533782748667472,0.74655854,"cytosolic ribosome"),
c("GO:0005840","ribosome",2.633182012829237,30.13520882720809,0.6333508648676052,0.52304479,"cytosolic ribosome"),
c("GO:0014731","spectrin-associated cytoskeleton",0.0006385844872869755,3.0283641738134626,0.7740736156313421,0.25328971,"cytosolic ribosome"),
c("GO:0015934","large ribosomal subunit",1.1910818222527662,17.166210323923362,0.4372170307150718,0.85206096,"cytosolic ribosome"),
c("GO:0015935","small ribosomal subunit",0.7887959581428492,14.52025022604069,0.45396823752795834,0.81483693,"cytosolic ribosome"),
c("GO:0016363","nuclear matrix",0.02510357616754986,3.4253542336022273,0.8459737583695413,0.42078955,"cytosolic ribosome"),
c("GO:0022625","cytosolic large ribosomal subunit",1.014469728138433,30.738328152233397,0.4423752572485831,0.80755795,"cytosolic ribosome"),
c("GO:0022627","cytosolic small ribosomal subunit",0.5126516507707168,22.97477797324092,0.46906071316760783,0.83441369,"cytosolic ribosome"),
c("GO:0031261","DNA replication preinitiation complex",0.05723406645979842,4.559695393484093,0.6625103905017528,0.44404022,"cytosolic ribosome"),
c("GO:0034399","nuclear periphery",0.058175792221206064,4.6659032806109115,0.8380932970216209,0.11448189,"cytosolic ribosome"),
c("GO:0035770","ribonucleoprotein granule",0.37055542090892585,2.9486790911713348,0.6766364786547485,0.69175377,"cytosolic ribosome"),
c("GO:0036464","cytoplasmic ribonucleoprotein granule",0.3540789472311051,3.3570754007591685,0.6753923913587585,0.41620607,"cytosolic ribosome"),
c("GO:0042824","MHC class I peptide loading complex",0.0029245678659018297,3.0283641738134626,0.71726575434652,0.38220177,"cytosolic ribosome"),
c("GO:0044391","ribosomal subunit",1.9821488551869784,30.19504659503563,0.4204883817082876,0.87433466,"cytosolic ribosome"),
c("GO:0071162","CMG complex",0.003734601106584919,5.356421086499794,0.5836281609340919,0.46143728,"cytosolic ribosome"),
c("GO:0098556","cytoplasmic side of rough endoplasmic reticulum membrane",0.0002609002769071301,3.7135560218430537,0.8632316745017253,0.3361114,"cytosolic ribosome"),
c("GO:0098687","chromosomal region",0.4755839333335686,7.450944876088636,0.617243701353717,0.42909376,"cytosolic ribosome"),
c("GO:1990904","ribonucleoprotein complex",4.315842197772249,22.337850913144305,0.6963045019370174,-0,"ribonucleoprotein complex"),
c("GO:0000502","proteasome complex",0.37652382533874423,4.001942876385285,0.6313863434835699,0.29831054,"ribonucleoprotein complex"),
c("GO:0005751","mitochondrial respiratory chain complex IV",0.04987419388647539,3.1216268821168995,0.594338041230623,0.71819678,"ribonucleoprotein complex"),
c("GO:0008540","proteasome regulatory particle, base subcomplex",0.08040449581369354,2.7205876589658042,0.6468174254880196,0.86087756,"ribonucleoprotein complex"),
c("GO:0030684","preribosome",0.4987493931583797,6.831011546948853,0.670168672372798,0.30824242,"ribonucleoprotein complex"),
c("GO:0032040","small-subunit processome",0.23248450960513065,6.985986287523641,0.688413625672504,0.5292136,"ribonucleoprotein complex"),
c("GO:0033290","eukaryotic 48S preinitiation complex",0.07039586423862765,2.6794736119949403,0.6886578441642303,0.47887401,"ribonucleoprotein complex"),
c("GO:0042555","MCM complex",0.047963409953698403,4.216616176029587,0.7870446279690858,0.24131834,"ribonucleoprotein complex"),
c("GO:0042575","DNA polymerase complex",0.21468117166189649,3.075071554021883,0.6405372556163027,0.72126185,"ribonucleoprotein complex"),
c("GO:0044611","nuclear pore inner ring",0.019013418275174852,2.7848683772881095,0.6854797701439134,0.53126293,"ribonucleoprotein complex"),
c("GO:0045277","respiratory chain complex IV",0.07939319664511067,2.6818104420689686,0.6613239049273566,0.84615681,"ribonucleoprotein complex"),
c("GO:0061695","transferase complex, transferring phosphorus-containing groups",1.3716695396342555,2.9534088736469433,0.6216150769013021,0.68625174,"ribonucleoprotein complex"),
c("GO:0098800","inner mitochondrial membrane protein complex",0.5463053017271946,3.7950521503714167,0.6137977869731942,0.31160339,"ribonucleoprotein complex"),
c("GO:0098803","respiratory chain complex",0.4964087449598415,2.621952262301536,0.6858079314909193,0.78827007,"ribonucleoprotein complex"),
c("GO:1902554","serine/threonine protein kinase complex",0.3394014430816725,3.1224646222079278,0.6283522158858551,0.7505691,"ribonucleoprotein complex"),
c("GO:1902911","protein kinase complex",0.3748018835111572,3.852538280518642,0.6388077424596867,0.42916106,"ribonucleoprotein complex"),
c("GO:1990316","Atg1/ULK1 kinase complex",0.016826825478238903,2.6232382137716796,0.6697859784308089,0.77430556,"ribonucleoprotein complex"));

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

