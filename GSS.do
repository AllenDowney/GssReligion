#delimit ;

   infix
      year     1 - 20
      god      21 - 40
      compuse  41 - 60
      webmob   61 - 80
      emailmin 81 - 100
      emailhr  101 - 120
      usewww   121 - 140
      wwwhr    141 - 160
      wwwmin   161 - 180
      intrhome 181 - 200
      parelkid 201 - 220
      hispanic 221 - 240
      sei      241 - 260
      cohort   261 - 280
      ballot   281 - 300
      wtssall  301 - 320
      conclerg 321 - 340
      bible    341 - 360
      sprel    361 - 380
      id_      381 - 400
      age      401 - 420
      educ     421 - 440
      sex      441 - 460
      race     461 - 480
      res16    481 - 500
      income   501 - 520
      rincome  521 - 540
      srcbelt  541 - 560
      relig    561 - 580
      denom    581 - 600
      fund     601 - 620
      relig16  621 - 640
      denom16  641 - 660
      fund16   661 - 680
      sei10    681 - 700
using GSS.dat;

label variable year     "Gss year for this respondent                       ";
label variable god      "Rs confidence in the existence of god";
label variable compuse  "R use computer";
label variable webmob   "R uses home internet through mobile device";
label variable emailmin "Email minutes per week";
label variable emailhr  "Email hours per week";
label variable usewww   "R use www other than email";
label variable wwwhr    "Www hours per week";
label variable wwwmin   "Www minutes per week";
label variable intrhome "Internet access in r's home";
label variable parelkid "Father's religion when r was child";
label variable hispanic "Hispanic specified";
label variable sei      "Respondent socioeconomic index";
label variable cohort   "Year of birth";
label variable ballot   "Ballot used for interview";
label variable wtssall  "Weight variable";
label variable conclerg "Confidence in organized religion";
label variable bible    "Feelings about the bible";
label variable sprel    "Spouses religious preference";
label variable id_      "Respondent id number";
label variable age      "Age of respondent";
label variable educ     "Highest year of school completed";
label variable sex      "Respondents sex";
label variable race     "Race of respondent";
label variable res16    "Type of place lived in when 16 yrs old";
label variable income   "Total family income";
label variable rincome  "Respondents income";
label variable srcbelt  "Src beltcode";
label variable relig    "Rs religious preference";
label variable denom    "Specific denomination";
label variable fund     "How fundamentalist is r currently";
label variable relig16  "Religion in which raised";
label variable denom16  "Denomination in which r was raised";
label variable fund16   "How fundamentalist was r at age 16";
label variable sei10    "R's socioeconomic index (2010)";


label define gsp001x
   9        "No answer"
   8        "Don't know"
   6        "Know god exists"
   5        "Believe but doubts"
   4        "Believe sometimes"
   3        "Some higher power"
   2        "No way to find out"
   1        "Dont believe"
   0        "Not applicable"
;
label define gsp002x
   9        "No answer"
   8        "Don't know"
   2        "No"
   1        "Yes"
   0        "Not applicable"
;
label define gsp003x
   9        "No answer"
   8        "Don't know"
   2        "No"
   1        "Yes"
   0        "Not applicable"
;
label define gsp004x
   99       "No answer"
   98       "Don't know"
   -1       "Not applicable"
;
label define gsp005x
   999      "No answer"
   998      "Don't know"
   -1       "Not applicable"
;
label define gsp006x
   9        "No answer"
   8        "Don't know"
   2        "No"
   1        "Yes"
   0        "Not applicable"
;
label define gsp007x
   999      "No answer"
   998      "Don't know"
   -1       "Not applicable"
;
label define gsp008x
   99       "No answer"
   98       "Don't know"
   -1       "Not applicable"
;
label define gsp009x
   9        "No answer"
   8        "Dont know"
   2        "No"
   1        "Yes"
   0        "Not applicable"
;
label define gsp010x
   9        "No answer"
   8        "Don't know"
   7        "No religion"
   6        "Other -specify"
   5        "Moslem"
   4        "Orthodox greek, russian, etc"
   3        "Jewish"
   2        "Catholic"
   1        "Protestant"
   0        "Not applicable"
