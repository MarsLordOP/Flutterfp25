import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final List<List<dynamic>> colleges = [
  [
    "Massachusetts Institute of Technology",
    "Cambridge",
    "north",
    0.07,
    3.9,
    11415,
    0.085,
    "\$55,510",
    "https://web.mit.edu",
  ],
  [
    "Stanford University",
    "Stanford",
    "west",
    0.043,
    3.87,
    17000,
    0.065,
    "\$56,169",
    "https://stanford.edu",
  ],
  [
    "Harvard University",
    "Cambridge",
    "north",
    0.05,
    3.9,
    23731,
    0.095,
    "\$57,246",
    "https://harvard.edu",
  ],
  [
    "California Institute of Technology",
    "Pasadena",
    "west",
    0.065,
    3.9,
    2200,
    0.085,
    "\$56,862",
    "https://caltech.edu",
  ],
  [
    "Princeton University",
    "Princeton",
    "north",
    0.048,
    3.9,
    8400,
    0.12,
    "\$57,410",
    "https://princeton.edu",
  ],
  [
    "Yale University",
    "New Haven",
    "north",
    0.06,
    3.9,
    13100,
    0.115,
    "\$59,950",
    "https://yale.edu",
  ],
  [
    "University of Chicago",
    "Chicago",
    "north",
    0.06,
    3.8,
    17300,
    0.12,
    "\$59,256",
    "https://uchicago.edu",
  ],
  [
    "Columbia University",
    "New York",
    "north",
    0.056,
    3.85,
    31000,
    0.08,
    "\$61,788",
    "https://columbia.edu",
  ],
  [
    "University of Pennsylvania",
    "Philadelphia",
    "north",
    0.075,
    3.8,
    25860,
    0.135,
    "\$60,042",
    "https://upenn.edu",
  ],
  [
    "Johns Hopkins University",
    "Baltimore",
    "north",
    0.07,
    3.8,
    23150,
    0.18,
    "\$58,720",
    "https://jhu.edu",
  ],
  // Top Public Universities
  [
    "UC Berkeley",
    "Berkeley",
    "west",
    0.15,
    3.7,
    42000,
    0.05,
    "\$44,115",
    "https://berkeley.edu",
  ],
  [
    "UCLA",
    "Los Angeles",
    "west",
    0.12,
    3.7,
    45000,
    0.06,
    "\$43,012",
    "https://ucla.edu",
  ],
  [
    "University of Michigan",
    "Ann Arbor",
    "north",
    0.156,
    3.9,
    98310,
    0.473,
    "\$63,962",
    "https://umich.edu",
  ],
  [
    "University of Virginia",
    "Charlottesville",
    "south",
    0.162,
    3.85,
    56439,
    0.380,
    "\$57,696",
    "https://virginia.edu",
  ],
  [
    "University of North Carolina Chapel Hill",
    "Chapel Hill",
    "south",
    0.19,
    3.6,
    30000,
    0.05,
    "\$36,159",
    "https://unc.edu",
  ],
  [
    "University of Texas at Austin",
    "Austin",
    "south",
    0.290,
    3.8,
    90000,
    0.490,
    "\$44,908",
    "https://utexas.edu",
  ],
  [
    "University of Florida",
    "Gainesville",
    "south",
    0.240,
    4.0,
    65375,
    0.431,
    "\$28,658",
    "https://ufl.edu",
  ],
  [
    "University of Washington",
    "Seattle",
    "west",
    0.49,
    3.5,
    47571,
    0.04,
    "\$39,114",
    "https://washington.edu",
  ],
  [
    "Georgia Institute of Technology",
    "Atlanta",
    "south",
    0.18,
    3.7,
    32000,
    0.05,
    "\$33,882",
    "https://gatech.edu",
  ],
  [
    "UC San Diego",
    "La Jolla",
    "west",
    0.23,
    3.6,
    39000,
    0.05,
    "\$44,487",
    "https://ucsd.edu",
  ],
  // Private Elite Liberal Arts
  [
    "Williams College",
    "Williamstown",
    "north",
    0.07,
    3.9,
    2000,
    0.19,
    "\$61,930",
    "https://williams.edu",
  ],
  [
    "Amherst College",
    "Amherst",
    "north",
    0.12,
    3.9,
    2300,
    0.18,
    "\$62,021",
    "https://amherst.edu",
  ],
  [
    "Bowdoin College",
    "Brunswick",
    "north",
    0.09,
    4.0,
    2000,
    0.20,
    "\$63,110",
    "https://bowdoin.edu",
  ],
  [
    "Swarthmore College",
    "Swarthmore",
    "north",
    0.08,
    3.95,
    1650,
    0.22,
    "\$64,363",
    "https://swarthmore.edu",
  ],
  [
    "Pomona College",
    "Claremont",
    "west",
    0.07,
    3.95,
    1700,
    0.15,
    "\$64,870",
    "https://pomona.edu",
  ],
  [
    "Middlebury College",
    "Middlebury",
    "north",
    0.107,
    3.95,
    2600,
    0.446,
    "\$63,441",
    "https://middlebury.edu",
  ],
  [
    "Wellesley College",
    "Wellesley",
    "north",
    0.135,
    3.9,
    2300,
    0.45,
    "\$62,060",
    "https://wellesley.edu",
  ],
  [
    "Carleton College",
    "Northfield",
    "north",
    0.15,
    3.85,
    2100,
    0.12,
    "\$63,576",
    "https://carleton.edu",
  ],
  [
    "Davidson College",
    "Davidson",
    "south",
    0.14,
    3.8,
    1800,
    0.30,
    "\$58,510",
    "https://davidson.edu",
  ],
  [
    "Haverford College",
    "Haverford",
    "north",
    0.16,
    3.9,
    1350,
    0.18,
    "\$64,596",
    "https://haverford.edu",
  ],
  // Ivy League
  [
    "Cornell University",
    "Ithaca",
    "north",
    0.10,
    3.8,
    23600,
    0.12,
    "\$58,586",
    "https://cornell.edu",
  ],
  [
    "Brown University",
    "Providence",
    "north",
    0.07,
    3.8,
    10257,
    0.10,
    "\$60,696",
    "https://brown.edu",
  ],
  [
    "Dartmouth College",
    "Hanover",
    "north",
    0.09,
    3.8,
    6439,
    0.10,
    "\$61,596",
    "https://dartmouth.edu",
  ],
  // Top Private Research Universities
  [
    "Northwestern University",
    "Evanston",
    "north",
    0.07,
    3.8,
    21946,
    0.09,
    "\$60,276",
    "https://northwestern.edu",
  ],
  [
    "Duke University",
    "Durham",
    "south",
    0.065,
    3.8,
    15500,
    0.13,
    "\$60,594",
    "https://duke.edu",
  ],
  [
    "Vanderbilt University",
    "Nashville",
    "south",
    0.095,
    3.7,
    14000,
    0.12,
    "\$59,512",
    "https://vanderbilt.edu",
  ],
  [
    "Rice University",
    "Houston",
    "south",
    0.11,
    3.8,
    7124,
    0.17,
    "\$51,107",
    "https://rice.edu",
  ],
  [
    "Washington University St. Louis",
    "St. Louis",
    "south",
    0.15,
    3.7,
    15804,
    0.12,
    "\$58,866",
    "https://wustl.edu",
  ],
  [
    "Carnegie Mellon University",
    "Pittsburgh",
    "north",
    0.15,
    3.7,
    14300,
    0.12,
    "\$58,924",
    "https://cmu.edu",
  ],
  [
    "Emory University",
    "Atlanta",
    "south",
    0.19,
    3.7,
    15000,
    0.12,
    "\$59,570",
    "https://emory.edu",
  ],
  [
    "University of Southern California",
    "Los Angeles",
    "west",
    0.13,
    3.7,
    49500,
    0.06,
    "\$63,468",
    "https://usc.edu",
  ],
  [
    "Georgetown University",
    "Washington DC",
    "north",
    0.12,
    3.7,
    19000,
    0.11,
    "\$61,608",
    "https://georgetown.edu",
  ],
  [
    "Tufts University",
    "Medford",
    "north",
    0.115,
    3.9,
    11878,
    0.505,
    "\$64,340",
    "https://tufts.edu",
  ],
  // Strong Regional Universities
  [
    "New York University",
    "New York",
    "north",
    0.155,
    3.75,
    51000,
    0.12,
    "\$58,168",
    "https://nyu.edu",
  ],
  [
    "Boston University",
    "Boston",
    "north",
    0.18,
    3.5,
    34500,
    0.11,
    "\$60,944",
    "https://bu.edu",
  ],
  [
    "Northeastern University",
    "Boston",
    "north",
    0.07,
    3.8,
    27000,
    0.09,
    "\$59,100",
    "https://northeastern.edu",
  ],
  [
    "Case Western Reserve University",
    "Cleveland",
    "north",
    0.27,
    3.4,
    11507,
    0.11,
    "\$55,240",
    "https://case.edu",
  ],
  [
    "University of Rochester",
    "Rochester",
    "north",
    0.33,
    3.5,
    12000,
    0.10,
    "\$57,338",
    "https://rochester.edu",
  ],
  [
    "Tulane University",
    "New Orleans",
    "south",
    0.140,
    3.8,
    16000,
    0.458,
    "\$67,660",
    "https://tulane.edu",
  ],
  [
    "Wake Forest University",
    "Winston-Salem",
    "south",
    0.25,
    3.7,
    5200,
    0.12,
    "\$61,716",
    "https://wfu.edu",
  ],
  [
    "University of Miami",
    "Miami",
    "south",
    0.29,
    3.5,
    17000,
    0.05,
    "\$56,674",
    "https://miami.edu",
  ],
  [
    "University of Notre Dame",
    "Notre Dame",
    "north",
    0.18,
    3.7,
    12000,
    0.10,
    "\$59,794",
    "https://nd.edu",
  ],
  [
    "Syracuse University",
    "Syracuse",
    "north",
    0.44,
    3.55,
    22000,
    0.18,
    "\$59,420",
    "https://syracuse.edu",
  ],
  // UC System
  [
    "UC Davis",
    "Davis",
    "west",
    0.39,
    3.5,
    39131,
    0.04,
    "\$43,072",
    "https://ucdavis.edu",
  ],
  [
    "UC Santa Barbara",
    "Santa Barbara",
    "west",
    0.30,
    3.5,
    26061,
    0.03,
    "\$44,145",
    "https://ucsb.edu",
  ],
  [
    "UC Irvine",
    "Irvine",
    "west",
    0.27,
    3.5,
    36000,
    0.04,
    "\$44,145",
    "https://uci.edu",
  ],
  [
    "UC Santa Cruz",
    "Santa Cruz",
    "west",
    0.59,
    3.3,
    19700,
    0.04,
    "\$44,008",
    "https://ucsc.edu",
  ],
  [
    "UC Riverside",
    "Riverside",
    "west",
    0.66,
    3.2,
    26809,
    0.07,
    "\$43,613",
    "https://ucr.edu",
  ],
  [
    "UC Merced",
    "Merced",
    "west",
    0.87,
    3.0,
    8847,
    0.06,
    "\$43,570",
    "https://ucmerced.edu",
  ],
  // Cal State System
  [
    "Cal Poly San Luis Obispo",
    "San Luis Obispo",
    "west",
    0.28,
    3.75,
    22000,
    0.15,
    "\$28,500",
    "https://calpoly.edu",
  ],
  [
    "San Diego State University",
    "San Diego",
    "west",
    0.380,
    3.85,
    37000,
    0.190,
    "\$20,048",
    "https://sdsu.edu",
  ],
  [
    "Cal State Long Beach",
    "Long Beach",
    "west",
    0.402,
    3.70,
    38273,
    0.190,
    "\$18,738",
    "https://csulb.edu",
  ],
  [
    "San Jose State University",
    "San Jose",
    "west",
    0.670,
    3.65,
    36000,
    0.180,
    "\$19,515",
    "https://sjsu.edu",
  ],
  [
    "Cal State Fullerton",
    "Fullerton",
    "west",
    0.600,
    3.50,
    40000,
    0.190,
    "\$20,394",
    "https://fullerton.edu",
  ],
  [
    "Cal State Northridge",
    "Northridge",
    "west",
    0.62,
    3.30,
    39000,
    0.12,
    "\$29,300",
    "https://csun.edu",
  ],
  [
    "San Francisco State",
    "San Francisco",
    "west",
    0.590,
    3.30,
    30000,
    0.140,
    "\$23,790",
    "https://sfsu.edu",
  ],
  [
    "Cal State Sacramento",
    "Sacramento",
    "west",
    0.650,
    3.30,
    31000,
    0.180,
    "\$20,574",
    "https://csus.edu",
  ],
  [
    "Cal State San Marcos",
    "San Marcos",
    "west",
    0.65,
    3.25,
    17000,
    0.18,
    "\$20,150",
    "https://csusm.edu",
  ],
  [
    "Humboldt State",
    "Arcata",
    "west",
    0.60,
    3.30,
    8000,
    0.13,
    "\$21,200",
    "https://humboldt.edu",
  ],
  // Big Ten Universities
  [
    "University of Illinois Urbana-Champaign",
    "Champaign",
    "north",
    0.62,
    3.6,
    51196,
    0.06,
    "\$34,312",
    "https://illinois.edu",
  ],
  [
    "Ohio State University",
    "Columbus",
    "north",
    0.49,
    3.4,
    61170,
    0.06,
    "\$35,019",
    "https://osu.edu",
  ],
  [
    "Penn State",
    "University Park",
    "north",
    0.56,
    3.4,
    46810,
    0.05,
    "\$36,540",
    "https://psu.edu",
  ],
  [
    "University of Wisconsin Madison",
    "Madison",
    "north",
    0.54,
    3.4,
    45317,
    0.06,
    "\$38,630",
    "https://wisc.edu",
  ],
  [
    "Purdue University",
    "West Lafayette",
    "north",
    0.63,
    3.4,
    44551,
    0.07,
    "\$28,794",
    "https://purdue.edu",
  ],
  [
    "University of Minnesota Twin Cities",
    "Minneapolis",
    "north",
    0.44,
    3.4,
    51000,
    0.06,
    "\$33,325",
    "https://umn.edu",
  ],
  [
    "Michigan State University",
    "East Lansing",
    "north",
    0.75,
    3.2,
    50340,
    0.10,
    "\$37,868",
    "https://msu.edu",
  ],
  [
    "University of Maryland College Park",
    "College Park",
    "north",
    0.44,
    3.4,
    41000,
    0.05,
    "\$36,891",
    "https://umd.edu",
  ],
  [
    "Indiana University Bloomington",
    "Bloomington",
    "north",
    0.78,
    3.3,
    43000,
    0.06,
    "\$35,097",
    "https://indiana.edu",
  ],
  [
    "University of Iowa",
    "Iowa City",
    "north",
    0.86,
    3.3,
    31240,
    0.04,
    "\$31,233",
    "https://uiowa.edu",
  ],
  // SEC Universities
  [
    "University of Alabama",
    "Tuscaloosa",
    "south",
    0.792,
    3.75,
    38645,
    0.296,
    "\$33,940",
    "https://ua.edu",
  ],
  [
    "Auburn University",
    "Auburn",
    "south",
    0.85,
    3.4,
    30440,
    0.20,
    "\$32,908",
    "https://auburn.edu",
  ],
  [
    "University of Georgia",
    "Athens",
    "south",
    0.46,
    3.6,
    38920,
    0.08,
    "\$30,392",
    "https://uga.edu",
  ],
  [
    "University of Kentucky",
    "Lexington",
    "south",
    0.96,
    3.3,
    30500,
    0.05,
    "\$32,276",
    "https://uky.edu",
  ],
  [
    "Louisiana State University",
    "Baton Rouge",
    "south",
    0.74,
    3.3,
    34000,
    0.05,
    "\$29,970",
    "https://lsu.edu",
  ],
  [
    "University of Mississippi",
    "Oxford",
    "south",
    0.89,
    3.3,
    22000,
    0.03,
    "\$26,980",
    "https://olemiss.edu",
  ],
  [
    "Mississippi State University",
    "Starkville",
    "south",
    0.73,
    3.2,
    21000,
    0.11,
    "\$26,500",
    "https://msstate.edu",
  ],
  [
    "University of South Carolina",
    "Columbia",
    "south",
    0.69,
    3.4,
    35364,
    0.12,
    "\$35,110",
    "https://sc.edu",
  ],
  [
    "University of Tennessee Knoxville",
    "Knoxville",
    "south",
    0.78,
    3.3,
    28000,
    0.12,
    "\$31,000",
    "https://utk.edu",
  ],
  [
    "Texas A&M University",
    "College Station",
    "south",
    0.57,
    3.4,
    68679,
    0.05,
    "\$40,896",
    "https://tamu.edu",
  ],
  // ACC Universities
  [
    "Clemson University",
    "Clemson",
    "south",
    0.47,
    3.5,
    25000,
    0.14,
    "\$38,200",
    "https://clemson.edu",
  ],
  [
    "Florida State University",
    "Tallahassee",
    "south",
    0.36,
    3.45,
    41000,
    0.17,
    "\$21,600",
    "https://fsu.edu",
  ],
  [
    "NC State",
    "Raleigh",
    "south",
    0.45,
    3.5,
    36000,
    0.05,
    "\$29,220",
    "https://ncsu.edu",
  ],
  [
    "Virginia Tech",
    "Blacksburg",
    "south",
    0.66,
    3.4,
    37000,
    0.06,
    "\$34,814",
    "https://vt.edu",
  ],
  [
    "University of Pittsburgh",
    "Pittsburgh",
    "north",
    0.59,
    3.4,
    28923,
    0.10,
    "\$36,660",
    "https://pitt.edu",
  ],
  [
    "Boston College",
    "Chestnut Hill",
    "north",
    0.23,
    3.7,
    15000,
    0.08,
    "\$64,176",
    "https://bc.edu",
  ],
  // Pac-12 Universities
  [
    "University of Arizona",
    "Tucson",
    "west",
    0.85,
    3.3,
    45000,
    0.04,
    "\$34,804",
    "https://arizona.edu",
  ],
  [
    "Arizona State University",
    "Tempe",
    "west",
    0.85,
    3.3,
    74878,
    0.05,
    "\$31,000",
    "https://asu.edu",
  ],
  [
    "University of Colorado Boulder",
    "Boulder",
    "west",
    0.81,
    3.4,
    36000,
    0.05,
    "\$39,489",
    "https://colorado.edu",
  ],
  [
    "University of Oregon",
    "Eugene",
    "west",
    0.84,
    3.4,
    23000,
    0.05,
    "\$39,612",
    "https://uoregon.edu",
  ],
  [
    "Oregon State University",
    "Corvallis",
    "west",
    0.83,
    3.4,
    32000,
    0.04,
    "\$33,439",
    "https://oregonstate.edu",
  ],
  [
    "University of Utah",
    "Salt Lake City",
    "west",
    0.64,
    3.4,
    32994,
    0.04,
    "\$30,037",
    "https://utah.edu",
  ],
  [
    "Utah State University",
    "Logan",
    "west",
    0.86,
    3.2,
    27932,
    0.03,
    "\$27,261",
    "https://usu.edu",
  ],
  [
    "Washington State University",
    "Pullman",
    "west",
    0.76,
    3.2,
    31607,
    0.03,
    "\$28,202",
    "https://wsu.edu",
  ],
  // Major State Universities
  [
    "University of Central Florida",
    "Orlando",
    "south",
    0.44,
    3.4,
    69000,
    0.15,
    "\$22,470",
    "https://ucf.edu",
  ],
  [
    "University of Houston",
    "Houston",
    "south",
    0.62,
    3.3,
    46000,
    0.14,
    "\$27,960",
    "https://uh.edu",
  ],
  [
    "Texas Tech University",
    "Lubbock",
    "south",
    0.70,
    3.3,
    39000,
    0.12,
    "\$28,900",
    "https://ttu.edu",
  ],
  [
    "Texas State University",
    "San Marcos",
    "south",
    0.45,
    3.3,
    38000,
    0.12,
    "\$26,500",
    "https://txstate.edu",
  ],
  [
    "University of South Florida",
    "Tampa",
    "south",
    0.491,
    3.85,
    50830,
    0.285,
    "\$17,324",
    "https://usf.edu",
  ],
  [
    "Florida International University",
    "Miami",
    "south",
    0.588,
    4.10,
    54085,
    0.351,
    "\$18,000",
    "https://fiu.edu",
  ],
  [
    "Florida Atlantic University",
    "Boca Raton",
    "south",
    0.56,
    3.3,
    30000,
    0.12,
    "\$28,000",
    "https://fau.edu",
  ],
  [
    "University of Nevada Las Vegas",
    "Las Vegas",
    "west",
    0.680,
    3.40,
    31000,
    0.150,
    "\$26,280",
    "https://unlv.edu",
  ],
  [
    "University of Nevada Reno",
    "Reno",
    "west",
    0.66,
    3.2,
    21000,
    0.13,
    "\$26,300",
    "https://unr.edu",
  ],
  // Liberal Arts Colleges
  [
    "Colby College",
    "Waterville",
    "north",
    0.08,
    3.9,
    2000,
    0.15,
    "\$63,840",
    "https://colby.edu",
  ],
  [
    "Bates College",
    "Lewiston",
    "north",
    0.14,
    3.85,
    1800,
    0.18,
    "\$62,540",
    "https://bates.edu",
  ],
  [
    "Hamilton College",
    "Clinton",
    "north",
    0.12,
    3.85,
    1850,
    0.16,
    "\$63,870",
    "https://hamilton.edu",
  ],
  [
    "Colgate University",
    "Hamilton",
    "north",
    0.13,
    3.8,
    2900,
    0.27,
    "\$63,658",
    "https://colgate.edu",
  ],
  [
    "Bucknell University",
    "Lewisburg",
    "north",
    0.33,
    3.6,
    3600,
    0.12,
    "\$62,394",
    "https://bucknell.edu",
  ],
  [
    "Lafayette College",
    "Easton",
    "north",
    0.28,
    3.6,
    2600,
    0.09,
    "\$62,280",
    "https://lafayette.edu",
  ],
  [
    "Trinity College",
    "Hartford",
    "north",
    0.34,
    3.5,
    2200,
    0.18,
    "\$62,680",
    "https://trincoll.edu",
  ],
  [
    "Wesleyan University",
    "Middletown",
    "north",
    0.16,
    3.8,
    3000,
    0.15,
    "\$63,722",
    "https://wesleyan.edu",
  ],
  [
    "Vassar College",
    "Poughkeepsie",
    "north",
    0.24,
    3.7,
    2450,
    0.12,
    "\$62,870",
    "https://vassar.edu",
  ],
  [
    "Connecticut College",
    "New London",
    "north",
    0.40,
    3.5,
    1900,
    0.14,
    "\$62,235",
    "https://conncoll.edu",
  ],
  // HBCUs
  [
    "Howard University",
    "Washington DC",
    "north",
    0.36,
    3.55,
    7500,
    0.90,
    "\$38,250",
    "https://howard.edu",
  ],
  [
    "Spelman College",
    "Atlanta",
    "south",
    0.39,
    3.6,
    2100,
    0.95,
    "\$32,900",
    "https://spelman.edu",
  ],
  [
    "Morehouse College",
    "Atlanta",
    "south",
    0.60,
    3.3,
    2200,
    0.98,
    "\$28,850",
    "https://morehouse.edu",
  ],
  [
    "Hampton University",
    "Hampton",
    "south",
    0.68,
    3.2,
    3500,
    0.94,
    "\$26,874",
    "https://hamptonu.edu",
  ],
  [
    "Fisk University",
    "Nashville",
    "south",
    0.69,
    3.1,
    900,
    0.92,
    "\$24,500",
    "https://fisk.edu",
  ],
  [
    "Xavier University Louisiana",
    "New Orleans",
    "south",
    0.79,
    3.0,
    3100,
    0.88,
    "\$25,447",
    "https://xula.edu",
  ],
  [
    "Tuskegee University",
    "Tuskegee",
    "south",
    0.70,
    3.1,
    2500,
    0.91,
    "\$23,884",
    "https://tuskegee.edu",
  ],
  [
    "North Carolina A&T",
    "Greensboro",
    "south",
    0.75,
    3.0,
    12000,
    0.87,
    "\$22,486",
    "https://ncat.edu",
  ],
  // Women's Colleges
  [
    "Smith College",
    "Northampton",
    "north",
    0.32,
    3.8,
    2500,
    0.18,
    "\$58,750",
    "https://smith.edu",
  ],
  [
    "Mount Holyoke College",
    "South Hadley",
    "north",
    0.52,
    3.6,
    2200,
    0.15,
    "\$58,142",
    "https://mtholyoke.edu",
  ],
  [
    "Bryn Mawr College",
    "Bryn Mawr",
    "north",
    0.34,
    3.7,
    1350,
    0.16,
    "\$59,330",
    "https://brynmawr.edu",
  ],
  [
    "Barnard College",
    "New York",
    "north",
    0.08,
    3.9,
    2500,
    0.30,
    "\$61,738",
    "https://barnard.edu",
  ],
  [
    "Scripps College",
    "Claremont",
    "west",
    0.32,
    4.2,
    936,
    0.20,
    "\$58,442",
    "https://scrippscollege.edu",
  ],
  [
    "Mills College",
    "Oakland",
    "west",
    0.89,
    3.2,
    1200,
    0.25,
    "\$52,638",
    "https://mills.edu",
  ],
  // Religious Universities
  [
    "Brigham Young University",
    "Provo",
    "west",
    0.69,
    3.5,
    31441,
    0.01,
    "\$5,970",
    "https://byu.edu",
  ],
  [
    "Baylor University",
    "Waco",
    "south",
    0.45,
    3.6,
    17217,
    0.12,
    "\$50,232",
    "https://baylor.edu",
  ],
  [
    "Texas Christian University",
    "Fort Worth",
    "south",
    0.426,
    3.75,
    20517,
    0.285,
    "\$60,070",
    "https://tcu.edu",
  ],
  [
    "Southern Methodist University",
    "Dallas",
    "south",
    0.47,
    3.6,
    6800,
    0.10,
    "\$58,995",
    "https://smu.edu",
  ],
  [
    "Pepperdine University",
    "Malibu",
    "west",
    0.32,
    3.6,
    3500,
    0.08,
    "\$60,816",
    "https://pepperdine.edu",
  ],
  [
    "Villanova University",
    "Villanova",
    "north",
    0.25,
    3.7,
    10800,
    0.07,
    "\$61,773",
    "https://villanova.edu",
  ],
  [
    "Fordham University",
    "New York",
    "north",
    0.46,
    3.5,
    16000,
    0.12,
    "\$58,081",
    "https://fordham.edu",
  ],
  [
    "University of San Diego",
    "San Diego",
    "west",
    0.47,
    3.6,
    5700,
    0.06,
    "\$55,534",
    "https://sandiego.edu",
  ],
  [
    "Seattle University",
    "Seattle",
    "west",
    0.700,
    3.40,
    7500,
    0.140,
    "\$51,864",
    "https://seattleu.edu",
  ],
  [
    "Loyola Marymount University",
    "Los Angeles",
    "west",
    0.44,
    3.5,
    6500,
    0.08,
    "\$55,239",
    "https://lmu.edu",
  ],
  // Regional State Universities - North
  [
    "University of Vermont",
    "Burlington",
    "north",
    0.640,
    3.73,
    14088,
    0.200,
    "\$43,890",
    "https://uvm.edu",
  ],
  [
    "University of New Hampshire",
    "Durham",
    "north",
    0.730,
    3.50,
    15000,
    0.190,
    "\$34,816",
    "https://unh.edu",
  ],
  [
    "University of Maine",
    "Orono",
    "north",
    0.84,
    3.30,
    11000,
    0.13,
    "\$33,180",
    "https://maine.edu",
  ],
  [
    "University of Massachusetts Amherst",
    "Amherst",
    "north",
    0.63,
    3.5,
    31000,
    0.07,
    "\$36,578",
    "https://umass.edu",
  ],
  [
    "University of Connecticut",
    "Storrs",
    "north",
    0.56,
    3.6,
    27000,
    0.08,
    "\$38,340",
    "https://uconn.edu",
  ],
  [
    "University of Rhode Island",
    "Kingston",
    "north",
    0.766,
    3.60,
    17511,
    0.179,
    "\$34,362",
    "https://uri.edu",
  ],
  [
    "SUNY Binghamton",
    "Binghamton",
    "north",
    0.430,
    3.78,
    18000,
    0.220,
    "\$30,740",
    "https://binghamton.edu",
  ],
  [
    "SUNY Stony Brook",
    "Stony Brook",
    "north",
    0.490,
    3.75,
    25000,
    0.180,
    "\$30,350",
    "https://stonybrook.edu",
  ],
  [
    "SUNY Albany",
    "Albany",
    "north",
    0.64,
    3.4,
    17000,
    0.15,
    "\$28,890",
    "https://albany.edu",
  ],
  [
    "SUNY Buffalo",
    "Buffalo",
    "north",
    0.71,
    3.3,
    31000,
    0.12,
    "\$29,480",
    "https://buffalo.edu",
  ],
  // Regional Universities - South
  [
    "James Madison University",
    "Harrisonburg",
    "south",
    0.66,
    3.3,
    22000,
    0.13,
    "\$28,200",
    "https://jmu.edu",
  ],
  [
    "Virginia Commonwealth University",
    "Richmond",
    "south",
    0.91,
    3.2,
    29000,
    0.18,
    "\$36,048",
    "https://vcu.edu",
  ],
  [
    "Old Dominion University",
    "Norfolk",
    "south",
    0.64,
    3.3,
    24000,
    0.13,
    "\$27,700",
    "https://odu.edu",
  ],
  [
    "College of Charleston",
    "Charleston",
    "south",
    0.76,
    3.4,
    11000,
    0.08,
    "\$31,242",
    "https://cofc.edu",
  ],
  [
    "University of North Carolina Wilmington",
    "Wilmington",
    "south",
    0.56,
    3.4,
    17000,
    0.13,
    "\$28,200",
    "https://uncw.edu",
  ],
  [
    "Appalachian State University",
    "Boone",
    "south",
    0.776,
    3.75,
    20436,
    0.256,
    "\$25,077",
    "https://appstate.edu",
  ],
  [
    "East Carolina University",
    "Greenville",
    "south",
    0.64,
    3.3,
    29000,
    0.12,
    "\$27,400",
    "https://ecu.edu",
  ],

  // Add more colleges as needed
];

