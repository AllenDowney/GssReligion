#delimit ;

   infix
      year     1 - 20
      compuse  21 - 40
      webmob   41 - 60
      emailmin 61 - 80
      emailhr  81 - 100
      usewww   101 - 120
      wwwhr    121 - 140
      wwwmin   141 - 160
      intrhome 161 - 180
      parelkid 181 - 200
      hispanic 201 - 220
      sei      221 - 240
      cohort   241 - 260
      ballot   261 - 280
      wtssall  281 - 300
      sei10    301 - 320
      tvhours  321 - 340
      relactiv 341 - 360
      god      361 - 380
      conclerg 381 - 400
      id_      401 - 420
      age      421 - 440
      educ     441 - 460
      sex      461 - 480
      race     481 - 500
      res16    501 - 520
      income   521 - 540
      rincome  541 - 560
      srcbelt  561 - 580
      relig    581 - 600
      denom    601 - 620
      fund     621 - 640
      relig16  641 - 660
      denom16  661 - 680
      fund16   681 - 700
      sprel    701 - 720
      bible    721 - 740
      relactiv1 741 - 760
using GSS.dat;

label variable year     "Gss year for this respondent                       ";
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
label variable sei10    "R's socioeconomic index (2010)";
label variable tvhours  "Hours per day watching tv";
label variable relactiv "How often does r take part in relig activities";
label variable god      "Rs confidence in the existence of god";
label variable conclerg "Confidence in organized religion";
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
label variable sprel    "Spouses religious preference";
label variable bible    "Feelings about the bible";
label variable relactiv1 "How often does r take part in relig activities";


label define gsp001x
   9        "No answer"
   8        "Don't know"
   2        "No"
   1        "Yes"
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
   99       "No answer"
   98       "Don't know"
   -1       "Not applicable"
;
label define gsp004x
   999      "No answer"
   998      "Don't know"
   -1       "Not applicable"
;
label define gsp005x
   9        "No answer"
   8        "Don't know"
   2        "No"
   1        "Yes"
   0        "Not applicable"
;
label define gsp006x
   999      "No answer"
   998      "Don't know"
   -1       "Not applicable"
;
label define gsp007x
   99       "No answer"
   98       "Don't know"
   -1       "Not applicable"
;
label define gsp008x
   9        "No answer"
   8        "Dont know"
   2        "No"
   1        "Yes"
   0        "Not applicable"
;
label define gsp009x
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
label define gsp010x
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
label define gsp011x
   99.9     "No answer"
   99.8     "Don't know"
   -1       "Not applicable"
;
label define gsp012x
   9999     "No answer"
   0        "Not applicable"
;
label define gsp013x
   4        "Ballot d"
   3        "Ballot c"
   2        "Ballot b"
   1        "Ballot a"
   0        "Not applicable"
;
label define gsp014x
   99       "No answer"
   98       "Don't know"
   -1       "Not applicable"
;
label define gsp015x
   99       "No answer"
   98       "Don't know"
   11       "Several times a day"
   10       "Once a day"
   9        "Several times a week"
   8        "Every week"
   7        "Nearly every week"
   6        "2-3 times a month"
   5        "About once a month"
   4        "Several times a year"
   3        "About once or twice a year"
   2        "Less than once a year"
   1        "Never"
   0        "Not applicable"
;
label define gsp016x
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
label define gsp017x
   9        "No answer"
   8        "Don't know"
   3        "Hardly any"
   2        "Only some"
   1        "A great deal"
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
label define gsp032x
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
label define gsp033x
   9        "No answer"
   8        "Don't know"
   4        "Other"
   3        "Book of fables"
   2        "Inspired word"
   1        "Word of god"
   0        "Not applicable"
;
label define gsp034x
   99       "No answer"
   98       "Dont know"
   9        "Several times a week"
   8        "Every week"
   7        "Nearly every week"
   6        "2-3 times a month"
   5        "About once a month"
   4        "Several times a year"
   3        "About once or twice a year"
   2        "Less than once a year"
   1        "Never"
   0        "Not applicable"
;


label values compuse  gsp001x;
label values webmob   gsp002x;
label values emailmin gsp003x;
label values emailhr  gsp004x;
label values usewww   gsp005x;
label values wwwhr    gsp006x;
label values wwwmin   gsp007x;
label values intrhome gsp008x;
label values parelkid gsp009x;
label values hispanic gsp010x;
label values sei      gsp011x;
label values cohort   gsp012x;
label values ballot   gsp013x;
label values tvhours  gsp014x;
label values relactiv gsp015x;
label values god      gsp016x;
label values conclerg gsp017x;
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
label values sprel    gsp032x;
label values bible    gsp033x;
label values relactiv1 gsp034x;