;
label define gsp011x
   99       "No answer"
   98       "Don't know"
   50       "Other, not specified"
   47       "Hispanic"
   46       "Latino/a"
   45       "Latin"
   41       "South american"
   40       "Latin american"
   35       "Filipino/a"
   31       "Basque"
   30       "Spanish"
   25       "Chilean"
   24       "Argentinian"
   23       "Venezuelan"
   22       "Columbian"
   21       "Equadorian"
   20       "Peruvian"
   16       "West indian"
   15       "Dominican"
   11       "Honduran"
   10       "Central american"
   9        "Costa rican"
   8        "Nicaraguan"
   7        "Panamanian"
   6        "Guatemalan"
   5        "Salvadorian"
   4        "Cuban"
   3        "Puerto rican"
   2        "Mexican, mexican american, chicano/a"
   1        "Not hispanic"
   0        "Not applicable"
;
label define gsp012x
   99.9     "No answer"
   99.8     "Don't know"
   -1       "Not applicable"
;
label define gsp013x
   9999     "No answer"
   0        "Not applicable"
;
label define gsp014x
   4        "Ballot d"
   3        "Ballot c"
   2        "Ballot b"
   1        "Ballot a"
   0        "Not applicable"
;
label define gsp015x
   9        "No answer"
   8        "Don't know"
   3        "Hardly any"
   2        "Only some"
   1        "A great deal"
   0        "Not applicable"
;
label define gsp016x
   9        "No answer"
   8        "Don't know"
   4        "Other"
   3        "Book of fables"
   2        "Inspired word"
   1        "Word of god"
   0        "Not applicable"
;
label define gsp017x
   99       "No answer"
   98       "Don't know"
   13       "Inter-nondenominational"
   12       "Native american"
   11       "Christian"
   10       "Orthodox-christian"
   9        "Moslem/islam"
   8        "Other eastern"
   7        "Hinduism"
   6        "Buddhism"
   5        "Other"
   4        "None"
   3        "Jewish"
   2        "Catholic"
   1        "Protestant"
   0        "Not applicable"
;
label define gsp018x
   99       "No answer"
   98       "Don't know"
   89       "89 or older"
;
label define gsp019x
   99       "No answer"
   98       "Don't know"
   97       "Not applicable"
;
label define gsp020x
   2        "Female"
   1        "Male"
;
label define gsp021x
   3        "Other"
   2        "Black"
   1        "White"
   0        "Not applicable"
;
label define gsp022x
   9        "No answer"
   8        "Don't know"
   6        "City gt 250000"
   5        "Big-city suburb"
   4        "50000 to 250000"
   3        "Town lt 50000"
   2        "Farm"
   1        "Country,nonfarm"
   0        "Not applicable"
;
label define gsp023x
   99       "No answer"
   98       "Don't know"
   13       "Refused"
   12       "$25000 or more"
   11       "$20000 - 24999"
   10       "$15000 - 19999"
   9        "$10000 - 14999"
   8        "$8000 to 9999"
   7        "$7000 to 7999"
   6        "$6000 to 6999"
   5        "$5000 to 5999"
   4        "$4000 to 4999"
   3        "$3000 to 3999"
   2        "$1000 to 2999"
   1        "Lt $1000"
   0        "Not applicable"
;
label define gsp024x
   99       "No answer"
   98       "Don't know"
   13       "Refused"
   12       "$25000 or more"
   11       "$20000 - 24999"
   10       "$15000 - 19999"
   9        "$10000 - 14999"
   8        "$8000 to 9999"
   7        "$7000 to 7999"
   6        "$6000 to 6999"
   5        "$5000 to 5999"
   4        "$4000 to 4999"
   3        "$3000 to 3999"
   2        "$1000 to 2999"
   1        "Lt $1000"
   0        "Not applicable"
;
label define gsp025x
   6        "Other rural"
   5        "Other urban"
   4        "Suburb, 13-100"
   3        "Suburb, 12 lrgst"
   2        "Smsa's 13-100"
   1        "12 lrgst smsa's"
   0        "Not assigned"