class CollegeSearchForm extends StatefulWidget {
  const CollegeSearchForm({super.key});

  @override
  State<CollegeSearchForm> createState() => _CollegeSearchFormState();
}

class _CollegeSearchFormState extends State<CollegeSearchForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fnameController = TextEditingController();
  final TextEditingController _lnameController = TextEditingController();
  final TextEditingController _gpaController = TextEditingController();

  String _selectedRegion = 'west';
  int _selectedSize = 1000;

  String? _personalInfo;
  List<List<dynamic>> _searchResults = [];

  final Map<String, int> _sizeOptions = {
    'Miniature (<1000)': 1000,
    'Small (<2000)': 2000,
    'Medium (<4000)': 4000,
    'Bigger Medium (<6000)': 6000,
    'Large (<15000)': 15000,
    'Extra Large (15001+)': 1000000000,
  };

  final List<String> _regions = ['west', 'east', 'north', 'south', 'all'];

  void _search() {
    if (!_formKey.currentState!.validate()) return;

    final fname = _fnameController.text.trim();
    final lname = _lnameController.text.trim();
    final gpa = double.tryParse(_gpaController.text.trim()) ?? 0.0;

    setState(() {
      _personalInfo = "College Search Results";

      _searchResults =
          colleges.where((college) {
            final _ = college[3] as double;
            final collegeGPA = college[4] as double;
            final enrollment = college[5] as int;
            final region = college[2] as String;

            bool regionMatch =
                _selectedRegion == 'all' || region == _selectedRegion;
            bool sizeMatch = enrollment <= _selectedSize;
            bool gpaMatch = gpa >= collegeGPA;

            return regionMatch && sizeMatch && gpaMatch;
          }).toList();
    });
  }

  @override
  void dispose() {
    _fnameController.dispose();
    _lnameController.dispose();
    _gpaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1e3c72), Color(0xFF2a5298)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  const Center(
                    child: Column(
                      children: [
                        Icon(Icons.school, size: 60, color: Colors.white),
                        SizedBox(height: 16),
                        Text(
                          'College Search',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Find your perfect match',
                          style: TextStyle(fontSize: 18, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Search Form Card
                  Card(
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Search Criteria',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2a5298),
                              ),
                            ),
                            const SizedBox(height: 24),

                            // Name fields row
                            Row(
                              children: [
                                Expanded(
                                  child: _buildTextField(
                                    controller: _fnameController,
                                    label: 'First Name',
                                    icon: Icons.person,
                                    validator:
                                        (value) =>
                                            value?.trim().isEmpty == true
                                                ? 'Required'
                                                : null,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: _buildTextField(
                                    controller: _lnameController,
                                    label: 'Last Name',
                                    icon: Icons.person_outline,
                                    validator:
                                        (value) =>
                                            value?.trim().isEmpty == true
                                                ? 'Required'
                                                : null,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),

                            // GPA Field
                            _buildTextField(
                              controller: _gpaController,
                              label: 'GPA',
                              icon: Icons.grade,
                              keyboardType: TextInputType.numberWithOptions(
                                decimal: true,
                              ),
                              validator: (value) {
                                if (value?.trim().isEmpty == true)
                                  return 'Please enter your GPA';
                                final gpa = double.tryParse(value!);
                                if (gpa == null || gpa < 0 || gpa > 4.0) {
                                  return 'Enter valid GPA (0.0 - 4.0)';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),

                            // Dropdowns row
                            Row(
                              children: [
                                Expanded(
                                  child: _buildDropdown<int>(
                                    value: _selectedSize,
                                    label: 'School Size',
                                    icon: Icons.groups,
                                    items:
                                        _sizeOptions.entries
                                            .map(
                                              (e) => DropdownMenuItem<int>(
                                                value: e.value,
                                                child: Text(e.key),
                                              ),
                                            )
                                            .toList(),
                                    onChanged:
                                        (value) => setState(
                                          () => _selectedSize = value!,
                                        ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: _buildDropdown<String>(
                                    value: _selectedRegion,
                                    label: 'Region',
                                    icon: Icons.location_on,
                                    items:
                                        _regions
                                            .map(
                                              (region) =>
                                                  DropdownMenuItem<String>(
                                                    value: region,
                                                    child: Text(
                                                      region[0].toUpperCase() +
                                                          region.substring(1),
                                                    ),
                                                  ),
                                            )
                                            .toList(),
                                    onChanged:
                                        (value) => setState(
                                          () => _selectedRegion = value!,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 32),

                            // Search Button
                            Center(
                              child: ElevatedButton(
                                onPressed: _search,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF2a5298),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 48,
                                    vertical: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  elevation: 8,
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.search, size: 24),
                                    SizedBox(width: 8),
                                    Text(
                                      'Search Colleges',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Home Button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to home or reset form
                        Navigator.of(
                          context,
                        ).popUntil((route) => route.isFirst);
                        // Or if you want to reset the form instead:
                        // _resetForm();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF2a5298),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 48,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(
                            color: Color(0xFF2a5298),
                            width: 2,
                          ),
                        ),
                        elevation: 8,
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.home, size: 24),
                          SizedBox(width: 8),
                          Text('Home', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Results Section
                  if (_personalInfo != null) ...[
                    Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.assignment,
                                  color: Color(0xFF2a5298),
                                  size: 28,
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  _personalInfo!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color(0xFF2a5298),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),

                            if (_searchResults.isNotEmpty) ...[
                              Text(
                                'Found ${_searchResults.length} matching colleges',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: DataTable(
                                    headingRowColor:
                                        MaterialStateColor.resolveWith(
                                          (states) => const Color(
                                            0xFF2a5298,
                                          ).withOpacity(0.1),
                                        ),
                                    columns: const [
                                      DataColumn(
                                        label: Text(
                                          'College',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Location',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Region',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Admission Rate',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Min GPA',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Enrollment',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'African-American %',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Total Cost',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                    rows:
                                        _searchResults.map((college) {
                                          return DataRow(
                                             cells: [
                                              DataCell(
                                                InkWell(
                                                  onTap: () async {
                                                    final link = college[8];
                                                    final Uri url = Uri.parse(link);
                                                    if (await canLaunchUrl(url)) {
                                                      await launchUrl(url, mode: LaunchMode.externalApplication);
                                                    } else {
                                                      throw 'Could not launch $url';
                                                    }
                                                  },
                                                  child: Text(
                                                    college[0],
                                                    style: const TextStyle(
                                                      color: Color(0xFF2a5298),
                                                      decoration:
                                                          TextDecoration
                                                              .underline,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              DataCell(Text(college[1])),
                                              DataCell(
                                                Container(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 8,
                                                        vertical: 4,
                                                      ),
                                                  decoration: BoxDecoration(
                                                    color: _getRegionColor(
                                                      college[2],
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          12,
                                                        ),
                                                  ),
                                                  child: Text(
                                                    college[2],
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              DataCell(
                                                Text(
                                                  '${(college[3] * 100).round()}%',
                                                ),
                                              ),
                                              DataCell(
                                                Text(college[4].toString()),
                                              ),
                                              DataCell(
                                                Text(college[5].toString()),
                                              ),
                                              DataCell(
                                                Text(
                                                  '${(college[6] * 100).round()}%',
                                                ),
                                              ),
                                              DataCell(
                                                Text(
                                                  college[7],
                                                  style: const TextStyle(
                                                    color: Colors.green,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        }).toList(),
                                  ),
                                ),
                              ),
                            ] else ...[
                              const Center(
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.search_off,
                                      size: 64,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(height: 16),
                                    Text(
                                      'No colleges matched your criteria.',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Try adjusting your search parameters.',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: const Color(0xFF2a5298)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF2a5298), width: 2),
        ),
        filled: true,
        fillColor: Colors.grey.shade50,
      ),
    );
  }

  Widget _buildDropdown<T>({
    required T value,
    required String label,
    required IconData icon,
    required List<DropdownMenuItem<T>> items,
    required void Function(T?) onChanged,
  }) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: const Color(0xFF2a5298)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        filled: true,
        fillColor: Colors.grey.shade50,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          isExpanded: true,
          onChanged: onChanged,
          items: items,
        ),
      ),
    );
  }

  Color _getRegionColor(String region) {
    switch (region) {
      case 'north':
        return Colors.blue;
      case 'south':
        return Colors.orange;
      case 'east':
        return Colors.green;
      case 'west':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }
}
