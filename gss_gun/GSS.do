#delimit ;

   infix
      year     1 - 20
      conrinc  21 - 40
      cohort   41 - 60
      ballot   61 - 80
      wtssall  81 - 100
      income   101 - 120
      finrela  121 - 140
      realinc  141 - 160
      sex      161 - 180
      homosex  181 - 200
      hispanic 201 - 220
      rowngun  221 - 240
      owngun   241 - 260
      id_      261 - 280
      age      281 - 300
      race     301 - 320
      srcbelt  321 - 340
      polviews 341 - 360
      natcrime 361 - 380
      gunlaw   381 - 400
      gun      401 - 420
      gunage   421 - 440
      gunnum   441 - 460
      educ     461 - 480
using GSS.dat;

label variable year     "Gss year for this respondent                       ";
label variable conrinc  "Respondent income in constant dollars";
label variable cohort   "Year of birth";
label variable ballot   "Ballot used for interview";
label variable wtssall  "Weight variable";
label variable income   "Total family income";
label variable finrela  "Opinion of family income";
label variable realinc  "Family income in constant $";
label variable sex      "Respondents sex";
label variable homosex  "Homosexual sex relations";
label variable hispanic "Hispanic specified";
label variable rowngun  "Does gun belong to r";
label variable owngun   "Have gun in home";
label variable id_      "Respondent id number";
label variable age      "Age of respondent";
label variable race     "Race of respondent";
label variable srcbelt  "Src beltcode";
label variable polviews "Think of self as liberal or conservative";
label variable natcrime "Halting rising crime rate";
label variable gunlaw   "Favor or oppose gun permits";
label variable gun      "Ever threatened with gun or shot at";
label variable gunage   "Threatened or shot at as child or adult";
label variable gunnum   "If threatened or shot at--how many times";
label variable educ     "Highest year of school completed";


label define gsp001x
   999999   "No answer"
   999998   "Dont know"
   0        "Not applicable"
;
label define gsp002x
   9999     "No answer"
   0        "Not applicable"
;
label define gsp003x
   4        "Ballot d"
   3        "Ballot c"
   2        "Ballot b"
   1        "Ballot a"
   0        "Not applicable"
;
label define gsp004x
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
label define gsp005x
   9        "No answer"
   8        "Don't know"
   5        "Far above average"
   4        "Above average"
   3        "Average"
   2        "Below average"
   1        "Far below average"
   0        "Not applicable"
;
label define gsp006x
   999999   "No answer"
   999998   "Dont know"
   0        "Not applicable"
;
label define gsp007x
   2        "Female"
   1        "Male"
;
label define gsp008x
   9        "No answer"
   8        "Don't know"
   5        "Other"
   4        "Not wrong at all"
   3        "Sometimes wrong"
   2        "Almst always wrg"
   1        "Always wrong"
   0        "Not applicable"
;
label define gsp009x
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
label define gsp010x
   9        "No answer"
   8        "Don't know"
   3        "Refused"
   2        "No"
   1        "Yes"
   0        "Not applicable"
;
label define gsp011x
   9        "No answer"
   8        "Don't know"
   3        "Refused"
   2        "No"
   1        "Yes"
   0        "Not applicable"
;
label define gsp012x
   99       "No answer"
   98       "Don't know"
   89       "89 or older"
;
label define gsp013x
   3        "Other"
   2        "Black"
   1        "White"
   0        "Not applicable"
;
label define gsp014x
   6        "Other rural"
   5        "Other urban"
   4        "Suburb, 13-100"
   3        "Suburb, 12 lrgst"
   2        "Smsa's 13-100"
   1        "12 lrgst smsa's"
   0        "Not assigned"
;
label define gsp015x
   9        "No answer"
   8        "Don't know"
   7        "Extrmly conservative"
   6        "Conservative"
   5        "Slghtly conservative"
   4        "Moderate"
   3        "Slightly liberal"
   2        "Liberal"
   1        "Extremely liberal"
   0        "Not applicable"
;
label define gsp016x
   9        "No answer"
   8        "Don't know"
   3        "Too much"
   2        "About right"
   1        "Too little"
   0        "Not applicable"
;
label define gsp017x
   9        "No answer"
   8        "Don't know"
   2        "Oppose"
   1        "Favor"
   0        "Not applicable"
;
label define gsp018x
   9        "No answer"
   8        "Don't know"
   2        "No"
   1        "Yes"
   0        "Not applicable"
;
label define gsp019x
   9        "No answer"
   8        "Don't know"
   3        "Both"
   2        "Adult"
   1        "Child"
   0        "Not applicable"
;
label define gsp020x
   9        "No answer"
   8        "Not sure"
   3        "4+ times"
   2        "2-3 times"
   1        "Once"
   0        "Not applicable"
;
label define gsp021x
   99       "No answer"
   98       "Don't know"
   97       "Not applicable"
;


label values conrinc  gsp001x;
label values cohort   gsp002x;
label values ballot   gsp003x;
label values income   gsp004x;
label values finrela  gsp005x;
label values realinc  gsp006x;
label values sex      gsp007x;
label values homosex  gsp008x;
label values hispanic gsp009x;
label values rowngun  gsp010x;
label values owngun   gsp011x;
label values age      gsp012x;
label values race     gsp013x;
label values srcbelt  gsp014x;
label values polviews gsp015x;
label values natcrime gsp016x;
label values gunlaw   gsp017x;
label values gun      gsp018x;
label values gunage   gsp019x;
label values gunnum   gsp020x;
label values educ     gsp021x;