;
label define gsp026x
   99       "No answer"
   98       "Don't know"
   13       "Inter-nondenominational"
   12       "Native american"
   11       "Christian"
   10       "Orthodox-christian"
   9        "Moslem/islam"
   8        "Other eastern"
   7        "Hinduism"
   6        "Buddhism"
   5        "Other"
   4        "None"
   3        "Jewish"
   2        "Catholic"
   1        "Protestant"
   0        "Not applicable"
;
label define gsp027x
   99       "No answer"
   98       "Don't know"
   70       "No denomination"
   60       "Other"
   50       "Episcopal"
   48       "Presbyterian-dk wh"
   43       "Presbyterian, merged"
   42       "Other presbyterian"
   41       "United pres ch in us"
   40       "Presbyterian c in us"
   38       "Lutheran-dk which"
   35       "Evangelical luth"
   34       "Other lutheran"
   33       "Wi evan luth synod"
   32       "Lutheran-mo synod"
   31       "Luth ch in america"
   30       "Am lutheran"
   28       "Methodist-dk which"
   23       "Other methodist"
   22       "United methodist"
   21       "Afr meth ep zion"
   20       "Afr meth episcopal"
   18       "Baptist-dk which"
   15       "Other baptists"
   14       "Southern baptist"
   13       "Nat bapt conv usa"
   12       "Nat bapt conv of am"
   11       "Am bapt ch in usa"
   10       "Am baptist asso"
   0        "Not applicable"
;
label define gsp028x
   9        "Na-excluded"
   8        "Don't know"
   3        "Liberal"
   2        "Moderate"
   1        "Fundamentalist"
   0        "Not applicable"
;
label define gsp029x
   99       "No answer"
   98       "Don't know"
   13       "Inter-nondenominational"
   12       "Native american"
   11       "Christian"
   10       "Orthodox-christian"
   9        "Moslem/islam"
   8        "Other eastern"
   7        "Hinduism"
   6        "Buddhism"
   5        "Other"
   4        "None"
   3        "Jewish"
   2        "Catholic"
   1        "Protestant"
   0        "Not applicable"
;
label define gsp030x
   99       "No answer"
   98       "Don't know"
   70       "No denomination"
   60       "Other"
   50       "Episcopal"
   48       "Presbyterian-dk wh"
   43       "Presbyterian, merged"
   42       "Other presbyterian"
   41       "United pres ch in us"
   40       "Presbyterian c in us"
   38       "Lutheran-dk which"
   35       "Evangelical luth"
   34       "Other lutheran"
   33       "Wi evan luth synod"
   32       "Lutheran-mo synod"
   31       "Luth ch in america"
   30       "Am lutheran"
   28       "Methodist-dk which"
   23       "Other methodist"
   22       "United methodist"
   21       "Afr meth ep zion"
   20       "Afr meth episcopal"
   18       "Baptist-dk which"
   15       "Other baptists"
   14       "Southern baptist"
   13       "Nat bapt conv usa"
   12       "Nat bapt conv of am"
   11       "Am bapt ch in usa"
   10       "Am baptist asso"
   0        "Not applicable"
;
label define gsp031x
   9        "Na-excluded"
   8        "Don't know"
   3        "Liberal"
   2        "Moderate"
   1        "Fundamentalist"
   0        "Not applicable"
;


label values god      gsp001x;
label values compuse  gsp002x;
label values webmob   gsp003x;
label values emailmin gsp004x;
label values emailhr  gsp005x;
label values usewww   gsp006x;
label values wwwhr    gsp007x;
label values wwwmin   gsp008x;
label values intrhome gsp009x;
label values parelkid gsp010x;
label values hispanic gsp011x;
label values sei      gsp012x;
label values cohort   gsp013x;
label values ballot   gsp014x;
label values conclerg gsp015x;
label values bible    gsp016x;
label values sprel    gsp017x;
label values age      gsp018x;
label values educ     gsp019x;
label values sex      gsp020x;
label values race     gsp021x;
label values res16    gsp022x;
label values income   gsp023x;
label values rincome  gsp024x;
label values srcbelt  gsp025x;
label values relig    gsp026x;
label values denom    gsp027x;
label values fund     gsp028x;
label values relig16  gsp029x;
label values denom16  gsp030x;
label values fund16   gsp031x;


