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
revigo.data <- rbind(c("GO:0002181","cytoplasmic translation",0.3974763229665376,51.6305426111098,0.9209671529584307,0,"cytoplasmic translation"),
c("GO:0006260","DNA replication",1.488685807444442,7.0274408188052915,0.884134407883552,0.61057325,"cytoplasmic translation"),
c("GO:0006261","DNA-templated DNA replication",0.9202033469791208,8.033783334262026,0.8622245782647168,0.20551559,"cytoplasmic translation"),
c("GO:0006268","DNA unwinding involved in DNA replication",0.1645386593016287,5.108026983765312,0.7532128238571554,0.74690971,"cytoplasmic translation"),
c("GO:0006270","DNA replication initiation",0.18677061560434888,3.6627760251559214,0.8709596922701681,0.75553763,"cytoplasmic translation"),
c("GO:0006271","DNA strand elongation involved in DNA replication",0.14194438619441851,4.902612308891,0.8734822044343773,0.73709929,"cytoplasmic translation"),
c("GO:0006412","translation",4.38869169324396,18.52393750719497,0.9019781515513704,0.6792736,"cytoplasmic translation"),
c("GO:0006413","translational initiation",0.4742529791560868,3.2114371302306473,0.9197899471341668,0.6934247,"cytoplasmic translation"),
c("GO:0016072","rRNA metabolic process",1.653535024007062,4.449366252296804,0.9063073204727687,0.39330567,"cytoplasmic translation"),
c("GO:0032508","DNA duplex unwinding",0.6410641288913195,4.274999411840121,0.8450613436266659,0.87485131,"cytoplasmic translation"),
c("GO:0044786","cell cycle DNA replication",0.09657837868800304,5.958969077392211,0.7392986707987249,0.71269512,"cytoplasmic translation"),
c("GO:0046653","tetrahydrofolate metabolic process",0.3655357551475852,3.9138330377262287,0.9391344245190315,0.23481381,"cytoplasmic translation"),
c("GO:0071897","DNA biosynthetic process",0.7667855953091854,3.3496060904305294,0.8810265905864606,0.56819667,"cytoplasmic translation"),
c("GO:0015931","nucleobase-containing compound transport",0.5729682875685309,4.9723710803203724,0.9748376511964306,-0,"nucleobase-containing compound transport"),
c("GO:0006403","RNA localization",0.38503431460554743,3.1134969318636756,0.9749222049099137,0.48954515,"nucleobase-containing compound transport"),
c("GO:0050658","RNA transport",0.3380539022900098,3.5103502120963066,0.9506396492764907,0.48659654,"nucleobase-containing compound transport"),
c("GO:0019883","antigen processing and presentation of endogenous antigen",0.014090919532444707,3.457639110366066,0.9556576733557423,-0,"antigen processing and presentation of endogenous antigen"),
c("GO:0019885","antigen processing and presentation of endogenous peptide antigen via MHC class I",0.010199094809385375,3.2458723014387054,0.9547192305926724,0.8574811,"antigen processing and presentation of endogenous antigen"),
c("GO:0042254","ribosome biogenesis",2.136224808753416,9.021234815969308,0.8505346470023619,0.01239921,"ribosome biogenesis"),
c("GO:0000002","mitochondrial genome maintenance",0.06575433816451984,3.3634431739386548,0.8916073304369097,0.43598606,"ribosome biogenesis"),
c("GO:0000027","ribosomal large subunit assembly",0.012821578346646382,3.457639110366066,0.8664066044206666,0.55914193,"ribosome biogenesis"),
c("GO:0000028","ribosomal small subunit assembly",0.18744841915016353,4.711816646899462,0.8388292260876656,0.88017282,"ribosome biogenesis"),
c("GO:0006364","rRNA processing",1.5444135826112384,4.209954192224678,0.7712972886650828,0.89332116,"ribosome biogenesis"),
c("GO:0007005","mitochondrion organization",0.8276597479438399,5.588477005201035,0.8670146648949112,0.55902836,"ribosome biogenesis"),
c("GO:0007062","sister chromatid cohesion",0.13874515345817343,3.711573036218775,0.7223861141915394,0.72338332,"ribosome biogenesis"),
c("GO:0022613","ribonucleoprotein complex biogenesis",2.5375929564430133,9.96437161366903,0.8678984238669338,0.65931649,"ribosome biogenesis"),
c("GO:0022618","protein-RNA complex assembly",0.6203750999328901,5.813783407786069,0.8506158750814307,0.80206787,"ribosome biogenesis"),
c("GO:0042255","ribosome assembly",0.2624923630025938,7.714754820274223,0.8420969902272142,0.73159365,"ribosome biogenesis"),
c("GO:0042273","ribosomal large subunit biogenesis",0.3272829877619735,6.005625612518808,0.8713851635568658,0.74846113,"ribosome biogenesis"),
c("GO:0042274","ribosomal small subunit biogenesis",0.6098827010436794,7.130315930082805,0.8644875620714843,0.8005385,"ribosome biogenesis"),
c("GO:0051276","chromosome organization",1.5299726699751368,5.7127993444971406,0.8593777558188125,0.41173461,"ribosome biogenesis"),
c("GO:0071103","DNA conformation change",0.8233982121957907,6.065380483164394,0.8452205744323044,0.55870698,"ribosome biogenesis"),
c("GO:0071826","protein-RNA complex organization",0.6518695497816881,6.050538447456272,0.8857365844830362,0.37217301,"ribosome biogenesis"),
c("GO:0140694","non-membrane-bounded organelle assembly",0.7232459602662196,5.287730936689949,0.8444175495857393,0.78040097,"ribosome biogenesis"),
c("GO:0045333","cellular respiration",1.340633795117192,3.791865248731981,0.9363288288700871,0.08482152,"cellular respiration"),
c("GO:0006119","oxidative phosphorylation",0.4950208797998473,3.507343265915154,0.9405574414563465,0.85730952,"cellular respiration"),
c("GO:0022904","respiratory electron transport chain",0.6388926928045461,3.4549652174343164,0.939347153581963,0.88066521,"cellular respiration"),
c("GO:0051301","cell division",1.5693197819947182,3.956725964606272,0.9898447947858066,0.01317239,"cell division"),
c("GO:0060841","venous blood vessel development",0.0016390522107881283,4.516400728912856,0.974103338530888,-0,"venous blood vessel development"),
c("GO:0001944","vasculature development",0.1698255269589829,3.3231507329002614,0.9708556190531742,0.63983427,"venous blood vessel development"),
c("GO:0002064","epithelial cell development",0.040670677489044973,3.106027469531461,0.9779727930968607,0.34066219,"venous blood vessel development"),
c("GO:0032608","interferon-beta production",7.394220499796069E-06,3.711573036218775,0.9520374504774174,0.2216509,"venous blood vessel development"),
c("GO:0048845","venous blood vessel morphogenesis",0.0007985758139779752,3.7523538844932847,0.9747415830795703,0.56608635,"venous blood vessel development"),
c("GO:0090269","fibroblast growth factor production",1.2323700832993446E-05,3.0347808458323127,0.9511387641038612,0.66771585,"venous blood vessel development"),
c("GO:1901988","negative regulation of cell cycle phase transition",0.32217358139661445,8.889625382751223,0.642127316316267,-0,"negative regulation of cell cycle phase transition"),
c("GO:0000079","regulation of cyclin-dependent protein serine/threonine kinase activity",0.00031548674132463224,7.082569954380362,0.6928678458295848,0.7786013,"negative regulation of cell cycle phase transition"),
c("GO:0000727","double-strand break repair via break-induced replication",0.06797999853495844,3.7995057996091766,0.8277850880841867,0.48447774,"negative regulation of cell cycle phase transition"),
c("GO:0002753","cytoplasmic pattern recognition receptor signaling pathway",0.013615224680291159,3.05158096481259,0.700219829841014,0.7968481,"negative regulation of cell cycle phase transition"),
c("GO:0002831","regulation of response to biotic stimulus",0.18600654615270326,4.001273808597957,0.8091970420613456,0.51391785,"negative regulation of cell cycle phase transition"),
c("GO:0002833","positive regulation of response to biotic stimulus",0.10605776936874159,3.7238452065140932,0.7492041582248549,0.54902923,"negative regulation of cell cycle phase transition"),
c("GO:0006417","regulation of translation",1.3923070727099334,3.7779990633162503,0.777876948971086,0.20562782,"negative regulation of cell cycle phase transition"),
c("GO:0007346","regulation of mitotic cell cycle",0.4602828318918054,6.728667502211029,0.667720464754527,0.89798495,"negative regulation of cell cycle phase transition"),
c("GO:0008630","intrinsic apoptotic signaling pathway in response to DNA damage",0.03476516004987451,4.790121056447469,0.7759933758425187,0.88247736,"negative regulation of cell cycle phase transition"),
c("GO:0009615","response to virus",0.20032422178047504,4.729388245886361,0.9192412804090466,0.21133897,"negative regulation of cell cycle phase transition"),
c("GO:0010564","regulation of cell cycle process",0.6858632461594173,7.9756491174682305,0.6580480562622338,0.88097293,"negative regulation of cell cycle phase transition"),
c("GO:0030174","regulation of DNA-templated DNA replication initiation",0.023158698605361284,3.0314934602565478,0.8548781871758627,0.85456665,"negative regulation of cell cycle phase transition"),
c("GO:0031347","regulation of defense response",0.27566393445289716,3.432162012042004,0.7846035956177343,0.59208291,"negative regulation of cell cycle phase transition"),
c("GO:0031400","negative regulation of protein modification process",0.08984717329302201,3.3109616954316263,0.7634369597328701,0.70630043,"negative regulation of cell cycle phase transition"),
c("GO:0031952","regulation of protein autophosphorylation",0.010083252021555238,3.530826534504518,0.8239741385390961,0.56527542,"negative regulation of cell cycle phase transition"),
c("GO:0032648","regulation of interferon-beta production",0.005220319672856024,3.711573036218775,0.8578204163022253,0.74339285,"negative regulation of cell cycle phase transition"),
c("GO:0032728","positive regulation of interferon-beta production",0.003773517195062593,4.161379159828623,0.8088981967719671,0.29999534,"negative regulation of cell cycle phase transition"),
c("GO:0033044","regulation of chromosome organization",0.18193972487781543,3.0696286480879977,0.8618813189332235,0.17089234,"negative regulation of cell cycle phase transition"),
c("GO:0034248","regulation of amide metabolic process",1.4389695335439798,3.1529871126815947,0.8243645599264644,0.40157068,"negative regulation of cell cycle phase transition"),
c("GO:0034250","positive regulation of amide metabolic process",0.1441527933836909,3.631314652913987,0.7834894155339458,0.77294977,"negative regulation of cell cycle phase transition"),
c("GO:0042270","protection from natural killer cell mediated cytotoxicity",0.00017499655182850692,3.0347808458323127,0.8026358798699157,0.62427198,"negative regulation of cell cycle phase transition"),
c("GO:0042770","signal transduction in response to DNA damage",0.1690343453655047,7.791530497231425,0.7766239735558625,0.4445152,"negative regulation of cell cycle phase transition"),
c("GO:0043065","positive regulation of apoptotic process",0.19937283207616796,3.4387362696881687,0.7804302669240387,0.81862554,"negative regulation of cell cycle phase transition"),
c("GO:0043068","positive regulation of programmed cell death",0.20637269414930823,3.4666609337015726,0.7836331683291929,0.72360768,"negative regulation of cell cycle phase transition"),
c("GO:0043549","regulation of kinase activity",0.002792550608756315,4.391586933263806,0.8095630623551626,0.86887834,"negative regulation of cell cycle phase transition"),
c("GO:0043903","regulation of biological process involved in symbiotic interaction",0.01113323133252628,3.496165167959222,0.89038952924733,0.12942567,"negative regulation of cell cycle phase transition"),
c("GO:0045087","innate immune response",0.2587114515870314,4.662319928341337,0.8659054574704055,0.75342365,"negative regulation of cell cycle phase transition"),
c("GO:0045727","positive regulation of translation",0.13568641091142442,3.4475381762757515,0.7547829807333374,0.76864844,"negative regulation of cell cycle phase transition"),
c("GO:0045765","regulation of angiogenesis",0.07109050062520599,3.052053516151552,0.8624725066464325,0.52079099,"negative regulation of cell cycle phase transition"),
c("GO:0045786","negative regulation of cell cycle",0.3768020824491078,8.010431436068636,0.667053450631507,0.82216473,"negative regulation of cell cycle phase transition"),
c("GO:0045787","positive regulation of cell cycle",0.14396793787119605,5.894102847038607,0.6498357855402183,0.75775483,"negative regulation of cell cycle phase transition"),
c("GO:0051099","positive regulation of binding",0.0005890728998170868,3.210536025453514,0.8482215466624401,0.79008147,"negative regulation of cell cycle phase transition"),
c("GO:0051338","regulation of transferase activity",0.02434177388532865,6.958594097764583,0.8171028905651444,0.129406,"negative regulation of cell cycle phase transition"),
c("GO:0051607","defense response to virus",0.17287441054506547,4.050344677590793,0.9050001271104264,0.83698351,"negative regulation of cell cycle phase transition"),
c("GO:0052372","modulation by symbiont of entry into host",0.010312472857048914,3.605932584235092,0.8908778416551802,0.12876124,"negative regulation of cell cycle phase transition"),
c("GO:0070434","positive regulation of nucleotide-binding oligomerization domain containing 2 signaling pathway",0.0004387237496545667,3.8805465569492092,0.7927658148078571,0.65417806,"negative regulation of cell cycle phase transition"),
c("GO:0072331","signal transduction by p53 class mediator",0.029643429983682437,7.121894572865278,0.8098972182078371,0.39451702,"negative regulation of cell cycle phase transition"),
c("GO:0072332","intrinsic apoptotic signaling pathway by p53 class mediator",0.01680952793620306,4.895109930939593,0.7931520089287135,0.83300017,"negative regulation of cell cycle phase transition"),
c("GO:0090068","positive regulation of cell cycle process",0.13526740508310264,3.746444056276699,0.637040578583704,0.80172934,"negative regulation of cell cycle phase transition"),
c("GO:0090270","regulation of fibroblast growth factor production",0.0005052717341527313,3.0347808458323127,0.8745466373515722,0.56125764,"negative regulation of cell cycle phase transition"),
c("GO:0090329","regulation of DNA-templated DNA replication",0.05107188099209144,3.0641788006776505,0.8480699954802833,0.28847515,"negative regulation of cell cycle phase transition"),
c("GO:0097190","apoptotic signaling pathway",0.12421551017607413,6.289317005676284,0.7895480482371291,0.78411935,"negative regulation of cell cycle phase transition"),
c("GO:0097193","intrinsic apoptotic signaling pathway",0.06402409056756754,8.74480639288521,0.779251515388577,0.15725886,"negative regulation of cell cycle phase transition"),
c("GO:0140546","defense response to symbiont",0.5606297982945379,4.008895477748708,0.8978822531331282,0.85688139,"negative regulation of cell cycle phase transition"),
c("GO:1901798","positive regulation of signal transduction by p53 class mediator",0.0043453369137134885,4.982174712247662,0.8009525775514208,0.13045237,"negative regulation of cell cycle phase transition"),
c("GO:1901987","regulation of cell cycle phase transition",0.4562751643809159,7.674946411414621,0.6578999600637185,0.89722783,"negative regulation of cell cycle phase transition"),
c("GO:1902749","regulation of cell cycle G2/M phase transition",0.14470489518100904,5.228288302652975,0.6733790546970041,0.87409726,"negative regulation of cell cycle phase transition"),
c("GO:1902750","negative regulation of cell cycle G2/M phase transition",0.10658522376439371,5.827947566033281,0.6606663537735871,0.89737152,"negative regulation of cell cycle phase transition"),
c("GO:1904029","regulation of cyclin-dependent protein kinase activity",0.00033273992249082307,6.685187280065528,0.6921478510106293,0.83498672,"negative regulation of cell cycle phase transition"),
c("GO:1905818","regulation of chromosome separation",0.09750512099064414,3.6721191763789145,0.6917055994569404,0.78101684,"negative regulation of cell cycle phase transition"),
c("GO:1990823","response to leukemia inhibitory factor",0.01402683628811314,4.216974950292198,0.9425668534622924,0.64748561,"negative regulation of cell cycle phase transition"),
c("GO:1990830","cellular response to leukemia inhibitory factor",0.013802544932952658,3.936988064916611,0.9303569664485677,0.20845641,"negative regulation of cell cycle phase transition"),
c("GO:2000765","regulation of cytoplasmic translation",0.027225519880249117,3.7291357808766112,0.8283392733927755,0.66974603,"negative regulation of cell cycle phase transition"),
c("GO:2000767","positive regulation of cytoplasmic translation",0.013070517103472849,3.257325919834471,0.7860070191212253,0.84047089,"negative regulation of cell cycle phase transition"),
c("GO:2001235","positive regulation of apoptotic signaling pathway",0.054532376185996004,3.1603086635826902,0.7574673487084936,0.89870889,"negative regulation of cell cycle phase transition"),
c("GO:2001242","regulation of intrinsic apoptotic signaling pathway",0.043229077781974413,4.387842956349132,0.7955861298879628,0.51067662,"negative regulation of cell cycle phase transition"),
c("GO:2001244","positive regulation of intrinsic apoptotic signaling pathway",0.01423140972194083,4.47447938917191,0.7748660210167203,0.79141042,"negative regulation of cell cycle phase transition"),
c("GO:1903047","mitotic cell cycle process",0.9528882663283861,12.852456268858393,0.7651640464317331,0.0103512,"mitotic cell cycle process"),
c("GO:0000070","mitotic sister chromatid segregation",0.1961341634972573,4.743601364335631,0.6895906380502966,0.8071082,"mitotic cell cycle process"),
c("GO:0000086","G2/M transition of mitotic cell cycle",0.018054221720335398,4.2494283054087685,0.8036828466554139,0.85352189,"mitotic cell cycle process"),
c("GO:0007052","mitotic spindle organization",0.2250209182497939,3.6310782507186325,0.7076247821963654,0.81742359,"mitotic cell cycle process"),
c("GO:0007059","chromosome segregation",0.7290602823192258,3.4338838981879936,0.7855630357960555,0.79900355,"mitotic cell cycle process"),
c("GO:0044770","cell cycle phase transition",0.15934298703043864,9.115384819143332,0.808049567089942,0.68949383,"mitotic cell cycle process"),
c("GO:0044772","mitotic cell cycle phase transition",0.15786414293047943,7.758478617813985,0.7749718188283684,0.7913315,"mitotic cell cycle process"),
c("GO:0044839","cell cycle G2/M phase transition",0.018515128131489353,5.196101786639072,0.8177005013525712,0.85495195,"mitotic cell cycle process"),
c("GO:0051304","chromosome separation",0.03369546281757068,3.9973326485834373,0.8214118783257871,0.60480219,"mitotic cell cycle process"),
c("GO:0098813","nuclear chromosome segregation",0.33031461816688995,3.1079990105540864,0.7918987388637821,0.81782676,"mitotic cell cycle process"),
c("GO:0140014","mitotic nuclear division",0.20562094839849565,3.5276459760419323,0.7081724223578824,0.86557199,"mitotic cell cycle process"),
c("GO:1902850","microtubule cytoskeleton organization involved in mitosis",0.27708608952902464,4.154424527479873,0.7031947073924015,0.83356227,"mitotic cell cycle process"),
c("GO:1902969","mitotic DNA replication",0.07283800140332447,5.625746772721824,0.7143246755190684,0.73980038,"mitotic cell cycle process"));

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

